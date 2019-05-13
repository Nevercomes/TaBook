package com.nevercome.tabook.modules.book.web.like;

import com.nevercome.tabook.common.web.BaseController;
import com.nevercome.tabook.common.web.Result;
import com.nevercome.tabook.modules.book.entity.like.BookLikeRecord;
import com.nevercome.tabook.modules.book.service.like.BookLikeRecordService;
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
@RequestMapping(value = "${adminPath}/book/like")
public class BookLikeRecordController extends BaseController {

    @Autowired
    private BookLikeRecordService bookLikeRecordService;

    @RequiresPermissions("book:like:edit")
    @RequestMapping(value = "save")
    public ResponseEntity save(BookLikeRecord bookLikeRecord){
        bookLikeRecordService.save(bookLikeRecord);
        return new ResponseEntity<>(new Result(), HttpStatus.OK);
    }

    @RequiresPermissions("book:like:edit")
    @RequestMapping(value = "delete")
    public ResponseEntity delete(BookLikeRecord bookLikeRecord){
        bookLikeRecordService.delete(bookLikeRecord);
        return new ResponseEntity<>(new Result(), HttpStatus.OK);
    }

}
