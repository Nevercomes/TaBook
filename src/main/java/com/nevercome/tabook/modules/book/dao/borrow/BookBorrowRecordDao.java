package com.nevercome.tabook.modules.book.dao.borrow;

import com.nevercome.tabook.common.persistence.CrudDao;
import com.nevercome.tabook.common.persistence.annotation.MyBatisDao;
import com.nevercome.tabook.modules.book.entity.borrow.BookBorrowRecord;

/**
 * @author: sun
 * @date: 2019/4/26
 */
@MyBatisDao
public interface BookBorrowRecordDao extends CrudDao<BookBorrowRecord> {

}
