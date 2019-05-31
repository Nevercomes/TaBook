package com.nevercome.tabook.modules.book.web.comment;

import com.nevercome.tabook.common.web.BaseController;
import com.nevercome.tabook.common.web.Result;
import com.nevercome.tabook.modules.book.entity.comment.BookCommentReply;
import com.nevercome.tabook.modules.book.service.comment.BookCommentReplyService;
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
@RequestMapping(value = "${adminPath}/book/comment/reply")
public class BookCommentReplyController extends BaseController {

    @Autowired
    private BookCommentReplyService bookCommentReplyService;

//    @RequiresPermissions("book:comment:reply:edit")
    @RequestMapping(value = "save")
    public ResponseEntity save(BookCommentReply bookCommentReply) {
        bookCommentReplyService.save(bookCommentReply);
        return new ResponseEntity<>(new Result(bookCommentReply), HttpStatus.OK);
    }

//    @RequiresPermissions("book:comment:reply:view")
    @RequestMapping(value = "get")
    public ResponseEntity get(BookCommentReply bookCommentReply) {
        bookCommentReply = bookCommentReplyService.get(bookCommentReply);
        return new ResponseEntity<>(new Result(bookCommentReply), HttpStatus.OK);
    }

//    @RequiresPermissions("book:comment:reply:view")
    @RequestMapping(value = "list")
    public ResponseEntity list(BookCommentReply bookCommentReply) {
        bookCommentReply = bookCommentReplyService.get(bookCommentReply);
        return new ResponseEntity<>(new Result(bookCommentReply), HttpStatus.OK);
    }

}
