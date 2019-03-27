package com.nevercome.tabook.modules.book.entity.info;

import com.nevercome.tabook.common.persistence.DataEntity;
import lombok.Data;

/***
 * BookInfo实体类的聚合
 * 客户端获取书籍信息数据时多返回此类
 * @author sun
 */
@Data
public class BookInfo extends DataEntity<BookInfo> {
    private BookInfoRoot bookRoot;
    private BookInfoClass bookClass;
    private BookInfoInstance bookInstance;
}
