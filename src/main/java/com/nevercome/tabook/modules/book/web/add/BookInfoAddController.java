package com.nevercome.tabook.modules.book.web.add;

import com.nevercome.tabook.common.persistence.Page;
import com.nevercome.tabook.common.web.BaseController;
import com.nevercome.tabook.common.web.Result;
import com.nevercome.tabook.modules.book.entity.add.BookInfoAdd;
import com.nevercome.tabook.modules.book.entity.info.BookInfo;
import com.nevercome.tabook.modules.book.entity.user.BookStudent;
import com.nevercome.tabook.modules.book.service.add.BookInfoAddService;
import com.nevercome.tabook.modules.sys.utils.UserUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 用户维护书籍信息Controller
 *
 * @author: sun
 * @date: 2019/4/25
 */
@Controller
@RequestMapping(value = "${adminPath}/book/add")
public class BookInfoAddController extends BaseController {

    @Autowired
    private BookInfoAddService bookInfoAddService;

    @RequiresPermissions("book:add:view")
    @RequestMapping(value = "get")
    public ResponseEntity get(BookInfoAdd bookInfoAdd) {
        bookInfoAdd = bookInfoAddService.get(bookInfoAdd);
        return new ResponseEntity<>(new Result(bookInfoAdd), HttpStatus.OK);
    }

    @RequiresPermissions("book:add:edit")
    @RequestMapping(value = "save")
    public ResponseEntity save(BookInfoAdd bookInfoAdd) {
        bookInfoAddService.save(bookInfoAdd);
        return new ResponseEntity<>(new Result(), HttpStatus.OK);
    }

    /**
     * 我的 - 上传的书籍的显示
     */
    @RequiresPermissions("book:add:view")
    @RequestMapping(value = "list")
    public ResponseEntity list(HttpServletRequest request, HttpServletResponse response, BookInfoAdd bookInfoAdd) {
        BookStudent student = UserUtils.getUser().getBookStudent();
        bookInfoAdd.setStudentId(student.getId());
        Page<BookInfoAdd> page = bookInfoAddService.findPage(new Page<>(request, response), bookInfoAdd);
        return new ResponseEntity<>(new Result(page), HttpStatus.OK);
    }

}
