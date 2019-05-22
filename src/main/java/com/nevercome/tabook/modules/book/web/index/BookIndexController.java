package com.nevercome.tabook.modules.book.web.index;

import com.nevercome.tabook.common.persistence.Page;
import com.nevercome.tabook.common.web.BaseController;
import com.nevercome.tabook.common.web.Result;
import com.nevercome.tabook.modules.book.entity.comment.BookLongComment;
import com.nevercome.tabook.modules.book.entity.index.BookIndexBorrow;
import com.nevercome.tabook.modules.book.entity.index.BookIndexComment;
import com.nevercome.tabook.modules.book.entity.index.BookIndexHead;
import com.nevercome.tabook.modules.book.entity.info.BookInfo;
import com.nevercome.tabook.modules.book.service.index.BookIndexBorrowService;
import com.nevercome.tabook.modules.book.service.index.BookIndexBuyService;
import com.nevercome.tabook.modules.book.service.index.BookIndexCommentService;
import com.nevercome.tabook.modules.book.service.index.BookIndexHeadService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author: sun
 * @date: 2019/5/21
 */
@Controller
@RequestMapping(value = "${adminPath}/book/index")
public class BookIndexController extends BaseController {

    @Autowired
    private BookIndexBorrowService bookIndexBorrowService;
    @Autowired
    private BookIndexBuyService bookIndexBuyService;
    @Autowired
    private BookIndexCommentService bookIndexCommentService;
    @Autowired
    private BookIndexHeadService bookIndexHeadService;

    @RequiresPermissions("user")
    @RequestMapping(value = "head/list")
    public ResponseEntity listHead() {
        List<BookIndexHead> list = bookIndexHeadService.findList(new BookIndexHead());
        return new ResponseEntity<>(new Result(list), HttpStatus.OK);
    }

    @RequiresPermissions("user")
    @RequestMapping(value = "comment/list")
    public ResponseEntity listComment(HttpServletRequest request, HttpServletResponse response, BookIndexComment bookIndexComment) {
        Page<BookIndexComment> page = bookIndexCommentService.findPage(new Page<>(request, response), bookIndexComment);
        return new ResponseEntity<>(new Result(page), HttpStatus.OK);
    }

    @RequiresPermissions("user")
    @RequestMapping(value = "borrow/list")
    public ResponseEntity listBorrow(HttpServletRequest request, HttpServletResponse response, BookIndexBorrow bookIndexBorrow) {
        Page<BookIndexBorrow> page = bookIndexBorrowService.findPage(new Page<>(request, response), bookIndexBorrow);
        return new ResponseEntity<>(new Result(page), HttpStatus.OK);
    }

    @RequiresPermissions("user")
    @RequestMapping(value = "buy/list")
    public ResponseEntity listBuy() {

        return new ResponseEntity<>(new Result(), HttpStatus.OK);
    }


}
