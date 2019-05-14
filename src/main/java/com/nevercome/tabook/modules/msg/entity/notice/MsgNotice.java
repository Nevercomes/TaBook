package com.nevercome.tabook.modules.msg.entity.notice;

import com.nevercome.tabook.common.persistence.DataEntity;

/**
 * @author: sun
 * @date: 2019/5/14
 */
public class MsgNotice extends DataEntity<MsgNotice> {

    private static final long serialVersionUID = 1L;

    private String msgNoticeId;
    private String userId;
    private String readFlag;
    private String readTime;

    public String getMsgNoticeId() {
        return msgNoticeId;
    }

    public void setMsgNoticeId(String msgNoticeId) {
        this.msgNoticeId = msgNoticeId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getReadFlag() {
        return readFlag;
    }

    public void setReadFlag(String readFlag) {
        this.readFlag = readFlag;
    }

    public String getReadTime() {
        return readTime;
    }

    public void setReadTime(String readTime) {
        this.readTime = readTime;
    }
}
