package com.nevercome.tabook.modules.msg.entity.like;

import com.nevercome.tabook.common.persistence.DataEntity;
import com.nevercome.tabook.modules.book.entity.comment.BookCommentReply;
import com.nevercome.tabook.modules.book.entity.comment.BookLongComment;
import com.nevercome.tabook.modules.book.entity.comment.BookShortComment;

/**
 * @author: sun
 * @date: 2019/5/14
 */
public class MsgNoticeLike extends DataEntity<MsgNoticeLike> {

    private static final long serialVersionUID = 1L;

    private String likeRecordId;
    private String userId;

    private String likeCreatorId;
    private String likeCreatorName;
    private String likeCreatorAvatar;

    // type BOOK_LIKE_SHORT_COMMENT 1
    private BookShortComment bookShortComment;

    // type BOOK_LIKE_LONG_COMMENT 2
    private BookLongComment bookLongComment;

    // type BOOK_LIKE_COMMENT_REPLY 3
    private BookCommentReply bookCommentReply;

    // type BOOK_LIKE_BOOK_INSTANCE 4
    private String bookName;
    private String bookImg;
    private String ownerComment;


    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getLikeRecordId() {
        return likeRecordId;
    }

    public void setLikeRecordId(String likeRecordId) {
        this.likeRecordId = likeRecordId;
    }

    public String getLikeCreatorId() {
        return likeCreatorId;
    }

    public void setLikeCreatorId(String likeCreatorId) {
        this.likeCreatorId = likeCreatorId;
    }

    public String getLikeCreatorName() {
        return likeCreatorName;
    }

    public void setLikeCreatorName(String likeCreatorName) {
        this.likeCreatorName = likeCreatorName;
    }

    public String getLikeCreatorAvatar() {
        return likeCreatorAvatar;
    }

    public void setLikeCreatorAvatar(String likeCreatorAvatar) {
        this.likeCreatorAvatar = likeCreatorAvatar;
    }

    public BookShortComment getBookShortComment() {
        return bookShortComment;
    }

    public void setBookShortComment(BookShortComment bookShortComment) {
        this.bookShortComment = bookShortComment;
    }

    public BookLongComment getBookLongComment() {
        return bookLongComment;
    }

    public void setBookLongComment(BookLongComment bookLongComment) {
        this.bookLongComment = bookLongComment;
    }

    public BookCommentReply getBookCommentReply() {
        return bookCommentReply;
    }

    public void setBookCommentReply(BookCommentReply bookCommentReply) {
        this.bookCommentReply = bookCommentReply;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBookImg() {
        return bookImg;
    }

    public void setBookImg(String bookImg) {
        this.bookImg = bookImg;
    }

    public String getOwnerComment() {
        return ownerComment;
    }

    public void setOwnerComment(String ownerComment) {
        this.ownerComment = ownerComment;
    }

    /**
     * 点赞类型 短评
     */
    public static final String BOOK_LIKE_SHORT_COMMENT = "1";

    /**
     * 点赞类型 长评
     */
    public static final String BOOK_LIKE_LONG_COMMENT = "2";

    /**
     * 点赞类型 回复
     */
    public static final String BOOK_LIKE_COMMENT_REPLY = "3";

    /**
     * 点赞类型 bookInstance
     */
    public static final String BOOK_LIKE_BOOK_INSTANCE = "4";
}
