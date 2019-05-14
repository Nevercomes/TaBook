package com.nevercome.tabook.modules.book.service.info;

import com.nevercome.tabook.common.persistence.Page;
import com.nevercome.tabook.common.service.CrudService;
import com.nevercome.tabook.modules.book.dao.info.BookInstanceDao;
import com.nevercome.tabook.modules.book.entity.info.BookInfoInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author: sun
 * @date: 2019/4/25
 */
@Service
public class BookInstanceService extends CrudService<BookInstanceDao, BookInfoInstance> {


    public Page<BookInfoInstance> findBorrowable(Page<BookInfoInstance> page, BookInfoInstance bookInfoInstance) {
        bookInfoInstance.setPage(page);
        page.setList(super.dao.findBorrowable(bookInfoInstance));
        return page;
    }
}
