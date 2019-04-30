package com.nevercome.tabook.modules.book.web.user;

import com.nevercome.tabook.common.web.BaseController;
import com.nevercome.tabook.common.web.Result;
import com.nevercome.tabook.modules.book.entity.user.BookStudent;
import com.nevercome.tabook.modules.book.service.info.BookSortService;
import com.nevercome.tabook.modules.book.service.user.BookStudentService;
import com.nevercome.tabook.modules.sys.utils.UserUtils;
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
@RequestMapping(value = "${adminPath}/book/student")
public class StudentController extends BaseController {

    @Autowired
    private BookStudentService bookStudentService;

    @RequestMapping(value = "init")
    public ResponseEntity init() {
        BookStudent bookStudent = UserUtils.getUser().getBookStudent();
        if (bookStudent != null) {
            return new ResponseEntity<>(new Result(bookStudent), HttpStatus.OK);
        } else {
            String studentId = UserUtils.getUser().getStudentId();
            bookStudent = bookStudentService.get(studentId);
            UserUtils.getUser().setBookStudent(bookStudent);
            return new ResponseEntity<>(new Result(bookStudent), HttpStatus.OK);
        }
    }
}
