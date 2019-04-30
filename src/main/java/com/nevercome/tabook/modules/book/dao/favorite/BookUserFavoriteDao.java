package com.nevercome.tabook.modules.book.dao.favorite;

import com.nevercome.tabook.common.persistence.CrudDao;
import com.nevercome.tabook.common.persistence.annotation.MyBatisDao;
import com.nevercome.tabook.modules.book.entity.favorite.BookUserFavorite;

/**
 * @author: sun
 * @date: 2019/4/30
 */
@MyBatisDao
public interface BookUserFavoriteDao extends CrudDao<BookUserFavorite> {
}
