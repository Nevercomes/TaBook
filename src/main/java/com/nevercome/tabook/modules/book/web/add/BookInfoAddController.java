package com.nevercome.tabook.modules.book.web.add;

import com.nevercome.tabook.common.web.BaseController;
import com.nevercome.tabook.common.web.Result;
import com.nevercome.tabook.modules.book.entity.add.BookInfoAdd;
import com.nevercome.tabook.modules.book.service.add.BookInfoAddService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author: sun
 * @date: 2019/4/25
 */
@Controller
@RequestMapping(value = "${adminPath}/book/add")
public class BookInfoAddController extends BaseController {

    @Autowired
    private BookInfoAddService bookInfoAddService;

    @RequestMapping(value = "get")
    public ResponseEntity get(BookInfoAdd bookInfoAdd) {
        bookInfoAdd = bookInfoAddService.get(bookInfoAdd);
        return new ResponseEntity<>(new Result(bookInfoAdd), HttpStatus.OK);
    }

    @RequestMapping(value = "save")
    public ResponseEntity save(BookInfoAdd bookInfoAdd) {
        bookInfoAddService.save(bookInfoAdd);
        return new ResponseEntity<>(new Result(), HttpStatus.OK);
    }

}
