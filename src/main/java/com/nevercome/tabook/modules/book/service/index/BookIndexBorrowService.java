package com.nevercome.tabook.modules.book.service.index;

import com.nevercome.tabook.common.service.CrudService;
import com.nevercome.tabook.modules.book.dao.index.BookIndexBorrowDao;
import com.nevercome.tabook.modules.book.entity.index.BookIndexBorrow;
import org.springframework.stereotype.Service;

/**
 * @author: sun
 * @date: 2019/5/21
 */
@Service
public class BookIndexBorrowService extends CrudService<BookIndexBorrowDao, BookIndexBorrow> {
}