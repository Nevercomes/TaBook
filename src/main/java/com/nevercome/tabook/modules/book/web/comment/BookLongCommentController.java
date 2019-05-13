package com.nevercome.tabook.modules.book.web.comment;

import com.nevercome.tabook.common.web.BaseController;
import com.nevercome.tabook.common.web.Result;
import com.nevercome.tabook.modules.book.entity.comment.BookLongComment;
import com.nevercome.tabook.modules.book.service.comment.BookLongCommentService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author: sun
 * @date: 2019/4/30
 */
@Controller
@RequestMapping(value = "${adminPath}/book/comment/long")
public class BookLongCommentController extends BaseController {

    @Autowired
    private BookLongCommentService bookLongCommentService;

    @RequiresPermissions("book:comment:long:edit")
    @RequestMapping(value = "save")
    public ResponseEntity save(BookLongComment bookLongComment) {
        bookLongCommentService.save(bookLongComment);
        return new ResponseEntity<>(new Result(), HttpStatus.OK);
    }

    @RequiresPermissions("book:comment:long:view")
    @RequestMapping(value = "get")
    public ResponseEntity get(BookLongComment bookLongComment) {
        bookLongComment = bookLongCommentService.get(bookLongComment);
        return new ResponseEntity<>(new Result(bookLongComment), HttpStatus.OK);
    }

}
