package com.nevercome.tabook.modules.book.web.index;

import com.nevercome.tabook.common.web.BaseController;
import com.nevercome.tabook.common.web.Result;
import com.nevercome.tabook.modules.book.entity.index.BookIndexHead;
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
    public ResponseEntity listComment() {

        return new ResponseEntity<>(new Result(), HttpStatus.OK);
    }

    @RequiresPermissions("user")
    @RequestMapping(value = "borrow/list")
    public ResponseEntity listBorrow() {

        return new ResponseEntity<>(new Result(), HttpStatus.OK);
    }

    @RequiresPermissions("user")
    @RequestMapping(value = "buy/list")
    public ResponseEntity listBuy() {

        return new ResponseEntity<>(new Result(), HttpStatus.OK);
    }


}
