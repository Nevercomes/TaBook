package com.nevercome.tabook.modules.book.entity.info;

import com.nevercome.tabook.common.persistence.DataEntity;
import lombok.Data;

/**
 * BookInfoRoot实体类
 * @author sun
 */
@Data
public class BookInfoRoot extends DataEntity<BookInfoRoot> {
    // 持久化数据
    private String name;
    private String author;
    private String sortSeq; // 排序序列
    private String representId; // bookClass代表root的id

    // 统计数据
    private String status; // root的当前状态 状态参数见BookConstant
    private int totalBorrowed; // 书籍累计借阅 可按时段统计
    private int totalBought; // 书籍累计买卖 可按时段统计
    private String copyNum; // 副本数目

    // 搜索参数

}
