package com.nevercome.tabook.modules.book.web.borrow;

import com.nevercome.tabook.common.config.Global;
import com.nevercome.tabook.common.persistence.Page;
import com.nevercome.tabook.common.web.BaseController;
import com.nevercome.tabook.common.web.Result;
import com.nevercome.tabook.modules.book.entity.borrow.BookBorrowRecord;
import com.nevercome.tabook.modules.book.entity.info.BookInfoInstance;
import com.nevercome.tabook.modules.book.entity.user.BookStudent;
import com.nevercome.tabook.modules.book.service.borrow.BookBorrowRecordService;
import com.nevercome.tabook.modules.book.service.info.BookInstanceService;
import com.nevercome.tabook.modules.book.service.user.BookStudentService;
import com.nevercome.tabook.modules.book.utils.BookConstant;
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
 * @author: sun
 * @date: 2019/4/26
 */
@Controller
@RequestMapping(value = "${adminPath}/book/borrow")
public class BookBorrowController extends BaseController {

    @Autowired
    private BookBorrowRecordService bookBorrowRecordService;
    @Autowired
    private BookInstanceService bookInstanceService;

    /**
     * 申请有两类
     * 1. 借书申请
     * 2. 归还申请
     */
//    @RequiresPermissions("book:borrow:edit")
    @RequestMapping(value = "request")
    public ResponseEntity request(HttpServletRequest request, BookBorrowRecord bookBorrowRecord) {
        String isReturn = request.getParameter("return");
        if (Global.TRUE.equals(isReturn)) {
            bookBorrowRecord = bookBorrowRecordService.get(bookBorrowRecord);
            bookBorrowRecord.setStatus(BookConstant.BOOK_REQUEST_STATUS_RETURNING);
            bookBorrowRecordService.save(bookBorrowRecord);
        } else {
            bookBorrowRecord.setRequesterId(UserUtils.getUser().getStudentId());
            bookBorrowRecordService.save(bookBorrowRecord);
        }
        return new ResponseEntity<>(new Result(), HttpStatus.OK);
    }

    /**
     * 业务逻辑安全性：confirm必须是书籍所有者才可以操作
     * 确认有两类
     * 1. 借书申请确认
     * 2. 归还申请确认
     */
//    @RequiresPermissions("book:borrow:edit")
    @RequestMapping(value = "confirm")
    public ResponseEntity confirm(HttpServletRequest request, BookBorrowRecord bookBorrowRecord) {
        String status = bookBorrowRecord.getStatus();
        bookBorrowRecord = bookBorrowRecordService.get(bookBorrowRecord);
        bookBorrowRecord.setStatus(status);
        bookBorrowRecordService.save(bookBorrowRecord);
        return new ResponseEntity<>(new Result(), HttpStatus.OK);
    }


//    @RequiresPermissions("book:borrow:edit")
    @RequestMapping(value = "cancel")
    public ResponseEntity cancel(HttpServletRequest request, BookBorrowRecord bookBorrowRecord) {
        bookBorrowRecord = bookBorrowRecordService.get(bookBorrowRecord);
        bookBorrowRecord.setCancel(Global.YES);
        bookBorrowRecordService.save(bookBorrowRecord);
        return new ResponseEntity<>(new Result(), HttpStatus.OK);
    }

    /**
     * 展示我的申请（借书）的地方
     */
//    @RequiresPermissions("book:borrow:view")
    @RequestMapping(value = "list")
    public ResponseEntity list(HttpServletRequest request, HttpServletResponse response, BookBorrowRecord bookBorrowRecord) {
        Page<BookBorrowRecord> page = bookBorrowRecordService.findPage(new Page<>(request, response), bookBorrowRecord);
        return new ResponseEntity<>(new Result(page), HttpStatus.OK);
    }

//    @RequiresPermissions("book:borrowable:view")
    @RequestMapping(value = "list/borrowable")
    public ResponseEntity listBorrowable(HttpServletRequest request, HttpServletResponse response, BookInfoInstance bookInfoInstance) {
        String schoolId = UserUtils.getUser().getSchoolId();
        if (schoolId == null) {
            return new ResponseEntity<>(new Result("请先进行实名认证"), HttpStatus.OK);
        }
        bookInfoInstance.setSchoolId(schoolId);
        Page<BookInfoInstance> page = new Page<>(request, response);
        page = bookInstanceService.findBorrowable(page, bookInfoInstance);
        return new ResponseEntity<>(new Result(page), HttpStatus.OK);
    }
}
