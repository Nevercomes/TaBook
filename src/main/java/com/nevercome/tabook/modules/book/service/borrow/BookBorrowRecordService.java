package com.nevercome.tabook.modules.book.service.borrow;

import com.nevercome.tabook.common.service.CrudService;
import com.nevercome.tabook.modules.book.dao.borrow.BookBorrowRecordDao;
import com.nevercome.tabook.modules.book.entity.borrow.BookBorrowRecord;
import org.springframework.stereotype.Service;

/**
 * @author: sun
 * @date: 2019/4/26
 */
@Service
public class BookBorrowRecordService  extends CrudService<BookBorrowRecordDao, BookBorrowRecord> {
}
