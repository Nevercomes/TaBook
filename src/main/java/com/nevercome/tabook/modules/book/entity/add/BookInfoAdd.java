package com.nevercome.tabook.modules.book.entity.add;

import com.nevercome.tabook.common.persistence.DataEntity;
import lombok.Data;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import java.math.BigDecimal;

/**
 * BookInfoAdd实体类
 * 书籍信息上传的记录
 * @author sun
 */
public class BookInfoAdd extends DataEntity<BookInfoAdd> {

    private static final long serialVersionUID = 1L;

    // 持久化数据
    private String bookRootId;
    private String bookClassId;
    private String name; // 若没有两者书籍id之一 则需要用户提交书籍的基本信息
    private String author;
    private String press;
    private String year;
    private String ownerComment; // 所有者对书籍的评价 也可以是他给借书者的留言
    private String type; // 上架类型 下架0 借书1 卖书2
    private float price; // type=2 表示卖书价格

    public String getBookRootId() {
        return bookRootId;
    }

    public void setBookRootId(String bookRootId) {
        this.bookRootId = bookRootId;
    }

    public String getBookClassId() {
        return bookClassId;
    }

    public void setBookClassId(String bookClassId) {
        this.bookClassId = bookClassId;
    }

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

    public String getOwnerComment() {
        return ownerComment;
    }

    public void setOwnerComment(String ownerComment) {
        this.ownerComment = ownerComment;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }
}
