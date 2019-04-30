package com.nevercome.tabook.modules.book.service.favorite;

import com.nevercome.tabook.common.service.CrudService;
import com.nevercome.tabook.modules.book.dao.favorite.BookUserFavoriteDao;
import com.nevercome.tabook.modules.book.entity.favorite.BookUserFavorite;
import org.springframework.stereotype.Service;

/**
 * @author: sun
 * @date: 2019/4/30
 */
@Service
public class BookUserFavoriteService extends CrudService<BookUserFavoriteDao, BookUserFavorite> {
}
