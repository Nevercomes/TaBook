package com.nevercome.tabook.modules.book.entity.index;

import com.nevercome.tabook.common.persistence.DataEntity;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * BookIndexHead实体类
 * 书籍首页推荐信息
 * @author sun
 */
@Data
public class BookIndexHead extends DataEntity<BookIndexHead> {

    // 持久化数据 首页的推荐信息应该从数据库获取
    private String type; // 推荐的类型 book1 comment2 other3
    private String bookClassId;
    private String bookCommentId;
    private String otherUrl; // 跳转到他处的url
    private String status; // 是否处于显示状态 显示1（默认） 不显示0
    private Date expiredTime; // 设置的失效时间
    private String imgUrl; // 配图的url
    private BigDecimal sort; // 可能存在的排序
}
