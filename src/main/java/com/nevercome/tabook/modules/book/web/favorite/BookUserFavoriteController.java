package com.nevercome.tabook.modules.book.web.favorite;

import com.nevercome.tabook.common.config.Global;
import com.nevercome.tabook.common.persistence.Page;
import com.nevercome.tabook.common.web.BaseController;
import com.nevercome.tabook.common.web.Result;
import com.nevercome.tabook.modules.book.entity.comment.BookLongComment;
import com.nevercome.tabook.modules.book.entity.favorite.BookUserFavorite;
import com.nevercome.tabook.modules.book.entity.info.BookInfo;
import com.nevercome.tabook.modules.book.service.comment.BookLongCommentService;
import com.nevercome.tabook.modules.book.service.favorite.BookUserFavoriteService;
import com.nevercome.tabook.modules.book.service.info.BookInfoService;
import com.nevercome.tabook.modules.book.utils.BookConstant;
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
 * @date: 2019/4/30
 */
@Controller
@RequestMapping(value = "{adminPath}/book/favorite")
public class BookUserFavoriteController extends BaseController {

    @Autowired
    private BookUserFavoriteService bookUserFavoriteService;
    @Autowired
    private BookInfoService bookInfoService;
    @Autowired
    private BookLongCommentService bookLongCommentService;


    @RequiresPermissions("book:favorite:edit")
    @RequestMapping(value = "add")
    public ResponseEntity addOrCancel(HttpServletRequest request, BookUserFavorite bookUserFavorite) {
        String cancel = request.getParameter("cancel");
        // 取消收藏
        if (Global.TRUE.equals(cancel)) {
            bookUserFavoriteService.delete(bookUserFavorite);
        } else {
            bookUserFavoriteService.save(bookUserFavorite);
        }
        return new ResponseEntity<>(new Result(), HttpStatus.OK);
    }

    @RequiresPermissions("book:favorite:view")
    @RequestMapping(value = "list")
    public ResponseEntity list(HttpServletRequest request, HttpServletResponse response, BookUserFavorite bookUserFavorite) {
        String type = bookUserFavorite.getType();
        if (BookConstant.BOOK_FAVORITE_BOOK.equals(type)) {
            BookInfo bookInfo = new BookInfo();
            bookInfo.setFavoriteStudentId(bookUserFavorite.getStudentId());
            Page<BookInfo> bookInfoList = bookInfoService.findPage(new Page<>(request, response), bookInfo);
            return new ResponseEntity<>(new Result(bookInfoList), HttpStatus.OK);
        } else if (BookConstant.BOOK_FAVORITE_COMMENT.equals(type)) {
            BookLongComment bookLongComment = new BookLongComment();
            bookLongComment.setFavoriteStudentId(bookUserFavorite.getStudentId());
            Page<BookLongComment> bookLongCommentList = bookLongCommentService.findPage(new Page<>(request, response), bookLongComment);
            return new ResponseEntity<>(new Result(bookLongCommentList), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(new Result(HttpStatus.OK, Result.RESULT_FAIL,"请求参数错误"), HttpStatus.OK);
        }
    }

}
