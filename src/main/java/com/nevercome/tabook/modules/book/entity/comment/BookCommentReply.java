package com.nevercome.tabook.modules.book.entity.comment;

import com.nevercome.tabook.common.persistence.DataEntity;
import com.nevercome.tabook.modules.book.entity.info.BookInfo;
import com.nevercome.tabook.modules.book.entity.user.BookStudent;

/**
 * BookCommentReply实体类
 * @author sun
 */
public class BookCommentReply extends DataEntity<BookCommentReply> {

    private static final long serialVersionUID = 1L;

    private String bookCommentId;
    private String likeNum;
    private String content;

    // 联结数据
    // 若需求字段少且固定 可根据客户端显示需求单独设置 在dao层直接查询 而不在service层单独添加
    private BookInfo bookInfo;
    private BookStudent bookStudent;

    public String getBookCommentId() {
        return bookCommentId;
    }

    public void setBookCommentId(String bookCommentId) {
        this.bookCommentId = bookCommentId;
    }

    public String getLikeNum() {
        return likeNum;
    }

    public void setLikeNum(String likeNum) {
        this.likeNum = likeNum;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public BookInfo getBookInfo() {
        return bookInfo;
    }

    public void setBookInfo(BookInfo bookInfo) {
        this.bookInfo = bookInfo;
    }

    public BookStudent getBookStudent() {
        return bookStudent;
    }

    public void setBookStudent(BookStudent bookStudent) {
        this.bookStudent = bookStudent;
    }
}
