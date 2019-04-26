package com.nevercome.tabook.modules.book.service.info;

import com.nevercome.tabook.common.service.CrudService;
import com.nevercome.tabook.modules.book.dao.info.BookSortDao;
import com.nevercome.tabook.modules.book.entity.info.sort.BookSort;
import org.springframework.stereotype.Service;

/**
 * @author: sun
 * @date: 2019/4/26
 */
@Service
public class BookSortService extends CrudService<BookSortDao, BookSort> {
}
