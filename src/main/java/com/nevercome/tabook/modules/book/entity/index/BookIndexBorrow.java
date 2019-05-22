package com.nevercome.tabook.modules.book.entity.index;

import com.nevercome.tabook.common.persistence.DataEntity;
import com.nevercome.tabook.modules.book.entity.info.BookInfo;
import com.nevercome.tabook.modules.book.entity.user.BookStudent;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * BookIndexBorrow实体类
 * 首页借书推荐的实体类
 * @author sun
 */
public class BookIndexBorrow extends DataEntity<BookIndexBorrow> {

    private static final long serialVersionUID = 1L;

    // book
    private String bookRootId;
    private String bookClassId;
    private String name;
    private String imgUrl;
    private String author;
    private String translator;
    private String year;
    private String press;
    private String intro;
    private String score;
    private String totalBorrowed;

    // statistics
    private String copyNum;
    private String freeNum;

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

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public String getCopyNum() {
        return copyNum;
    }

    public void setCopyNum(String copyNum) {
        this.copyNum = copyNum;
    }

    public String getFreeNum() {
        return freeNum;
    }

    public void setFreeNum(String freeNum) {
        this.freeNum = freeNum;
    }

    public String getTotalBorrowed() {
        return totalBorrowed;
    }

    public void setTotalBorrowed(String totalBorrowed) {
        this.totalBorrowed = totalBorrowed;
    }
}
