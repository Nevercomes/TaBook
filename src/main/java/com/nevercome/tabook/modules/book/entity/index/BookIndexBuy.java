package com.nevercome.tabook.modules.book.entity.index;

import com.nevercome.tabook.common.persistence.DataEntity;
import com.nevercome.tabook.modules.book.entity.info.BookInfo;
import com.nevercome.tabook.modules.book.entity.user.Student;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * BookIndexBuy实体类
 * 首页借书推荐的实体类
 * @author sun
 */
@Data
public class BookIndexBuy extends DataEntity<BookIndexBuy> {

    // 持久化数据
    private String bookInstanceId;
    private String status; // 是否处于显示状态 显示1（默认） 不显示0
    private Date expiredTime; // 设置的失效时间
    private BigDecimal sort; // 可能存在的排序

    // 联结数据
    // 若需求字段少且固定 可根据客户端显示需求单独设置 在dao层直接查询 而不在service层单独添加
    private BookInfo bookInfo;
    private Student student;
}
