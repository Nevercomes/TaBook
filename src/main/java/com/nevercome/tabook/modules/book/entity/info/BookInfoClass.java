package com.nevercome.tabook.modules.book.entity.info;

import com.nevercome.tabook.common.persistence.DataEntity;
import lombok.Data;

/**
 * BookInfoClass实体类
 * @author sun
 */
public class BookInfoClass extends DataEntity<BookInfoClass> {

    private static final long serialVersionUID = 1L;

    // 持久化数据
    private String bookRootId; // 上一级指针
    private String ISBN;
    private String version; // 书籍版本 一本书的第一版 第二版
    private String press;
    private String year; // 出版年份
    private float score; // 书籍评分
    private String intro; // 书籍简介
    private String imgUrl; // 书籍配图的url 如果是爬虫则为url 如果保存在文件服务器 则可能为id拼接后的url

    // 统计数据
    private String status; // 书籍类目的状态 状态参数见BookConstant
    private int totalBorrowed; // 书籍累计借阅 可按时段统计
    private int totalBought; // 书籍累计买卖 可按时段统计
    private int copyNum; // 副本数目

    // 搜索参数


    public String getBookRootId() {
        return bookRootId;
    }

    public void setBookRootId(String bookRootId) {
        this.bookRootId = bookRootId;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        this.score = score;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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

    public int getCopyNum() {
        return copyNum;
    }

    public void setCopyNum(int copyNum) {
        this.copyNum = copyNum;
    }
}
