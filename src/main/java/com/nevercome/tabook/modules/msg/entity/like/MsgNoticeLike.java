package com.nevercome.tabook.modules.msg.entity.like;

import com.nevercome.tabook.common.persistence.DataEntity;

/**
 * @author: sun
 * @date: 2019/5/14
 */
public class MsgNoticeLike extends DataEntity<MsgNoticeLike> {

    private static final long serialVersionUID = 1L;

    private String userId;
    private String type;
    private String referId;

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

    public String getReferId() {
        return referId;
    }

    public void setReferId(String referId) {
        this.referId = referId;
    }
}
