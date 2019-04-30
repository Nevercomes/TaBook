package com.nevercome.tabook.modules.book.entity.favorite;

import com.nevercome.tabook.common.persistence.DataEntity;
import com.nevercome.tabook.modules.book.entity.info.BookInfo;
import com.nevercome.tabook.modules.book.entity.user.BookStudent;

/**
 * BookUserFavorite实体类
 * 包括收藏的图书、长书评
 * @author sun
 */
public class BookUserFavorite extends DataEntity<BookUserFavorite> {

    private static final long serialVersionUID = 1L;

    // 持久化数据
    private String type; // 书籍1 书评2
    private String bookClassId;
    private String bookCommentId;

    // 联结数据
    // 若需求字段少且固定 可根据客户端显示需求单独设置 在dao层直接查询 而不在service层单独添加
    private BookInfo bookInfo;
    private BookStudent bookStudent;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getBookClassId() {
        return bookClassId;
    }

    public void setBookClassId(String bookClassId) {
        this.bookClassId = bookClassId;
    }

    public String getBookCommentId() {
        return bookCommentId;
    }

    public void setBookCommentId(String bookCommentId) {
        this.bookCommentId = bookCommentId;
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
