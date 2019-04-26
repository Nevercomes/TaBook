package com.nevercome.tabook.modules.book.entity.info.statistics;

import java.util.Date;

/**
 * 可能需要进行对书籍信息进行动静分离
 * 以方便进行缓存
 */
public class BookInfoClassStatistics {

    private int totalBorrowed; // 累计借阅

    private Date startTime; // 统计时间
    private Date endTime; // 统计时间
}
