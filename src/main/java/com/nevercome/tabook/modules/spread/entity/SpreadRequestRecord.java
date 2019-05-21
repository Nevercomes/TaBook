package com.nevercome.tabook.modules.spread.entity;

import com.nevercome.tabook.common.persistence.DataEntity;

import java.util.Date;

/**
 * @author: sun
 * @date: 2019/5/21
 */
public class SpreadRequestRecord extends DataEntity<SpreadRequestRecord> {

    private static final long serialVersionUID = 1L;

    private String orgId;
    private String title;
    private String content;
    private String spreadImg;
    private String spreadUrl;
    private Date startTime;
    private Date expireTime;
    private String status;

    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
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

    public String getSpreadImg() {
        return spreadImg;
    }

    public void setSpreadImg(String spreadImg) {
        this.spreadImg = spreadImg;
    }

    public String getSpreadUrl() {
        return spreadUrl;
    }

    public void setSpreadUrl(String spreadUrl) {
        this.spreadUrl = spreadUrl;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getExpireTime() {
        return expireTime;
    }

    public void setExpireTime(Date expireTime) {
        this.expireTime = expireTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
