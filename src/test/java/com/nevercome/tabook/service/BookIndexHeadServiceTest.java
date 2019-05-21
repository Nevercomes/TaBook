package com.nevercome.tabook.service;

import com.nevercome.tabook.BaseTest;
import com.nevercome.tabook.modules.book.entity.index.BookIndexHead;
import com.nevercome.tabook.modules.book.service.index.BookIndexHeadService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author: sun
 * @date: 2019/5/21
 */
public class BookIndexHeadServiceTest extends BaseTest {

    @Autowired
    private BookIndexHeadService bookIndexHeadService;


    @Test
    public void testFindList() {
        bookIndexHeadService.findList(new BookIndexHead());
    }

}
