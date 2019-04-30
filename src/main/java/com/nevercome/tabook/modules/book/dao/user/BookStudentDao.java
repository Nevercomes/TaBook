package com.nevercome.tabook.modules.book.dao.user;

import com.nevercome.tabook.common.persistence.CrudDao;
import com.nevercome.tabook.common.persistence.annotation.MyBatisDao;
import com.nevercome.tabook.modules.book.entity.user.BookStudent;

/**
 * @author: sun
 * @date: 2019/4/30
 */
@MyBatisDao
public interface BookStudentDao extends CrudDao<BookStudent> {
}
