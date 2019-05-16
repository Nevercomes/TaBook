package com.nevercome.tabook.modules.msg.web.notice;

import com.nevercome.tabook.common.web.Result;
import com.nevercome.tabook.modules.msg.entity.notice.MsgNotice;
import com.nevercome.tabook.modules.msg.service.notice.MsgNoticeService;
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
@RequestMapping(value = "${adminPath}/msg/notice")
public class MsgNoticeController {

    @Autowired
    private MsgNoticeService msgNoticeService;

    @RequestMapping(value = "getNew")
    public ResponseEntity getNew() {
        MsgNotice query = new MsgNotice();
        query.setUserId(UserUtils.getUser().getId());
        List<MsgNotice> list = msgNoticeService.findList(query);
        return new ResponseEntity<>(new Result(list.size()), HttpStatus.OK);
    }
}
