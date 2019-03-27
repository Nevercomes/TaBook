package com.nevercome.tabook.modules.book.entity.info;

import com.nevercome.tabook.common.persistence.DataEntity;
import lombok.Data;

/**
 * BookInfoInstance实体类
 * @author sun
 */
@Data
public class BookInfoInstance extends DataEntity<BookInfoInstance> {

    // 持久化数据
    private String bookClassId;
    private String userAddId; // 添加记录的id
    private String ownerId; // 所有者id
    private String holderId; // 当前持有者id
    private String schoolId; // 学校id 图书管理的基础(非常重要) 在实际数据中以Office类来体现
    private String campusId; // 校区id 可能存在 在实际数据中以Office类来体现
    private String status; // 书籍实体的状态 状态参数见BookConstant
    private int totalBorrowed; // 书籍累计借阅
    private int likeNum; // 书籍获赞数

    // 统计数据

    // 搜索参数

}
