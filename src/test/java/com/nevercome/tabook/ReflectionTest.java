package com.nevercome.tabook;

import com.nevercome.tabook.common.utils.IdGen;
import com.nevercome.tabook.common.utils.Reflections;
import com.nevercome.tabook.common.utils.StringUtils;
import com.nevercome.tabook.modules.book.entity.add.BookInfoAdd;
import com.nevercome.tabook.modules.book.entity.info.BookInfo;
import com.nevercome.tabook.modules.book.service.add.BookInfoAddService;
import com.nevercome.tabook.modules.book.service.info.BookInfoService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author: sun
 * @date: 2019/5/5
 */
public class ReflectionTest extends BaseTest {

    @Autowired
    private BookInfoService bookInfoService;
    @Autowired
    private BookInfoAddService bookInfoAddService;

    @Test
    public void setTest() {

        BookInfoAdd bookInfoAdd = new BookInfoAdd();
        Object bookInfoField = Reflections.getAccessibleField(bookInfoAdd, "bookInfo");
        bookInfoAdd.setBookRootId("0236414215b44c0caf85cf3e2fdd220c");
        if (bookInfoField != null) {
            Object bookInstanceIdField = Reflections.getAccessibleField(bookInfoAdd, "bookInstanceId");
            Object bookClassField = Reflections.getAccessibleField(bookInfoAdd, "bookClassId");
            Object bookRootField = Reflections.getAccessibleField(bookInfoAdd, "bookRootId");
            if (bookInstanceIdField != null) {
                String bookInstanceId = (String) Reflections.getFieldValue(bookInfoAdd, "bookInstanceId");
                if (StringUtils.isNotBlank(bookInstanceId)) {
                    BookInfo bookInfo = bookInfoService.getByBookInstanceId(bookInstanceId);
                    Reflections.setFieldValue(bookInfoAdd, "bookInfo", bookInfo);
                }
            }
            if (bookClassField != null && bookInfoAdd.getBookInfo() == null) {
                String bookClassId = (String) Reflections.getFieldValue(bookInfoAdd, "bookClassId");
                if (StringUtils.isNotBlank(bookClassId)) {
                    BookInfo bookInfo = bookInfoService.getByBookClassId(bookClassId);
                    Reflections.setFieldValue(bookInfoAdd, "bookInfo", bookInfo);
                }
            }
            if (bookRootField != null && bookInfoAdd.getBookInfo() == null) {
                String bookRootId = (String) Reflections.getFieldValue(bookInfoAdd, "bookRootId");
                if (StringUtils.isNotBlank(bookRootId)) {
                    BookInfo bookInfo = bookInfoService.getByBookRootId(bookRootId);
                    Reflections.setFieldValue(bookInfoAdd, "bookInfo", bookInfo);
                }
            }
        }
        System.out.println(bookInfoAdd);

    }

    @Test
    public void injectTest() {
        BookInfoAdd bookInfoAdd = new BookInfoAdd();
        bookInfoAdd.setId("7c825f3a04b24100bd1784bf96fb10ab");
        bookInfoAdd = bookInfoAddService.get(bookInfoAdd);
        System.out.println(bookInfoAdd);
    }


}
