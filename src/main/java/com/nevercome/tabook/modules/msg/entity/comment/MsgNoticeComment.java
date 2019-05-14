package com.nevercome.tabook.modules.msg.entity.comment;

import com.nevercome.tabook.common.persistence.DataEntity;

/**
 * @author: sun
 * @date: 2019/5/14
 */
public class MsgNoticeComment extends DataEntity<MsgNoticeComment> {


    private static final long serialVersionUID = 1L;

    private String userId;
    private String commentId;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getCommentId() {
        return commentId;
    }

    public void setCommentId(String commentId) {
        this.commentId = commentId;
    }
}
