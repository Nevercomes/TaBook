package com.nevercome.tabook.modules.book.dao.like;

import com.nevercome.tabook.common.persistence.CrudDao;
import com.nevercome.tabook.common.persistence.annotation.MyBatisDao;
import com.nevercome.tabook.modules.book.entity.like.BookLikeRecord;

/**
 * @author: sun
 * @date: 2019/4/30
 */
@MyBatisDao
public interface BookLikeRecordDao extends CrudDao<BookLikeRecord> {
}
