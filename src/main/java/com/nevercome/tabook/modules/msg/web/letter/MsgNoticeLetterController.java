package com.nevercome.tabook.modules.msg.web.letter;

import com.nevercome.tabook.common.persistence.Page;
import com.nevercome.tabook.common.web.BaseController;
import com.nevercome.tabook.common.web.Result;
import com.nevercome.tabook.modules.msg.entity.letter.MsgNoticeLetter;
import com.nevercome.tabook.modules.msg.entity.notice.MsgNotice;
import com.nevercome.tabook.modules.msg.service.letter.MsgNoticeLetterService;
import com.nevercome.tabook.modules.msg.service.notice.MsgNoticeService;
import com.nevercome.tabook.modules.sys.utils.UserUtils;
import com.nevercome.tabook.modules.utils.MsgConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author: sun
 * @date: 2019/5/14
 */
@Controller
@RequestMapping(value = "${adminPath}/msg/letter")
public class MsgNoticeLetterController extends BaseController {

    @Autowired
    private MsgNoticeLetterService msgNoticeLetterService;
    @Autowired
    private MsgNoticeService msgNoticeService;

    @RequestMapping(value = "list")
    public ResponseEntity list(HttpServletRequest request, HttpServletResponse response) {
        MsgNoticeLetter msgNoticeLetter = new MsgNoticeLetter();
        msgNoticeLetter.setReceiveUserId(UserUtils.getUser().getId());
        Page<MsgNoticeLetter> page = msgNoticeLetterService.findPage(new Page<>(request, response), msgNoticeLetter);
        return new ResponseEntity<>(new Result(page), HttpStatus.OK);
    }

    @RequestMapping(value = "get")
    public ResponseEntity get(MsgNoticeLetter msgNoticeLetter) {
        msgNoticeLetter = msgNoticeLetterService.get(msgNoticeLetter);
        return new ResponseEntity<>(new Result(msgNoticeLetter), HttpStatus.OK);
    }

    @RequestMapping(value = "getNew")
    public ResponseEntity getNew() {
        MsgNotice query = new MsgNotice();
        query.setUserId(UserUtils.getUser().getId());
        query.setType(MsgConstant.MSG_NOTICE_TYPE_LETTER);
        List<MsgNotice> list = msgNoticeService.findList(query);
        return new ResponseEntity<>(new Result(list.size()), HttpStatus.OK);
    }

}
