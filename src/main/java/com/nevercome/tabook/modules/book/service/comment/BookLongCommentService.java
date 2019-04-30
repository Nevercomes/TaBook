package com.nevercome.tabook.modules.book.service.comment;

import com.nevercome.tabook.common.persistence.Page;
import com.nevercome.tabook.common.service.CrudService;
import com.nevercome.tabook.modules.book.dao.comment.BookLongCommentDao;
import com.nevercome.tabook.modules.book.entity.comment.BookLongComment;
import com.nevercome.tabook.modules.book.entity.favorite.BookUserFavorite;
import com.nevercome.tabook.modules.book.entity.info.BookInfo;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author: sun
 * @date: 2019/4/30
 */
@Service
public class BookLongCommentService extends CrudService<BookLongCommentDao, BookLongComment> {

}
