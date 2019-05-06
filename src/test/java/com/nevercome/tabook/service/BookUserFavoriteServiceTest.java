package com.nevercome.tabook.service;

import com.nevercome.tabook.BaseTest;
import com.nevercome.tabook.modules.book.entity.favorite.BookUserFavorite;
import com.nevercome.tabook.modules.book.service.favorite.BookUserFavoriteService;
import com.nevercome.tabook.modules.book.utils.BookConstant;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author: sun
 * @date: 2019/5/6
 */
public class BookUserFavoriteServiceTest extends BaseTest {

    @Autowired
    private BookUserFavoriteService bookUserFavoriteService;

    private BookUserFavorite bookUserFavorite;

    @Before
    public void before(){
        bookUserFavorite = new BookUserFavorite();
        bookUserFavorite.setBookClassId("04f34385f15b4733aa8457d8387c9659");
        bookUserFavorite.setType(BookConstant.BOOK_FAVORITE_BOOK);
    }

    @Test
    public void saveTest(){
        bookUserFavoriteService.save(bookUserFavorite);
        System.out.println(bookUserFavorite);
    }

    @Test
    public void listTest() {
        System.out.println(bookUserFavoriteService.findList(bookUserFavorite).size());
    }

}
