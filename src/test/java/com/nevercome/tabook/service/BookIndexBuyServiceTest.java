package com.nevercome.tabook.service;

import com.nevercome.tabook.BaseTest;
import com.nevercome.tabook.modules.book.entity.index.BookIndexBuy;
import com.nevercome.tabook.modules.book.service.index.BookIndexBuyService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author: sun
 * @date: 2019/5/22
 */
public class BookIndexBuyServiceTest extends BaseTest {

    @Autowired
    private BookIndexBuyService bookIndexBuyService;

    @Test
    public void testFindList() {
        bookIndexBuyService.findList(new BookIndexBuy());
    }

}
