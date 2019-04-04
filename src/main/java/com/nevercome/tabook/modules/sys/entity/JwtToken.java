package com.nevercome.tabook.modules.sys.entity;

import lombok.Data;
import org.apache.shiro.authc.AuthenticationToken;

/**
 * @description:
 * 鉴权用的token, 实现 AuthenticationToken
 * 这里我们无法使用UsernameAndPasswordToken的是
 * @author: sun
 * @date: 2019/4/4
 */
@Data
public class JwtToken implements AuthenticationToken {

    private String token;

    public JwtToken(String token) {
        this.token = token;
    }

    @Override
    public Object getPrincipal() {
        return token;
    }

    @Override
    public Object getCredentials() {
        return token;
    }
}
