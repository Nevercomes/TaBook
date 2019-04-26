package com.nevercome.tabook.modules.book.dao.info;

import com.nevercome.tabook.common.persistence.CrudDao;
import com.nevercome.tabook.common.persistence.annotation.MyBatisDao;
import com.nevercome.tabook.modules.book.entity.info.tags.BookTag;

/**
 * @author: sun
 * @date: 2019/4/26
 */
@MyBatisDao
public interface BookTagDao extends CrudDao<BookTag> {
}
