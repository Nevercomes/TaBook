package com.nevercome.tabook.modules.book.service.info;

import com.nevercome.tabook.common.config.Global;
import com.nevercome.tabook.common.persistence.Page;
import com.nevercome.tabook.common.service.CrudService;
import com.nevercome.tabook.modules.book.dao.info.BookInfoDao;
import com.nevercome.tabook.modules.book.entity.info.BookInfo;
import com.nevercome.tabook.modules.book.entity.info.BookInfoClass;
import com.nevercome.tabook.modules.book.entity.info.BookInfoInstance;
import com.nevercome.tabook.modules.book.entity.info.BookInfoRoot;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
        bookInfo.setBookInfoInstance(bookInfoInstance);
        return bookInfoDao.getByBookInstanceId(bookInfo);
    }

    public BookInfo getByBookClassId(String bookClassId) {
        BookInfo bookInfo = new BookInfo();
        BookInfoClass bookInfoClass = new BookInfoClass();
        bookInfoClass.setImgUrl(bookClassId);
        bookInfo.setBookInfoClass(bookInfoClass);
        return bookInfoDao.getByBookClassId(bookInfo);
    }

    public BookInfo getByBookRootId(String bookRootId) {
        BookInfo bookInfo = new BookInfo();
        BookInfoRoot bookInfoRoot = new BookInfoRoot();
        bookInfoRoot.setId(bookRootId);
        bookInfo.setBookInfoRoot(bookInfoRoot);
        return bookInfoDao.getByBookRootId(bookInfo);
    }

    @Override
    public Page<BookInfo> findPage(Page<BookInfo> page, BookInfo bookInfo) {
        bookInfo.setPage(page);
        List<BookInfo> bookInfoList;
        if(Global.TRUE.equals(bookInfo.getIsBookClass())) {
            bookInfoList = bookInfoDao.findListRefBookClass(bookInfo);
        } else if(Global.TRUE.equals(bookInfo.getIsBookRoot())) {
            bookInfoList = bookInfoDao.findListRefBookRoot(bookInfo);
        } else {
            bookInfoList = bookInfoDao.findList(bookInfo);
        }
        page.setList(bookInfoList);
        return page;
    }
}
