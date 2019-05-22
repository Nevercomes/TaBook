package com.nevercome.tabook.modules.sys.web;

import com.google.common.collect.Maps;
import com.nevercome.tabook.common.config.Global;
import com.nevercome.tabook.common.security.shiro.session.JedisSessionDAO;
import com.nevercome.tabook.common.utils.CacheUtils;
import com.nevercome.tabook.common.utils.FileUtils;
import com.nevercome.tabook.common.utils.IdGen;
import com.nevercome.tabook.common.utils.StringUtils;
import com.nevercome.tabook.common.web.BaseController;
import com.nevercome.tabook.common.web.Result;
import com.nevercome.tabook.modules.sys.dao.UserDao;
import com.nevercome.tabook.modules.sys.entity.User;
import com.nevercome.tabook.modules.sys.security.SystemAuthorizingRealm;
import com.nevercome.tabook.modules.sys.service.SystemService;
import com.nevercome.tabook.modules.sys.utils.UserUtils;
import okhttp3.*;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Map;

/**
 * 登录Controller
 *
 * @author sun
 * @version 2019-04
 */
@Controller
public class LoginController extends BaseController {

    @Autowired
    private JedisSessionDAO sessionDAO;
    @Autowired
    private SystemService systemService;
    @Autowired
    private UserDao userDao;

    /**
     * 获取applet的code 调用微信接口获取openId session_key unionId
     */
    @RequestMapping(value = "${adminPath}/login")
    public ResponseEntity login(HttpServletRequest request, HttpServletResponse response) {
        String code = request.getParameter("code");
        UsernamePasswordToken token = new UsernamePasswordToken(code, "");
        Subject subject = SecurityUtils.getSubject();
        subject.login(token);
        SystemAuthorizingRealm.Principal principal = UserUtils.getPrincipal();
        if (principal != null && UserUtils.getSession() != null) {
            Object sessionId = UserUtils.getSession().getId().toString();
            return new ResponseEntity<>(new Result(sessionId), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(new Result(HttpStatus.BAD_REQUEST, Result.RESULT_FAIL, "登录异常，请稍后重试！"), HttpStatus.BAD_REQUEST);
        }
    }

    @RequiresPermissions("user")
    @RequestMapping(value = "${adminPath}/uploadWxInfo")
    public ResponseEntity uploadWxInfo(HttpServletRequest request) {
        String name = request.getParameter("nickName");
        String avatarUrl = request.getParameter("avatarUrl");
        User user = UserUtils.getUser();
        System.err.println(user);
        if ("0".equals(user.getInit())) {
            user.setName(name);
            // 头像应该被保存在本地
            // 1. 根据Url下载头像
            // 2. 将头像保存在本地
            // 3. 生成头像的Url连接
            // 4. 存入这个新的Url连接
            if(StringUtils.isNotBlank(avatarUrl)) {
                OkHttpClient okHttpClient = new OkHttpClient();
                Request okRequest = new Request.Builder().url(avatarUrl).build();
//                Call call = okHttpClient.newCall(okRequest);
                Call call = okHttpClient.newCall(okRequest);
                try {
                    Response okResponse = call.execute();
                    InputStream inputStream = okResponse.body().byteStream();
                    String baseDir = FileUtils.path(Global.getUserFilesBaseDir() + Global.USERFILES_BASE_URL + "avatar/");
                    String uuId = IdGen.uuid();
                    File file = new File(baseDir + uuId) ;
                    FileOutputStream fos = new FileOutputStream(file);
                    try {
                        fos.write(readInputStream(inputStream));
                        fos.flush();
                        user.setAvatarUrl(baseDir + uuId);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    fos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
//                okHttpClient.newCall(okRequest).enqueue(new Callback() {
//
//                    @Override
//                    public void onFailure(Call call, IOException e) {
//
//                    }
//
//                    @Override
//                    public void onResponse(Call call, Response okResponse) throws IOException {
//                        InputStream inputStream = okResponse.body().byteStream();
//                        String baseDir = FileUtils.path(Global.getUserFilesBaseDir() + Global.USERFILES_BASE_URL + "avatar/");
//                        String uuId = IdGen.uuid();
//                        File file = new File(baseDir + uuId) ;
//                        FileOutputStream fos = new FileOutputStream(file);
//                        try {
//                            fos.write(readInputStream(inputStream));
//                            fos.flush();
//                            user.setAvatarUrl(baseDir + uuId);
//                        } catch (Exception e) {
//                            e.printStackTrace();
//                        }
//                        fos.close();
//                    }
//                });
            }
//            user.setAvatarUrl(avatarUrl);
            userDao.updateWxInfo(user);
        }
        return new ResponseEntity<>(new Result(), HttpStatus.OK);
    }

    /**
     * 认证测试类
     */
    @RequiresPermissions("user")
    @RequestMapping(value = "${adminPath}/index")
    public ResponseEntity index(HttpServletRequest request, HttpServletResponse response) {
        return new ResponseEntity<>(new Result("hello"), HttpStatus.OK);
    }

    /**
     * 是否是验证码登录
     *
     * @param username 用户名
     * @param isFail   计数加1
     * @param clean    计数清零
     * @return
     */

    @SuppressWarnings("unchecked")
    public static boolean isValidateCodeLogin(String username, boolean isFail, boolean clean) {
        Map<String, Integer> loginFailMap = (Map<String, Integer>) CacheUtils.get("loginFailMap");
        if (loginFailMap == null) {
            loginFailMap = Maps.newHashMap();
            CacheUtils.put("loginFailMap", loginFailMap);
        }
        Integer loginFailNum = loginFailMap.get(username);
        if (loginFailNum == null) {
            loginFailNum = 0;
        }
        if (isFail) {
            loginFailNum++;
            loginFailMap.put(username, loginFailNum);
        }
        if (clean) {
            loginFailMap.remove(username);
        }
        return loginFailNum >= 3;
    }

    private byte[] readInputStream(InputStream inStream) throws Exception {
        ByteArrayOutputStream outStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        int len = 0;
        while ((len = inStream.read(buffer)) != -1) {
            outStream.write(buffer, 0, len);
        }
        inStream.close();
        return outStream.toByteArray();
    }

}
