package com.nevercome.tabook.service;

import com.nevercome.tabook.BaseTest;
import com.nevercome.tabook.modules.book.entity.index.BookIndexBorrow;
import com.nevercome.tabook.modules.book.service.index.BookIndexBorrowService;
import com.nevercome.tabook.modules.book.service.index.BookIndexBuyService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author: sun
 * @date: 2019/5/22
 */
public class BookIndexBorrowServiceTest extends BaseTest {

    @Autowired
    private BookIndexBorrowService bookIndexBorrowService;

    @Test
    public void testFindList() {
        bookIndexBorrowService.findList(new BookIndexBorrow());
    }

}
