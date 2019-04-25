package com.nevercome.tabook.modules.book.dao.add;

import com.nevercome.tabook.common.persistence.CrudDao;
import com.nevercome.tabook.common.persistence.annotation.MyBatisDao;
import com.nevercome.tabook.modules.book.entity.add.BookInfoAdd;
import com.nevercome.tabook.modules.book.entity.info.BookInfo;

/**
 * @author: sun
 * @date: 2019/4/25
 */
@MyBatisDao
public interface BookInfoAddDao extends CrudDao<BookInfoAdd> {

}
