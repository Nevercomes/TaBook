package com.nevercome.tabook.modules.book.entity.info.statistics;

import java.util.Date;

/**
 * 可能需要进行对书籍信息进行动静分离
 * 以方便进行缓存
 */
public class BookInfoRootStatistics {

    private int copyNum; // 副本数目
    private int totalBorrowed; // 累计借阅
    private int totalBought; // 累计买卖

    private Date startTime; // 统计时间
    private Date endTime; // 统计时间

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

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }
}
