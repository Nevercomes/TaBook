package com.nevercome.tabook.modules.msg.entity.letter;

import com.nevercome.tabook.common.persistence.DataEntity;

/**
 * @author: sun
 * @date: 2019/5/14
 */
public class MsgNoticeLetter  extends DataEntity<MsgNoticeLetter> {

    private static final long serialVersionUID = 1L;

    private String receiveUserId;
    private String title;
    private String content;

    public String getReceiveUserId() {
        return receiveUserId;
    }

    public void setReceiveUserId(String receiveUserId) {
        this.receiveUserId = receiveUserId;
    }

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
}
