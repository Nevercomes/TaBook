package com.nevercome.tabook.modules.book.dao.comment;

import com.nevercome.tabook.common.persistence.CrudDao;
import com.nevercome.tabook.common.persistence.annotation.MyBatisDao;
import com.nevercome.tabook.modules.book.entity.comment.BookLongComment;

/**
 * @author: sun
 * @date: 2019/4/30
 */
@MyBatisDao
public interface BookLongCommentDao extends CrudDao<BookLongComment> {
}
