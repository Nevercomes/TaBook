package com.nevercome.tabook.modules.book.web.info;

import com.google.common.collect.Lists;
import com.nevercome.tabook.common.persistence.Page;
import com.nevercome.tabook.common.utils.StringUtils;
import com.nevercome.tabook.common.web.BaseController;
import com.nevercome.tabook.common.web.Result;
import com.nevercome.tabook.modules.book.entity.info.BookInfo;
import com.nevercome.tabook.modules.book.entity.info.BookInfoRoot;
import com.nevercome.tabook.modules.book.service.info.BookInfoClassService;
import com.nevercome.tabook.modules.book.service.info.BookInfoRootService;
import com.nevercome.tabook.modules.book.service.info.BookInfoService;
import com.nevercome.tabook.modules.book.service.info.BookInstanceService;
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
 * @date: 2019/4/25
 */
@Controller
@RequestMapping(value = "${adminPath}/book/info")
public class BookInfoController extends BaseController {

    @Autowired
    private BookInfoService bookInfoService;

//    @RequiresPermissions("book:info:view")
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

//    @RequiresPermissions("book:info:view")
    @RequestMapping(value = "list")
    public ResponseEntity list(HttpServletRequest request, HttpServletResponse response, BookInfo bookInfo) {
        Page<BookInfo> page = bookInfoService.findPage(new Page<>(request, response), bookInfo);
        return new ResponseEntity<>(new Result(page), HttpStatus.OK);
    }

}
