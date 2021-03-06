package com.nevercome.tabook;

import com.nevercome.tabook.common.utils.CacheUtils;
import com.nevercome.tabook.modules.book.entity.info.BookInfo;
import com.nevercome.tabook.modules.book.service.info.BookInfoService;
import com.nevercome.tabook.modules.sys.entity.User;
import com.nevercome.tabook.modules.sys.utils.UserUtils;
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

    @Test
    public void removeTest() {
        User user = new User("1e50d4c66b8848779860fbc308ee9438");
        UserUtils.clearCache(user);
    }
}
