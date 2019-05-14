package com.nevercome.tabook.modules.msg.service.comment;

import com.nevercome.tabook.common.service.CrudService;
import com.nevercome.tabook.modules.msg.dao.comment.MsgNoticeCommentDao;
import com.nevercome.tabook.modules.msg.dao.notice.MsgNoticeDao;
import com.nevercome.tabook.modules.msg.entity.comment.MsgNoticeComment;
import org.springframework.stereotype.Service;

/**
 * @author: sun
 * @date: 2019/5/14
 */
@Service
public class MsgNoticeCommentService extends CrudService<MsgNoticeCommentDao, MsgNoticeComment> {
}
