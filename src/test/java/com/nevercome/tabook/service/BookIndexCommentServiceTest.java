package com.nevercome.tabook.service;

import com.nevercome.tabook.BaseTest;
import com.nevercome.tabook.modules.book.entity.index.BookIndexComment;
import com.nevercome.tabook.modules.book.service.index.BookIndexCommentService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author: sun
 * @date: 2019/5/21
 */
public class BookIndexCommentServiceTest extends BaseTest {

    @Autowired
    private BookIndexCommentService bookIndexCommentService;

    @Test
    public void testFindList() {
        bookIndexCommentService.findList(new BookIndexComment());
    }

}
