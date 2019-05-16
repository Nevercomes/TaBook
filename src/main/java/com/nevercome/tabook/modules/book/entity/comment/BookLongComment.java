package com.nevercome.tabook.modules.book.entity.comment;

import com.nevercome.tabook.common.persistence.DataEntity;
import com.nevercome.tabook.modules.book.entity.info.BookInfo;
import com.nevercome.tabook.modules.book.entity.user.BookStudent;

/**
 * BookCommentLong实体类
 * @author sun
 */
public class BookLongComment extends DataEntity<BookLongComment> {

    private static final long serialVersionUID = 1L;

    // 持久化数据
    private String title;
    private String content;
    private float score;
    private String schoolId;
    private String bookRootId;

    // 联结数据
    // 若需求字段少且固定 可根据客户端显示需求单独设置 在dao层直接查询 而不在service层单独添加
    private BookInfo bookInfo;
    private BookStudent bookStudent;
    private int likeNum;

    // search begin
    private String favoriteStudentId;
    // search end

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        this.score = score;
    }

    public int getLikeNum() {
        return likeNum;
    }

    public void setLikeNum(int likeNum) {
        this.likeNum = likeNum;
    }

    public String getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(String schoolId) {
        this.schoolId = schoolId;
    }

    public String getBookRootId() {
        return bookRootId;
    }

    public void setBookRootId(String bookRootId) {
        this.bookRootId = bookRootId;
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

    public String getFavoriteStudentId() {
        return favoriteStudentId;
    }

    public void setFavoriteStudentId(String favoriteStudentId) {
        this.favoriteStudentId = favoriteStudentId;
    }
}
