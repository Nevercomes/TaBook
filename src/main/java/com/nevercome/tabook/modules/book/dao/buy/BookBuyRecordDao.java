package com.nevercome.tabook.modules.book.dao.buy;

import com.nevercome.tabook.common.persistence.CrudDao;
import com.nevercome.tabook.common.persistence.annotation.MyBatisDao;
import com.nevercome.tabook.modules.book.entity.buy.BookBuyRecord;

/**
 * @author: sun
 * @date: 2019/5/1
 */
@MyBatisDao
public interface BookBuyRecordDao extends CrudDao<BookBuyRecord> {
}
