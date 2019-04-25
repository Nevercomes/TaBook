package com.nevercome.tabook.modules.book.entity.info;

import com.nevercome.tabook.common.persistence.DataEntity;
import lombok.Data;

/**
 * BookInfoRoot实体类
 * @author sun
 */
public class BookInfoRoot extends DataEntity<BookInfoRoot> {

    private static final long serialVersionUID = 1L;

    // 持久化数据
    private String name;
    private String author;
    private String sortSeq; // 排序序列
    private String representId; // bookClass代表root的id

    // 统计数据
    private String status; // root的当前状态 状态参数见BookConstant
    private int totalBorrowed; // 书籍累计借阅 可按时段统计
    private int totalBought; // 书籍累计买卖 可按时段统计
    private String copyNum; // 副本数目

    // 搜索参数


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getSortSeq() {
        return sortSeq;
    }

    public void setSortSeq(String sortSeq) {
        this.sortSeq = sortSeq;
    }

    public String getRepresentId() {
        return representId;
    }

    public void setRepresentId(String representId) {
        this.representId = representId;
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

    public String getCopyNum() {
        return copyNum;
    }

    public void setCopyNum(String copyNum) {
        this.copyNum = copyNum;
    }
}
