package com.nevercome.tabook.modules.sys.web;

import com.google.common.collect.Maps;
import com.nevercome.tabook.common.security.shiro.session.JedisSessionDAO;
import com.nevercome.tabook.common.utils.CacheUtils;
import com.nevercome.tabook.common.web.BaseController;
import com.nevercome.tabook.common.web.Result;
import com.nevercome.tabook.modules.sys.security.SystemAuthorizingRealm;
import com.nevercome.tabook.modules.sys.service.SystemService;
import com.nevercome.tabook.modules.sys.utils.UserUtils;
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

    /**
     * 获取applet的code 调用微信接口获取openId session_key unionId
     */
    @RequestMapping(value = "${adminPath}/login")
    public ResponseEntity login(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        System.err.println(username);
        UsernamePasswordToken token = new UsernamePasswordToken(username, "");
        Subject subject = SecurityUtils.getSubject();
        subject.login(token);
        SystemAuthorizingRealm.Principal principal = UserUtils.getPrincipal();
        System.err.println(request.getSession().getId());
        if (principal != null && UserUtils.getSession() != null) {
            Object sessionId = UserUtils.getSession().getId().toString();
            System.err.println(sessionId.toString());
            return new ResponseEntity<>(new Result(sessionId), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(new Result(Result.RESULT_ERROR, "登录异常，请稍后重试！"), HttpStatus.BAD_REQUEST);
        }
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

}
