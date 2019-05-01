package com.nevercome.tabook.modules.sys.entity;

import com.nevercome.tabook.common.persistence.DataEntity;

/**
 * @author: sun
 * @date: 2019/5/1
 */
public class Identity extends DataEntity<Identity> {

    private String userId;
    private String realName; // 真实姓名
    private String idNo; // 身份证
    private String schoolNo; // 学号
    private String schoolName; // 学校

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getIdNo() {
        return idNo;
    }

    public void setIdNo(String idNo) {
        this.idNo = idNo;
    }

    public String getSchoolNo() {
        return schoolNo;
    }

    public void setSchoolNo(String schoolNo) {
        this.schoolNo = schoolNo;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

}
