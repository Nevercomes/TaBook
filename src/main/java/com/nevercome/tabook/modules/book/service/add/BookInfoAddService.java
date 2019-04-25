package com.nevercome.tabook.modules.book.service.add;

import com.nevercome.tabook.common.service.CrudService;
import com.nevercome.tabook.modules.book.dao.add.BookInfoAddDao;
import com.nevercome.tabook.modules.book.entity.add.BookInfoAdd;
import org.springframework.stereotype.Service;

/**
 * @author: sun
 * @date: 2019/4/25
 */
@Service
public class BookInfoAddService extends CrudService<BookInfoAddDao, BookInfoAdd> {
}
