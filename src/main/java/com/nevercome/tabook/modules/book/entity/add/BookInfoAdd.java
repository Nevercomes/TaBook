package com.nevercome.tabook.modules.book.entity.add;

import com.nevercome.tabook.common.persistence.DataEntity;
import com.nevercome.tabook.modules.book.entity.info.BookInfo;
import lombok.Data;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import java.math.BigDecimal;
import java.util.List;

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
    private String bookInstanceId;
    private String name; // 若没有两者书籍id之一 则需要用户提交书籍的基本信息
    private String author;
    private String press;
    private String year;
    private String ownerComment; // 所有者对书籍的评价 也可以是他给借书者的留言
    private String type; // 上架类型 下架0 借书1 卖书2
    private float price; // type=2 表示卖书价格
    private int newPercent; // 新旧程度

    private String realImg1; // 实物图1
    private String realImg2;
    private String realImg3;

    private List<String> sortNameList; // 分类 名
    private String sorts; // 分类的所有id
    private List<String> tagNameList; // 所有的标签名
    private String tags; // 所有的标签 id

    // 表示层
    private BookInfo bookInfo;

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

    public List<String> getSortNameList() {
        return sortNameList;
    }

    public void setSortNameList(List<String> sortNameList) {
        this.sortNameList = sortNameList;
    }

    public String getSorts() {
        return sorts;
    }

    public void setSorts(String sorts) {
        this.sorts = sorts;
    }

    public List<String> getTagNameList() {
        return tagNameList;
    }

    public void setTagNameList(List<String> tagNameList) {
        this.tagNameList = tagNameList;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public int getNewPercent() {
        return newPercent;
    }

    public void setNewPercent(int newPercent) {
        this.newPercent = newPercent;
    }

    public BookInfo getBookInfo() {
        return bookInfo;
    }

    public void setBookInfo(BookInfo bookInfo) {
        this.bookInfo = bookInfo;
    }

    public String getRealImg1() {
        return realImg1;
    }

    public void setRealImg1(String realImg1) {
        this.realImg1 = realImg1;
    }

    public String getRealImg2() {
        return realImg2;
    }

    public void setRealImg2(String realImg2) {
        this.realImg2 = realImg2;
    }

    public String getRealImg3() {
        return realImg3;
    }

    public void setRealImg3(String realImg3) {
        this.realImg3 = realImg3;
    }

    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }
}
