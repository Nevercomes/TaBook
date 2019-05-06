package com.nevercome.tabook.service;

import com.nevercome.tabook.BaseTest;
import com.nevercome.tabook.modules.book.entity.add.BookInfoAdd;
import com.nevercome.tabook.modules.book.service.add.BookInfoAddService;
import com.nevercome.tabook.modules.book.utils.BookConstant;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author: sun
 * @date: 2019/5/5
 */
public class BookInfoAddServiceTest extends BaseTest {

    @Autowired
    private BookInfoAddService bookInfoAddService;

    private final String testId = "7c825f3a04b24100bd1784bf96fb10ab";

    private BookInfoAdd bookInfoAdd;

    @Before
    public void before() {
        bookInfoAdd = new BookInfoAdd();
//        bookInfoAdd.setId(testId);
        bookInfoAdd.setName("富爸爸，穷爸爸");
        bookInfoAdd.setAuthor("（美）罗伯特・T・清崎 ");
        bookInfoAdd.setPress("世界图书出版公司");
        bookInfoAdd.setYear("2000-09 ");
        bookInfoAdd.setNewPercent(80);
        bookInfoAdd.setOwnerComment("我真的没有开挂");
        bookInfoAdd.setType(BookConstant.BOOK_SHELF_TYPE_BORROW);
    }

    @Test
    public void getTest() {
        bookInfoAdd = bookInfoAddService.get(testId);
        System.out.println(bookInfoAdd);
    }

    /**
     * 具有rootId和ClassId
     */
    @Test
    public void saveTest() {
        bookInfoAdd.setBookRootId("01a2d02d741642ad912296bff9317860");
        bookInfoAdd.setBookClassId("4d1a91e36bf2479991adb817def68bc7");
        bookInfoAddService.save(bookInfoAdd);
        System.out.println(bookInfoAdd);
    }

    /**
     * 只具有RootId
     */
    @Test
    public void saveTest1(){
        bookInfoAdd.setBookRootId("01a2d02d741642ad912296bff9317860");
        bookInfoAdd.setPress("译林出版社");
        bookInfoAdd.setYear("2010-09");
        bookInfoAddService.save(bookInfoAdd);
        System.out.println(bookInfoAdd);
    }

    /**
     * 不具有二者的Id
     */
    @Test
    public void saveTest2() {
        bookInfoAdd.setName("我的天才女友");
        bookInfoAdd.setAuthor("[意]埃莱娜·费兰特 ");
        bookInfoAdd.setPress("双生法术出版社");
        bookInfoAdd.setYear("2012-09");
        bookInfoAddService.save(bookInfoAdd);
        System.out.println(bookInfoAdd);
    }

    @Test
    public void listTest() {
        System.out.println(bookInfoAddService.findList(bookInfoAdd).size());
    }

}
