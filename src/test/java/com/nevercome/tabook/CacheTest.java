package com.nevercome.tabook;

import com.nevercome.tabook.modules.book.entity.info.BookInfo;
import com.nevercome.tabook.modules.book.service.info.BookInfoService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author: sun
 * @date: 2019/5/4
 */
public class CacheTest extends BaseTest {

    @Autowired
    private BookInfoService bookInfoService;

    @Test
    public void cacheTest() {
        BookInfo bookInfo = bookInfoService.getByBookRootId("01a2d02d741642ad912296bff9317860");
        System.out.println(bookInfo);
        BookInfo bookInfo1 = bookInfoService.getByBookRootId("01a2d02d741642ad912296bff9317860");
        System.out.println(bookInfo1);
    }
}
