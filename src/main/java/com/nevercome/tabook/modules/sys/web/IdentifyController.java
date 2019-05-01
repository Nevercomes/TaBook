package com.nevercome.tabook.modules.sys.web;

import com.nevercome.tabook.common.web.BaseController;
import com.nevercome.tabook.common.web.Result;
import com.nevercome.tabook.modules.sys.entity.Identity;
import com.nevercome.tabook.modules.sys.entity.User;
import com.nevercome.tabook.modules.sys.service.IdentityService;
import com.nevercome.tabook.modules.sys.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 实名认证Controller
 *
 * @Author: sun
 * @Description:
 * @Date: 2019/4/3
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/identify")
public class IdentifyController extends BaseController {

    @Autowired
    private IdentityService identityService;

    /**
     * 这个方法的数据安全非常重要
     * 认证之后为用户添加student role
     */
    @RequestMapping(value = "")
    public ResponseEntity identify(HttpServletRequest request, Identity identity) {
        User user = UserUtils.getUser();
        identity.setUserId(user.getId());
        // 执行认证
        if (identityService.identify(identity)) {
            return new ResponseEntity<>(new Result(), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(new Result(HttpStatus.OK, Result.RESULT_FAIL, "认证失败"), HttpStatus.OK);
        }
    }

}
