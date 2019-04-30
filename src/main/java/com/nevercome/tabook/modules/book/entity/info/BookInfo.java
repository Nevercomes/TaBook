package com.nevercome.tabook.modules.book.entity.info;

import com.nevercome.tabook.common.persistence.DataEntity;
import com.nevercome.tabook.modules.book.entity.info.statistics.BookInfoClassStatistics;
import com.nevercome.tabook.modules.book.entity.info.statistics.BookInfoRootStatistics;
import lombok.Data;

/***
 * BookInfo实体类的聚合
 * 客户端获取书籍信息数据时多返回此类
 * @author sun
 */
public class BookInfo extends DataEntity<BookInfo> {

    private BookInfoRoot bookRoot;
    private BookInfoClass bookClass;
    private BookInfoInstance bookInstance;

    private BookInfoClassStatistics bookClassSta;
    private BookInfoRootStatistics bookRootSta;

//    search begin
    private String isBookClass;
    private String isBookRoot;
    private String favoriteStudentId;
//    search end

    public BookInfoRoot getBookRoot() {
        return bookRoot;
    }

    public void setBookRoot(BookInfoRoot bookRoot) {
        this.bookRoot = bookRoot;
    }

    public BookInfoClass getBookClass() {
        return bookClass;
    }

    public void setBookClass(BookInfoClass bookClass) {
        this.bookClass = bookClass;
    }

    public BookInfoInstance getBookInstance() {
        return bookInstance;
    }

    public void setBookInstance(BookInfoInstance bookInstance) {
        this.bookInstance = bookInstance;
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
}
