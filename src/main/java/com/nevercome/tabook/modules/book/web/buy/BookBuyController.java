package com.nevercome.tabook.modules.book.web.buy;

import com.nevercome.tabook.common.config.Global;
import com.nevercome.tabook.common.persistence.Page;
import com.nevercome.tabook.common.web.BaseController;
import com.nevercome.tabook.common.web.Result;
import com.nevercome.tabook.modules.book.entity.buy.BookBuyRecord;
import com.nevercome.tabook.modules.book.service.buy.BookBuyRecordService;
import com.nevercome.tabook.modules.sys.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 买书记录Controller 现阶段逻辑和借书其实是一样的
 * 之后看情况更新 所以分离了出来
 *
 * @author: sun
 * @date: 2019/4/30
 */
@Controller
@RequestMapping(value = "${adminPath}/book/buy")
public class BookBuyController extends BaseController {

    @Autowired
    private BookBuyRecordService bookBuyRecordService;

    /**
     * 买书申请
     */
    @RequestMapping(value = "request")
    public ResponseEntity request(HttpServletRequest request, BookBuyRecord bookBuyRecord) {
        bookBuyRecord.setRequesterId(UserUtils.getUser().getBookStudent().getId());
        bookBuyRecordService.save(bookBuyRecord);
        return new ResponseEntity<>(new Result(), HttpStatus.OK);
    }

    /**
     * 申请确认
     */
    @RequestMapping(value = "confirm")
    public ResponseEntity confirm(HttpServletRequest request, BookBuyRecord bookBuyRecord) {
        String status = bookBuyRecord.getStatus();
        bookBuyRecord = bookBuyRecordService.get(bookBuyRecord);
        bookBuyRecord.setStatus(status);
        bookBuyRecordService.save(bookBuyRecord);
        return new ResponseEntity<>(new Result(), HttpStatus.OK);
    }


    @RequestMapping(value = "cancel")
    public ResponseEntity cancel(HttpServletRequest request, BookBuyRecord bookBuyRecord) {
        bookBuyRecord = bookBuyRecordService.get(bookBuyRecord);
        bookBuyRecord.setCancel(Global.YES);
        bookBuyRecordService.save(bookBuyRecord);
        return new ResponseEntity<>(new Result(), HttpStatus.OK);
    }

    /**
     * 展示我的申请（买书）的地方
     */
    @RequestMapping(value = "list")
    public ResponseEntity list(HttpServletRequest request, HttpServletResponse response, BookBuyRecord bookBuyRecord) {
        Page<BookBuyRecord> page = bookBuyRecordService.findPage(new Page<>(request, response), bookBuyRecord);
        return new ResponseEntity<>(new Result(page), HttpStatus.OK);
    }

}
