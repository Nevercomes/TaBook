package com.nevercome.tabook.modules.book.service.info;

import com.nevercome.tabook.common.service.CrudService;
import com.nevercome.tabook.modules.book.dao.info.BookInfoDao;
import com.nevercome.tabook.modules.book.entity.info.BookInfo;
import com.nevercome.tabook.modules.book.entity.info.BookInfoClass;
import com.nevercome.tabook.modules.book.entity.info.BookInfoInstance;
import com.nevercome.tabook.modules.book.entity.info.BookInfoRoot;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author: sun
 * @date: 2019/4/25
 */
@Service
public class BookInfoService extends CrudService<BookInfoDao, BookInfo> {

    @Autowired
    private BookInfoDao bookInfoDao;

    /**
     * 这三个方法可能会有不同的处理机制 所以分开来写
     */
    public BookInfo getByBookInstanceId(String bookInstanceId) {
        BookInfo bookInfo = new BookInfo();
        BookInfoInstance bookInfoInstance = new BookInfoInstance();
        bookInfoInstance.setId(bookInstanceId);
        bookInfo.setBookInstance(bookInfoInstance);
        return bookInfoDao.getByBookInstanceId(bookInfo);
    }

    public BookInfo getByBookClassId(String bookClassId) {
        BookInfo bookInfo = new BookInfo();
        BookInfoClass bookInfoClass = new BookInfoClass();
        bookInfoClass.setImgUrl(bookClassId);
        bookInfo.setBookClass(bookInfoClass);
        return bookInfoDao.getByBookClassId(bookInfo);
    }

    public BookInfo getByBookRootId(String bookRootId) {
        BookInfo bookInfo = new BookInfo();
        BookInfoRoot bookInfoRoot = new BookInfoRoot();
        bookInfoRoot.setId(bookRootId);
        bookInfo.setBookRoot(bookInfoRoot);
        return bookInfoDao.getByBookRootId(bookInfo);
    }

}
