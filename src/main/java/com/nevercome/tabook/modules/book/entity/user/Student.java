package com.nevercome.tabook.modules.book.entity.user;

import com.nevercome.tabook.common.persistence.DataEntity;
import lombok.Data;

/**
 * 业务逻辑用户Student实体类
 * @author sun
 */
@Data
public class Student extends DataEntity<Student> {

    // 持久化数据
    private String schoolId;
    private String userId;
    private String name;
    private String QQ;
    private String phone;
    private String avatarUrl;
    private String creditScore;

    // 联结数据

    // 统计数据
    private int totalUpload; // 累计上传书籍
    private int totalLent; // 累计借出
    private int totalBorrowed; // 累计借入
    private int totalBought; // 累计买入
    private int totalSold; // 累计卖出
    private int totalLike; // 累计获赞

}
