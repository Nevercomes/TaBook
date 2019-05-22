package com.nevercome.tabook.modules.book.service.index;

import com.nevercome.tabook.common.persistence.Page;
import com.nevercome.tabook.common.service.CrudService;
import com.nevercome.tabook.modules.book.dao.index.BookIndexBorrowDao;
import com.nevercome.tabook.modules.book.entity.index.BookIndexBorrow;
import com.nevercome.tabook.modules.book.entity.index.BookIndexComment;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: sun
 * @date: 2019/5/21
 */
@Service
public class BookIndexBorrowService extends CrudService<BookIndexBorrowDao, BookIndexBorrow> {

    // 需要某种分页算法
    @Override
    public Page<BookIndexBorrow> findPage(Page<BookIndexBorrow> page, BookIndexBorrow bookIndexBorrow) {
        return super.findPage(page, bookIndexBorrow);
    }

    // 需求某种推荐算法
    @Override
    public List<BookIndexBorrow> findList(BookIndexBorrow bookIndexBorrow) {
        return super.findList(bookIndexBorrow);
    }

}
