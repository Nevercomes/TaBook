package com.nevercome.tabook.modules.book.entity.index;

import com.nevercome.tabook.common.persistence.DataEntity;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * BookIndexHead实体类
 * 书籍首页推荐信息
 * @author sun
 */
public class BookIndexHead extends DataEntity<BookIndexHead> {

    public static final long serialVersionUID = 1L;

    // 持久化数据 首页的推荐信息应该从数据库获取
    private String type; // 推荐的类型 book1 comment2 other3
    private String bookClassId;
    private String bookCommentId;
    private String spreadUrl; // 跳转到他处的url
    private String status; // 是否处于显示状态 显示1（默认） 不显示0
    private Date startTime;
    private Date expiredTime; // 设置的失效时间
    private String imgUrl; // 配图的url
    private BigDecimal sort; // 可能存在的排序

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getBookClassId() {
        return bookClassId;
    }

    public void setBookClassId(String bookClassId) {
        this.bookClassId = bookClassId;
    }

    public String getBookCommentId() {
        return bookCommentId;
    }

    public void setBookCommentId(String bookCommentId) {
        this.bookCommentId = bookCommentId;
    }

    public String getSpreadUrl() {
        return spreadUrl;
    }

    public void setSpreadUrl(String spreadUrl) {
        this.spreadUrl = spreadUrl;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getExpiredTime() {
        return expiredTime;
    }

    public void setExpiredTime(Date expiredTime) {
        this.expiredTime = expiredTime;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public BigDecimal getSort() {
        return sort;
    }

    public void setSort(BigDecimal sort) {
        this.sort = sort;
    }
}
