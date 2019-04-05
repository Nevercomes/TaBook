package com.nevercome.tabook.modules.sys.security;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.nevercome.tabook.common.utils.IdGen;
import com.nevercome.tabook.common.utils.JedisUtils;
import com.nevercome.tabook.modules.sys.entity.User;
import org.springframework.stereotype.Component;

import java.io.UnsupportedEncodingException;
import java.util.Date;

/**
 * @description:
 * JWT的核心配置，包括Token的加密创建，JWT的续期，解密验证
 * @author: sun
 * @date: 2019/4/4
 */
@Component
public class JwtConfig {

    /**
     * JWT 自定义密钥
     */
    private static final String SECRET_KEY = "5371f568a45e5ab1f442c38e0932aef24447139b";

    /**
     * redis JWT Session的prefix
     */
    private static final String REDIS_JWT_PREFIX = "JWT-SESSION-";

    /**
     * JWT 过期时间值 这里写死为和小程序时间一致 7200 秒，也就是两个小时
     */
    private static int expire_time = 7200;

    /**
     * 根据调用微信的接口之后根据返回的openId创建token
     * token将被缓存到redis中
     * @param user
     * @return jwt的token
     */
    public String createToken(User user) {
        // JWT 随机ID,做为验证的key
        String jwtId = IdGen.uuid().toString();
        // 加密签名得到token
        try {
            Algorithm algorithm = Algorithm.HMAC256(SECRET_KEY);
            String token = JWT.create()
                    .withClaim("openId", user.getOpenId())
                    .withClaim("sessionKey", user.getSessionKey())
                    .withClaim("jwd-id", jwtId)
                    .withExpiresAt(new Date(System.currentTimeMillis() + expire_time*1000))
                    .sign(algorithm);
            // redis 缓存
            JedisUtils.set(REDIS_JWT_PREFIX + jwtId, token, expire_time);
            return token;
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean verifyToken(String token) {
        try {
            // 根据token解密，解密出jwt-id , 先从redis中查找出redisToken，匹配是否相同
            String redisToken = JedisUtils.get(REDIS_JWT_PREFIX + getOpenIdByToken(token));
            if (!redisToken.equals(token)) return false;

            // 得到算法相同的JWTVerifier
            Algorithm algorithm = Algorithm.HMAC256(SECRET_KEY);
            JWTVerifier verifier = JWT.require(algorithm)
                    .withClaim("openId", getOpenIdByToken(redisToken))
                    .withClaim("sessionKey", getSessionKeyByToken(redisToken))
                    .withClaim("jwt-id", getJwtIdByToken(redisToken))
                    .acceptExpiresAt(System.currentTimeMillis() + expire_time*1000 )  //JWT 正确的配置续期姿势
                    .build();
            // 验证token
            verifier.verify(redisToken);
            // 为Redis缓存续期
            JedisUtils.set(REDIS_JWT_PREFIX + getJwtIdByToken(token), token, expire_time);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * 根据Token获取openId(注意坑点 : 就算token不正确，也有可能解密出openId,同下)
     */
    public String getOpenIdByToken(String token) throws JWTDecodeException {
        return JWT.decode(token).getClaim("openId").asString();
    }

    public String getSessionKeyByToken(String token) {
        return JWT.decode(token).getClaim("sessionKey").asString();
    }

    private String getJwtIdByToken(String token) {
        return JWT.decode(token).getClaim("jwd-id").asString();
    }

}
