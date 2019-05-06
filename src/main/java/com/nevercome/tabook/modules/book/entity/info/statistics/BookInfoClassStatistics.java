package com.nevercome.tabook.modules.book.entity.info.statistics;

import lombok.Data;

import java.util.Date;

/**
 * 可能需要进行对书籍信息进行动静分离
 * 以方便进行缓存
 */
@Data
public class BookInfoClassStatistics {

    private static final long serialVersionUID = 1L;

    private String copyNum; // 副本数目
    private int totalBorrowed; // 累计借阅
    private int totalBought; // 累计买卖

    private Date startTime; // 统计时间
    private Date endTime; // 统计时间

}
