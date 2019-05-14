package com.nevercome.tabook.modules.book.dao.info;

import com.nevercome.tabook.common.persistence.CrudDao;
import com.nevercome.tabook.common.persistence.annotation.MyBatisDao;
import com.nevercome.tabook.modules.book.entity.info.BookInfoInstance;

import java.util.List;

/**
 * @author: sun
 * @date: 2019/4/25
 */
@MyBatisDao
public interface BookInstanceDao extends CrudDao<BookInfoInstance> {
    List<BookInfoInstance> findBorrowable(BookInfoInstance bookInfoInstance);

    List<BookInfoInstance> findBuyAble(BookInfoInstance bookInfoInstance);
}
