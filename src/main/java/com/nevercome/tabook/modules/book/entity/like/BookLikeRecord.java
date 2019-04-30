package com.nevercome.tabook.modules.book.entity.like;

import com.nevercome.tabook.common.persistence.DataEntity;

/**
 * @author: sun
 * @date: 2019/4/30
 */
public class BookLikeRecord extends DataEntity<BookLikeRecord> {

    private String type;
    private String referId;

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
