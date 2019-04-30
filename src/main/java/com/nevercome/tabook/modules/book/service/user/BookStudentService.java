package com.nevercome.tabook.modules.book.service.user;

import com.nevercome.tabook.common.service.CrudService;
import com.nevercome.tabook.modules.book.dao.info.BookSortDao;
import com.nevercome.tabook.modules.book.dao.user.BookStudentDao;
import com.nevercome.tabook.modules.book.entity.user.BookStudent;
import org.springframework.stereotype.Service;

/**
 * @author: sun
 * @date: 2019/4/30
 */
@Service
public class BookStudentService extends CrudService<BookStudentDao, BookStudent> {
}
