package com.nevercome.tabook.modules.book.dao.info;

import com.nevercome.tabook.common.persistence.CrudDao;
import com.nevercome.tabook.common.persistence.annotation.MyBatisDao;
import com.nevercome.tabook.modules.book.entity.info.BookInfo;

/**
 * @author: sun
 * @date: 2019/4/25
 */
@MyBatisDao
public interface BookInfoDao extends CrudDao<BookInfo> {
    BookInfo getByBookInstanceId(BookInfo bookInfo);

    BookInfo getByBookClassId(BookInfo bookInfo);

    BookInfo getByBookRootId(BookInfo bookInfo);
}
