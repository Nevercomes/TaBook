package com.nevercome.tabook.modules.book.service.index;

import com.google.common.collect.Lists;
import com.nevercome.tabook.common.persistence.Page;
import com.nevercome.tabook.common.service.CrudService;
import com.nevercome.tabook.modules.book.dao.index.BookIndexCommentDao;
import com.nevercome.tabook.modules.book.entity.comment.BookLongComment;
import com.nevercome.tabook.modules.book.entity.index.BookIndexComment;
import com.nevercome.tabook.modules.book.service.comment.BookLongCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: sun
 * @date: 2019/5/21
 */
@Service
public class BookIndexCommentService extends CrudService<BookIndexCommentDao, BookIndexComment> {

    // 需要某种分页算法
    @Override
    public Page<BookIndexComment> findPage(Page<BookIndexComment> page, BookIndexComment bookIndexComment) {
        return super.findPage(page, bookIndexComment);
    }

    // 需求某种推荐算法
    @Override
    public List<BookIndexComment> findList(BookIndexComment bookIndexComment) {
        return super.findList(bookIndexComment);
    }

}
