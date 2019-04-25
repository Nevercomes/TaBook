package com.nevercome.tabook.modules.book.dao.info;

import com.nevercome.tabook.common.persistence.CrudDao;
import com.nevercome.tabook.common.persistence.annotation.MyBatisDao;
import com.nevercome.tabook.modules.book.entity.info.BookInfoRoot;

/**
 * @author: sun
 * @date: 2019/4/25
 */
@MyBatisDao
public interface BookInfoRootDao extends CrudDao<BookInfoRoot> {
}
