package com.nevercome.tabook.modules.msg.entity.notice;

import com.nevercome.tabook.common.persistence.DataEntity;

import java.util.Date;

/**
 * @author: sun
 * @date: 2019/5/14
 */
public class MsgNotice extends DataEntity<MsgNotice> {

    private static final long serialVersionUID = 1L;

    private String msgNoticeId;
    private String type;
    private String userId;
    private String readFlag;
    private Date readTime;

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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getReadFlag() {
        return readFlag;
    }

    public void setReadFlag(String readFlag) {
        this.readFlag = readFlag;
    }

    public Date getReadTime() {
        return readTime;
    }

    public void setReadTime(Date readTime) {
        this.readTime = readTime;
    }
}
