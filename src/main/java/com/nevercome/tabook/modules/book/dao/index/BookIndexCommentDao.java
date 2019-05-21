package com.nevercome.tabook.modules.book.dao.index;

import com.nevercome.tabook.common.persistence.CrudDao;
import com.nevercome.tabook.common.persistence.annotation.MyBatisDao;
import com.nevercome.tabook.modules.book.entity.index.BookIndexComment;

/**
 * @author: sun
 * @date: 2019/5/21
 */
@MyBatisDao
public interface BookIndexCommentDao extends CrudDao<BookIndexComment> {
}
