package com.nevercome.tabook.modules.msg.web.sys;

import com.nevercome.tabook.common.web.BaseController;
import com.nevercome.tabook.common.web.Result;
import com.nevercome.tabook.modules.msg.entity.notice.MsgNotice;
import com.nevercome.tabook.modules.msg.entity.sys.MsgNoticeSys;
import com.nevercome.tabook.modules.msg.service.notice.MsgNoticeService;
import com.nevercome.tabook.modules.msg.service.sys.MsgNoticeSysService;
import com.nevercome.tabook.modules.sys.utils.UserUtils;
import com.nevercome.tabook.modules.utils.MsgConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author: sun
 * @date: 2019/5/14
 */
@Controller
@RequestMapping("{adminPath}/msg/sys")
public class MsgNoticeSysController extends BaseController {

    @Autowired
    private MsgNoticeSysService msgNoticeSysService;
    @Autowired
    private MsgNoticeService msgNoticeService;

    @RequestMapping(value = "list")
    public ResponseEntity list() {
        MsgNoticeSys query = new MsgNoticeSys();
        query.setUserId(UserUtils.getUser().getId());
        List<MsgNoticeSys> list = msgNoticeSysService.findList(query);
        return new ResponseEntity<>(new Result(list), HttpStatus.OK);
    }

    @RequestMapping(value = "getNew")
    public ResponseEntity getNew() {
        MsgNotice query = new MsgNotice();
        query.setUserId(UserUtils.getUser().getId());
        query.setType(MsgConstant.MSG_NOTICE_TYPE_SYS);
        List<MsgNotice> list = msgNoticeService.findList(query);
        return new ResponseEntity<>(new Result(list.size()), HttpStatus.OK);
    }
}
