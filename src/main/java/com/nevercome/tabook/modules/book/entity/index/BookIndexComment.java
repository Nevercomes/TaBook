package com.nevercome.tabook.modules.book.entity.index;

import com.nevercome.tabook.common.persistence.DataEntity;

/**
 * @author: sun
 * @date: 2019/5/21
 */
public class BookIndexComment extends DataEntity<BookIndexComment> {

    private static final long serialVersionUID = 1L;

    // user
    private String studentId;
    private String authorAvatar;
    private String authorName;
    private String schoolName;

    // comment
    private String bookCommentId;
    private String title;
    private String contentDigest;
    private String cover;

    // statistics
    private String likeNum;
    private String replyNum;

    @Override
    public String getStudentId() {
        return studentId;
    }

    @Override
    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getAuthorAvatar() {
        return authorAvatar;
    }

    public void setAuthorAvatar(String authorAvatar) {
        this.authorAvatar = authorAvatar;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public String getBookCommentId() {
        return bookCommentId;
    }

    public void setBookCommentId(String bookCommentId) {
        this.bookCommentId = bookCommentId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public String getContentDigest() {
        return contentDigest;
    }

    public void setContentDigest(String contentDigest) {
        this.contentDigest = contentDigest;
    }

    public String getLikeNum() {
        return likeNum;
    }

    public void setLikeNum(String likeNum) {
        this.likeNum = likeNum;
    }

    public String getReplyNum() {
        return replyNum;
    }

    public void setReplyNum(String replyNum) {
        this.replyNum = replyNum;
    }
}
