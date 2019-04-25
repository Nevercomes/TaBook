package com.nevercome.tabook.modules.book.entity.info;

import com.nevercome.tabook.common.persistence.DataEntity;
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
}
