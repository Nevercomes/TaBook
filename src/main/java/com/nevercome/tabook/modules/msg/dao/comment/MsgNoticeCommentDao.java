package com.nevercome.tabook.modules.msg.dao.comment;

import com.nevercome.tabook.common.persistence.CrudDao;
import com.nevercome.tabook.common.persistence.annotation.MyBatisDao;
import com.nevercome.tabook.modules.msg.entity.comment.MsgNoticeComment;

/**
 * @author: sun
 * @date: 2019/5/14
 */
@MyBatisDao
public interface MsgNoticeCommentDao extends CrudDao<MsgNoticeComment> {
}
