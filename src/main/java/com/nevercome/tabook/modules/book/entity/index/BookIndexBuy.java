package com.nevercome.tabook.modules.book.entity.index;

import com.nevercome.tabook.common.persistence.DataEntity;
import com.nevercome.tabook.modules.book.entity.info.BookInfo;
import com.nevercome.tabook.modules.book.entity.user.Student;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * BookIndexBuy实体类
 * 首页借书推荐的实体类
 * @author sun
 */
public class BookIndexBuy extends DataEntity<BookIndexBuy> {

    private static final long serialVersionUID = 1L;

    // 持久化数据
    private String bookInstanceId;
    private String status; // 是否处于显示状态 显示1（默认） 不显示0
    private Date expiredTime; // 设置的失效时间
    private BigDecimal sort; // 可能存在的排序

    // 联结数据
    // 若需求字段少且固定 可根据客户端显示需求单独设置 在dao层直接查询 而不在service层单独添加
    private BookInfo bookInfo;
    private Student student;

    public String getBookInstanceId() {
        return bookInstanceId;
    }

    public void setBookInstanceId(String bookInstanceId) {
        this.bookInstanceId = bookInstanceId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getExpiredTime() {
        return expiredTime;
    }

    public void setExpiredTime(Date expiredTime) {
        this.expiredTime = expiredTime;
    }

    public BigDecimal getSort() {
        return sort;
    }

    public void setSort(BigDecimal sort) {
        this.sort = sort;
    }

    public BookInfo getBookInfo() {
        return bookInfo;
    }

    public void setBookInfo(BookInfo bookInfo) {
        this.bookInfo = bookInfo;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }
}
