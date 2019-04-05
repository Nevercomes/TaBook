package com.nevercome.tabook.modules.book.entity.info;

import com.nevercome.tabook.common.persistence.DataEntity;
import lombok.Data;

/**
 * BookInfoClass实体类
 * @author sun
 */
@Data
public class BookInfoClass extends DataEntity<BookInfoClass> {

    // 持久化数据
    private String bookRootId; // 上一级指针
    private String ISBN;
    private String version; // 书籍版本 一本书的第一版 第二版
    private String press;
    private String year; // 出版年份
    private float score; // 书籍评分
    private String intro; // 书籍简介
    private String imgUrl; // 书籍配图的url 如果是爬虫则为url 如果保存在文件服务器 则可能为id拼接后的url

    // 统计数据
    private String status; // 书籍类目的状态 状态参数见BookConstant
    private int totalBorrowed; // 书籍累计借阅 可按时段统计
    private int totalBought; // 书籍累计买卖 可按时段统计
    private int copyNum; // 副本数目

    // 搜索参数
}
