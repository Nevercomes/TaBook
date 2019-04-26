package com.nevercome.tabook.modules.book.service.info;

import com.nevercome.tabook.common.service.CrudService;
import com.nevercome.tabook.modules.book.dao.info.BookTagDao;
import com.nevercome.tabook.modules.book.entity.info.tags.BookTag;
import org.springframework.stereotype.Service;

/**
 * @author: sun
 * @date: 2019/4/26
 */
@Service
public class BookTagService extends CrudService<BookTagDao, BookTag> {
}
