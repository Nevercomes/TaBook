package com.nevercome.tabook.modules.book.entity.user;

import com.nevercome.tabook.common.persistence.DataEntity;

/**
 * 业务逻辑用户Student实体类
 * @author sun
 */
public class BookStudent extends DataEntity<BookStudent> {

    private static final long serialVersionUID = 1L;

    // 持久化数据
    private String userId;
    private String name;
    private String QQ;
    private String phone;
    private String avatarUrl;
    private String creditScore;

    // 联结数据
    private boolean isIdentified;

    // 统计数据
    private int totalUpload; // 累计上传书籍
    private int totalLent; // 累计借出
    private int totalBorrowed; // 累计借入
    private int totalBought; // 累计买入
    private int totalSold; // 累计卖出
    private int totalLike; // 累计获赞

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getQQ() {
        return QQ;
    }

    public void setQQ(String QQ) {
        this.QQ = QQ;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public String getCreditScore() {
        return creditScore;
    }

    public void setCreditScore(String creditScore) {
        this.creditScore = creditScore;
    }

    public int getTotalUpload() {
        return totalUpload;
    }

    public void setTotalUpload(int totalUpload) {
        this.totalUpload = totalUpload;
    }

    public int getTotalLent() {
        return totalLent;
    }

    public void setTotalLent(int totalLent) {
        this.totalLent = totalLent;
    }

    public int getTotalBorrowed() {
        return totalBorrowed;
    }

    public void setTotalBorrowed(int totalBorrowed) {
        this.totalBorrowed = totalBorrowed;
    }

    public int getTotalBought() {
        return totalBought;
    }

    public void setTotalBought(int totalBought) {
        this.totalBought = totalBought;
    }

    public int getTotalSold() {
        return totalSold;
    }

    public void setTotalSold(int totalSold) {
        this.totalSold = totalSold;
    }

    public int getTotalLike() {
        return totalLike;
    }

    public void setTotalLike(int totalLike) {
        this.totalLike = totalLike;
    }

    public boolean getIsIdentified() {
        return isIdentified;
    }

    public void setIdentified(boolean identified) {
        isIdentified = identified;
    }
}
