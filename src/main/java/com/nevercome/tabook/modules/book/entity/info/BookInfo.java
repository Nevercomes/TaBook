package com.nevercome.tabook.modules.book.entity.info;

import com.nevercome.tabook.common.persistence.DataEntity;
import com.nevercome.tabook.modules.book.entity.info.statistics.BookInfoClassStatistics;
import com.nevercome.tabook.modules.book.entity.info.statistics.BookInfoRootStatistics;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

/***
 * BookInfo实体类的聚合
 * 客户端获取书籍信息数据时多返回此类
 * @author sun
 */
public class BookInfo extends DataEntity<BookInfo> {

    private static final long serialVersionUID = 1L;

    private BookInfoRoot bookInfoRoot;
    private BookInfoClass bookInfoClass;
    private BookInfoInstance bookInfoInstance;

    private BookInfoClassStatistics bookClassSta;
    private BookInfoRootStatistics bookRootSta;

//    search begin
    private String isBookClass;
    private String isBookRoot;
    private String favoriteStudentId;
//    search end


    public BookInfo() {
    }

    public BookInfo(BookInfoRoot bookInfoRoot) {
        this.bookInfoRoot = bookInfoRoot;
    }

    public BookInfo(BookInfoClass bookInfoClass) {
        this.bookInfoClass = bookInfoClass;
    }

    public BookInfo(BookInfoInstance bookInfoInstance) {
        this.bookInfoInstance = bookInfoInstance;
    }

    public BookInfoRoot getBookInfoRoot() {
        return bookInfoRoot;
    }

    public void setBookInfoRoot(BookInfoRoot bookInfoRoot) {
        this.bookInfoRoot = bookInfoRoot;
    }

    public BookInfoClass getBookInfoClass() {
        return bookInfoClass;
    }

    public void setBookInfoClass(BookInfoClass bookInfoClass) {
        this.bookInfoClass = bookInfoClass;
    }

    public BookInfoInstance getBookInfoInstance() {
        return bookInfoInstance;
    }

    public void setBookInfoInstance(BookInfoInstance bookInfoInstance) {
        this.bookInfoInstance = bookInfoInstance;
    }

    public BookInfoClassStatistics getBookClassSta() {
        return bookClassSta;
    }

    public void setBookClassSta(BookInfoClassStatistics bookClassSta) {
        this.bookClassSta = bookClassSta;
    }

    public BookInfoRootStatistics getBookRootSta() {
        return bookRootSta;
    }

    public void setBookRootSta(BookInfoRootStatistics bookRootSta) {
        this.bookRootSta = bookRootSta;
    }

    public String getIsBookClass() {
        return isBookClass;
    }

    public void setIsBookClass(String isBookClass) {
        this.isBookClass = isBookClass;
    }

    public String getIsBookRoot() {
        return isBookRoot;
    }

    public void setIsBookRoot(String isBookRoot) {
        this.isBookRoot = isBookRoot;
    }

    public String getFavoriteStudentId() {
        return favoriteStudentId;
    }

    public void setFavoriteStudentId(String favoriteStudentId) {
        this.favoriteStudentId = favoriteStudentId;
    }

    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }
}
