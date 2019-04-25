package com.nevercome.tabook.modules.book.web.info;

import com.nevercome.tabook.common.utils.StringUtils;
import com.nevercome.tabook.common.web.BaseController;
import com.nevercome.tabook.common.web.Result;
import com.nevercome.tabook.modules.book.entity.info.BookInfo;
import com.nevercome.tabook.modules.book.entity.info.BookInfoRoot;
import com.nevercome.tabook.modules.book.service.info.BookInfoClassService;
import com.nevercome.tabook.modules.book.service.info.BookInfoRootService;
import com.nevercome.tabook.modules.book.service.info.BookInfoService;
import com.nevercome.tabook.modules.book.service.info.BookInstanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * @author: sun
 * @date: 2019/4/25
 */
@Controller
@RequestMapping(value = "${adminPath}/book/info")
public class BookInfoController extends BaseController {

    @Autowired
    private BookInfoService bookInfoService;
    @Autowired
    private BookInfoRootService bookInfoRootService;
    @Autowired
    private BookInfoClassService bookInfoClassService;
    @Autowired
    private BookInstanceService bookInstanceService;

    @RequestMapping(value = "get")
    public ResponseEntity get(HttpServletRequest request) {

        String bookInstanceId = request.getParameter("bookInstanceId");
        String bookClassId = request.getParameter("bookClassId");
        String bookRootId = request.getParameter("bookRootId");

        BookInfo bookInfo = null;

        if (StringUtils.isNotBlank(bookInstanceId)) {
            bookInfo = bookInfoService.getByBookInstanceId(bookInstanceId);
        } else if (StringUtils.isNotBlank(bookClassId)) {
            bookInfo = bookInfoService.getByBookClassId(bookClassId);
        } else if (StringUtils.isNotBlank(bookRootId)) {
            bookInfo = bookInfoService.getByBookRootId(bookRootId);
        }
        if (bookInfo == null) {
            return new ResponseEntity<>(new Result(HttpStatus.OK,
                    Result.RESULT_FAIL, "未查找到书籍信息"), HttpStatus.OK);
        }
        return new ResponseEntity<>(new Result(bookInfo), HttpStatus.OK);
    }

}
