package com.nevercome.tabook.modules.book.dao.info;

import com.nevercome.tabook.common.persistence.CrudDao;
import com.nevercome.tabook.common.persistence.annotation.MyBatisDao;
import com.nevercome.tabook.modules.book.entity.favorite.BookUserFavorite;
import com.nevercome.tabook.modules.book.entity.info.BookInfo;

import java.util.List;

/**
 * 正确的做法应该是
 * 1. 在数据库建立视图？
 * 2. 将经常被访问到的数据放入缓存
 * @author: sun
 * @date: 2019/4/25
 */
@MyBatisDao
public interface BookInfoDao extends CrudDao<BookInfo> {
    BookInfo getByBookInstanceId(BookInfo bookInfo);

    BookInfo getByBookClassId(BookInfo bookInfo);

    BookInfo getByBookRootId(BookInfo bookInfo);

    List<BookInfo> findListRefBookClass(BookInfo bookInfo);

    List<BookInfo> findListRefBookRoot(BookInfo bookInfo);

    List<BookInfo> findListByFavorite(BookUserFavorite bookUserFavorite);
}
