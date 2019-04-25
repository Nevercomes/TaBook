package com.nevercome.tabook.modules.book.service.info;

import com.nevercome.tabook.common.service.CrudService;
import com.nevercome.tabook.modules.book.dao.info.BookInstanceDao;
import com.nevercome.tabook.modules.book.entity.info.BookInfoInstance;
import org.springframework.stereotype.Service;

/**
 * @author: sun
 * @date: 2019/4/25
 */
@Service
public class BookInstanceService extends CrudService<BookInstanceDao, BookInfoInstance> {
}
