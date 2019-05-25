package com.nevercome.tabook.modules.book.entity.index;

import com.nevercome.tabook.common.persistence.DataEntity;
import com.nevercome.tabook.modules.book.entity.info.BookInfo;
import com.nevercome.tabook.modules.book.entity.user.BookStudent;

import java.math.BigDecimal;
import java.util.Date;

/**
 * BookIndexBuy实体类
 * 首页借书推荐的实体类
 * @author sun
 */
public class BookIndexBuy extends DataEntity<BookIndexBuy> {

    private static final long serialVersionUID = 1L;

    // book
    private String bookInstanceId;
    private String name;
    private String imgUrl; // 实物图
    private String author;
    private String translator;
    private String year;
    private String press;
    private String ownerComment;

    // buy
    private float price;
    private String newPercent;

    public String getBookInstanceId() {
        return bookInstanceId;
    }

    public void setBookInstanceId(String bookInstanceId) {
        this.bookInstanceId = bookInstanceId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getTranslator() {
        return translator;
    }

    public void setTranslator(String translator) {
        this.translator = translator;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getNewPercent() {
        return newPercent;
    }

    public void setNewPercent(String newPercent) {
        this.newPercent = newPercent;
    }

    public String getOwnerComment() {
        return ownerComment;
    }

    public void setOwnerComment(String ownerComment) {
        this.ownerComment = ownerComment;
    }
}
