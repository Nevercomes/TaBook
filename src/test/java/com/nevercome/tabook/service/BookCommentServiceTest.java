package com.nevercome.tabook.service;

import com.nevercome.tabook.BaseTest;
import com.nevercome.tabook.modules.book.entity.comment.BookCommentReply;
import com.nevercome.tabook.modules.book.entity.comment.BookLongComment;
import com.nevercome.tabook.modules.book.entity.comment.BookShortComment;
import com.nevercome.tabook.modules.book.service.comment.BookCommentReplyService;
import com.nevercome.tabook.modules.book.service.comment.BookLongCommentService;
import com.nevercome.tabook.modules.book.service.comment.BookShortCommentService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author: sun
 * @date: 2019/5/6
 */
public class BookCommentServiceTest extends BaseTest {

    @Autowired
    private BookShortCommentService bookShortCommentService;
    @Autowired
    private BookLongCommentService bookLongCommentService;
    @Autowired
    private BookCommentReplyService bookCommentReplyService;

    private BookShortComment bookShortComment;

    private BookLongComment bookLongComment;

    private BookCommentReply bookCommentReply;

    @Before
    public void before() {
        bookShortComment = new BookShortComment();
        bookShortComment.setBookRootId("042840c6cbcf46fb8799ea0fb963818e");
        bookShortComment.setContent("大家好，我是练习时长两年半的...");
        bookShortComment.setScore(8.9f);

        bookLongComment = new BookLongComment();
        bookLongComment.setBookRootId("042840c6cbcf46fb8799ea0fb963818e");
        bookLongComment.setTitle("大碗宽面");
        bookLongComment.setContent("你看这碗它又大又圆，你看这面它又长又宽");
        bookLongComment.setScore(9.5f);

        bookCommentReply = new BookCommentReply();
        bookCommentReply.setContent("开花开花");
    }

//    @Test
    public void saveTest1() {
        bookShortCommentService.save(bookShortComment);
        System.out.println(bookShortComment);
    }

//    @Test
    public void saveTest2() {
        bookLongCommentService.save(bookLongComment);
        System.out.println(bookLongComment);
    }

//    @Test
    public void saveTest3() {
        bookCommentReply.setBookCommentId("122d4c8faa5d4852b0fbd43c36cf3908");
        bookCommentReplyService.save(bookCommentReply);
        System.out.println(bookCommentReply);
    }

    @Test
    public void listTest1() {
        System.out.println(bookCommentReplyService.findList(bookCommentReply).size());
    }

    @Test
    public void listTest2() {
        System.out.println(bookShortCommentService.findList(bookShortComment).size());
    }

    @Test
    public void listTest3() {
        System.out.println(bookLongCommentService.findList(bookLongComment).size());
    }

}
