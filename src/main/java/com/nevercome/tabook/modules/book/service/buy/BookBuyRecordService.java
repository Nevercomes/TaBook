package com.nevercome.tabook.modules.book.service.buy;

import com.nevercome.tabook.common.service.CrudService;
import com.nevercome.tabook.modules.book.dao.buy.BookBuyRecordDao;
import com.nevercome.tabook.modules.book.entity.buy.BookBuyRecord;
import org.springframework.stereotype.Service;

/**
 * @author: sun
 * @date: 2019/5/1
 */
@Service
public class BookBuyRecordService extends CrudService<BookBuyRecordDao, BookBuyRecord> {
}
