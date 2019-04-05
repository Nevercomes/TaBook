package com.nevercome.tabook.modules.sys.web;

import com.google.common.collect.Maps;
import com.nevercome.tabook.common.security.shiro.session.SessionDAO;
import com.nevercome.tabook.common.utils.CacheUtils;
import com.nevercome.tabook.common.utils.StringUtils;
import com.nevercome.tabook.common.web.BaseController;
import com.nevercome.tabook.common.web.Result;
import com.nevercome.tabook.modules.sys.entity.Token;
import com.nevercome.tabook.modules.sys.service.SystemService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
    private SessionDAO sessionDAO;
    @Autowired
    private SystemService systemService;

    /**
     * 获取applet的code 调用微信接口获取openId session_key unionId
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "${adminPath}/login", method = RequestMethod.POST)
    public ResponseEntity login(HttpServletRequest request, HttpServletResponse response) {
        String code = request.getParameter("code");
        try {
            Token token = systemService.wxUserLogin(code);
            if (token != null && StringUtils.isNotBlank(token.getToken())) {
                return new ResponseEntity<>(new Result(token), HttpStatus.OK);
            } else {
                return new ResponseEntity<>(new Result(Result.RESULT_ERROR, "need code parameter"), HttpStatus.BAD_REQUEST);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(new Result(Result.RESULT_ERROR, e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * 是否是验证码登录
     *
     * @param useruame 用户名
     * @param isFail   计数加1
     * @param clean    计数清零
     * @return
     */

    @SuppressWarnings("unchecked")
    public static boolean isValidateCodeLogin(String useruame, boolean isFail, boolean clean) {
        Map<String, Integer> loginFailMap = (Map<String, Integer>) CacheUtils.get("loginFailMap");
        if (loginFailMap == null) {
            loginFailMap = Maps.newHashMap();
            CacheUtils.put("loginFailMap", loginFailMap);
        }
        Integer loginFailNum = loginFailMap.get(useruame);
        if (loginFailNum == null) {
            loginFailNum = 0;
        }
        if (isFail) {
            loginFailNum++;
            loginFailMap.put(useruame, loginFailNum);
        }
        if (clean) {
            loginFailMap.remove(useruame);
        }
        return loginFailNum >= 3;
    }

}
