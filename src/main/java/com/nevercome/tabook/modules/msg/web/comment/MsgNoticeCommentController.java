package com.nevercome.tabook.modules.msg.web.comment;

import com.nevercome.tabook.common.config.Global;
import com.nevercome.tabook.common.persistence.Page;
import com.nevercome.tabook.common.web.BaseController;
import com.nevercome.tabook.common.web.Result;
import com.nevercome.tabook.modules.msg.entity.comment.MsgNoticeComment;
import com.nevercome.tabook.modules.msg.entity.notice.MsgNotice;
import com.nevercome.tabook.modules.msg.entity.sys.MsgNoticeSys;
import com.nevercome.tabook.modules.msg.service.comment.MsgNoticeCommentService;
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
import java.util.Date;
import java.util.List;

/**
 * @author: sun
 * @date: 2019/5/14
 */
@Controller
@RequestMapping(value = "{adminPath}/msg/comment")
public class MsgNoticeCommentController extends BaseController {

    @Autowired
    private MsgNoticeCommentService msgNoticeCommentService;
    @Autowired
    private MsgNoticeService msgNoticeService;

    @RequestMapping(value = "list")
    public ResponseEntity list(HttpServletRequest request, HttpServletResponse response) {
        MsgNoticeComment msgNoticeComment = new MsgNoticeComment();
        msgNoticeComment.setUserId(UserUtils.getUser().getId());
        Page<MsgNoticeComment> page = msgNoticeCommentService.findPage(new Page<>(request, response), msgNoticeComment);

        // 更新操作
        MsgNotice msgNotice = new MsgNotice();
        msgNotice.setUserId(UserUtils.getUser().getId());
        msgNotice.setType(MsgConstant.MSG_NOTICE_TYPE_COMMENT);
        msgNotice.setReadFlag(Global.YES);
        msgNotice.setReadTime(new Date());
        msgNoticeService.updateRead(msgNotice);

        return new ResponseEntity<>(new Result(page), HttpStatus.OK);
    }

    @RequestMapping(value = "getNew")
    public ResponseEntity getNew() {
        MsgNotice query = new MsgNotice();
        query.setUserId(UserUtils.getUser().getId());
        query.setType(MsgConstant.MSG_NOTICE_TYPE_COMMENT);
        List<MsgNotice> list = msgNoticeService.findList(query);
        return new ResponseEntity<>(new Result(list.size()), HttpStatus.OK);
    }

}
