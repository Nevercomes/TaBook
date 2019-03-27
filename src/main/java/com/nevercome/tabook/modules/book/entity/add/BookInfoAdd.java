package com.nevercome.tabook.modules.book.entity.add;

import com.nevercome.tabook.common.persistence.DataEntity;
import lombok.Data;

import java.math.BigDecimal;

/**
 * BookInfoAdd实体类
 * 书籍信息上传的记录
 * @author sun
 */
@Data
public class BookInfoAdd extends DataEntity<BookInfoAdd> {

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

}
