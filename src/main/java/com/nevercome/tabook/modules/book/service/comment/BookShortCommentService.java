package com.nevercome.tabook.modules.book.service.comment;

import com.nevercome.tabook.common.service.CrudService;
import com.nevercome.tabook.modules.book.dao.comment.BookShortCommentDao;
import com.nevercome.tabook.modules.book.entity.comment.BookShortComment;
import org.springframework.stereotype.Service;

/**
 * @author: sun
 * @date: 2019/4/30
 */
@Service
public class BookShortCommentService extends CrudService<BookShortCommentDao, BookShortComment> {
}
