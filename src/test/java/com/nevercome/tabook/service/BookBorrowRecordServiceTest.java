package com.nevercome.tabook.service;

import com.nevercome.tabook.BaseTest;
import com.nevercome.tabook.modules.book.entity.borrow.BookBorrowRecord;
import com.nevercome.tabook.modules.book.service.borrow.BookBorrowRecordService;
import com.nevercome.tabook.modules.book.service.buy.BookBuyRecordService;
import com.nevercome.tabook.modules.book.utils.BookConstant;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author: sun
 * @date: 2019/5/6
 */
public class BookBorrowRecordServiceTest extends BaseTest {

    @Autowired
    private BookBorrowRecordService bookBorrowRecordService;

    private BookBorrowRecord bookBorrowRecord;

    @Before
    public void before() {
        bookBorrowRecord = new BookBorrowRecord();
        bookBorrowRecord.setRequesterId("sun-1");
        bookBorrowRecord.setStatus(BookConstant.BOOK_REQUEST_STATUS_REQUESTING);
        bookBorrowRecord.setBookInstanceId("10c8565b9e8545ceb1cb7daa8ba72a9e");
        bookBorrowRecord.setRequesterWords("下半年,中美合拍的...文体两开花");
        bookBorrowRecord.setType("1");
    }

    @Test
    public void saveTest(){
        bookBorrowRecordService.save(bookBorrowRecord);
        System.out.println(bookBorrowRecord);
    }

    @Test
    public void listTest() {
        System.out.println(bookBorrowRecordService.findList(bookBorrowRecord).size());
    }

}
