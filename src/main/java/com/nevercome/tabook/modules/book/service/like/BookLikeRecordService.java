package com.nevercome.tabook.modules.book.service.like;

import com.nevercome.tabook.common.service.CrudService;
import com.nevercome.tabook.modules.book.dao.like.BookLikeRecordDao;
import com.nevercome.tabook.modules.book.entity.like.BookLikeRecord;
import org.springframework.stereotype.Service;

/**
 * @author: sun
 * @date: 2019/4/30
 */
@Service
public class BookLikeRecordService extends CrudService<BookLikeRecordDao, BookLikeRecord> {
}
