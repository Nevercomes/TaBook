package com.nevercome.tabook.modules.msg.entity.comment;

import com.nevercome.tabook.common.persistence.DataEntity;
import com.nevercome.tabook.modules.book.entity.comment.BookLongComment;

/**
 * @author: sun
 * @date: 2019/5/14
 */
public class MsgNoticeComment extends DataEntity<MsgNoticeComment> {


    private static final long serialVersionUID = 1L;

    private String userId;
    private String replyId;

    private String longCommentId;

    private String creatorName;
    private String creatorAvatar;

    private String replyContent;

    private BookLongComment bookLongComment;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getReplyId() {
        return replyId;
    }

    public void setReplyId(String replyId) {
        this.replyId = replyId;
    }

    public String getLongCommentId() {
        return longCommentId;
    }

    public void setLongCommentId(String longCommentId) {
        this.longCommentId = longCommentId;
    }

    public String getCreatorName() {
        return creatorName;
    }

    public void setCreatorName(String creatorName) {
        this.creatorName = creatorName;
    }

    public String getCreatorAvatar() {
        return creatorAvatar;
    }

    public void setCreatorAvatar(String creatorAvatar) {
        this.creatorAvatar = creatorAvatar;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }

    public BookLongComment getBookLongComment() {
        return bookLongComment;
    }

    public void setBookLongComment(BookLongComment bookLongComment) {
        this.bookLongComment = bookLongComment;
    }
}
