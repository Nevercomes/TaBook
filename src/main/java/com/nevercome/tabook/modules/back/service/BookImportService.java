package com.nevercome.tabook.modules.back.service;

import com.nevercome.tabook.modules.back.entity.BookImport;
import com.nevercome.tabook.modules.book.entity.info.BookInfoClass;
import com.nevercome.tabook.modules.book.entity.info.BookInfoRoot;
import com.nevercome.tabook.modules.book.service.info.BookInfoClassService;
import com.nevercome.tabook.modules.book.service.info.BookInfoRootService;
import com.nevercome.tabook.modules.book.service.info.BookInstanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author: sun
 * @date: 2019/4/29
 */
@Service
public class BookImportService {

    @Autowired
    private BookInfoRootService bookInfoRootService;
    @Autowired
    private BookInfoClassService bookInfoClassService;
    @Autowired
    private BookInstanceService bookInstanceService;

    public void save(BookImport bookImport) {

        BookInfoRoot bookInfoRoot = bookInfoRootService.getByName(bookImport.getName());
        if (bookInfoRoot == null) {
            bookInfoRoot = new BookInfoRoot();
            bookInfoRoot.setName(bookImport.getName());
            bookInfoRoot.setAuthor(bookImport.getAuthor());
            bookInfoRootService.save(bookInfoRoot);
        }

        BookInfoClass bookInfoClass = new BookInfoClass();
        bookInfoClass.setBookRootId(bookInfoRoot.getId());
        bookInfoClass.setISBN(bookImport.getISBN());
        bookInfoClass.setPress(bookImport.getPress());
        bookInfoClass.setYear(bookImport.getYear());
        bookInfoClass.setVersion(bookImport.getVersion());
        bookInfoClass.setIntro(bookImport.getIntro());
        bookInfoClass.setImgUrl(bookImport.getImgUrl());
        bookInfoClass.setScore(bookImport.getScore());
        bookInfoClassService.save(bookInfoClass);

    }
}
