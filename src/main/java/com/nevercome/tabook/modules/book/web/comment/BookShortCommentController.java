package com.nevercome.tabook.modules.book.web.comment;

import com.nevercome.tabook.common.persistence.Page;
import com.nevercome.tabook.common.web.BaseController;
import com.nevercome.tabook.common.web.Result;
import com.nevercome.tabook.modules.book.entity.comment.BookShortComment;
import com.nevercome.tabook.modules.book.service.comment.BookShortCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * book short comment controller
 *
 * @author: sun
 * @date: 2019/4/30
 */
@Controller
@RequestMapping(value = "${adminPath}/book/comment_short")
public class BookShortCommentController extends BaseController {

    @Autowired
    private BookShortCommentService bookShortCommentService;

    @RequestMapping(value = "save")
    public ResponseEntity save(BookShortComment bookShortComment) {
        bookShortCommentService.save(bookShortComment);
        return new ResponseEntity<>(new Result(), HttpStatus.OK);
    }

    @RequestMapping(value = "list")
    public ResponseEntity list(HttpServletRequest request, HttpServletResponse response, BookShortComment bookShortComment) {
        Page<BookShortComment> page = bookShortCommentService.findPage(new Page<>(request, response), bookShortComment);
        return new ResponseEntity<>(new Result(page), HttpStatus.OK);
    }

}
