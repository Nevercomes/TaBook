package com.nevercome.tabook.common.persistence;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.nevercome.tabook.common.utils.IdGen;
import com.nevercome.tabook.modules.sys.entity.User;
import com.nevercome.tabook.modules.sys.utils.UserUtils;
import org.apache.commons.lang3.StringUtils;

import java.util.Date;

/**
 * 数据Entity类
 * @author ThinkGem
 * @version 2014-05-16
 */
public abstract class DataEntity<T> extends BaseEntity<T> {
    private static final long serialVersionUID = 1L;

    protected String remarks;	// 备注
    protected User createBy;	// 创建者
    protected Date createTime;	// 创建日期
    protected User updateBy;	// 更新者
    protected Date updateTime;	// 更新日期
    protected String delFlag; 	// 删除标记（0：正常；1：删除；2：审核）

    protected String studentId;
    protected String schoolId;

    public DataEntity() {
        super();
        this.delFlag = DEL_FLAG_NORMAL;
    }

    public DataEntity(String id) {
        super(id);
    }

    /**
     * 插入之前执行方法，需要手动调用
     */
    @Override
    public void preInsert(){
        // 不限制ID为UUID，调用setIsNewRecord()使用自定义ID
        if (!this.isNewRecord){
            setId(IdGen.uuid());
        }
        User user = UserUtils.getUser();
        if (StringUtils.isNotBlank(user.getId())){
            this.updateBy = user;
            this.createBy = user;
            this.studentId = user.getStudentId();
            this.schoolId = user.getSchoolId();
        }
        this.updateTime = new Date();
        this.createTime = this.updateTime;
    }

    /**
     * 更新之前执行方法，需要手动调用
     */
    @Override
    public void preUpdate(){
        User user = UserUtils.getUser();
        if (StringUtils.isNotBlank(user.getId())){
            this.updateBy = user;
        }
        this.updateTime = new Date();
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @JsonIgnore
    public User getCreateBy() {
        return createBy;
    }

    public void setCreateBy(User createBy) {
        this.createBy = createBy;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @JsonIgnore
    public User getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(User updateBy) {
        this.updateBy = updateBy;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @JsonIgnore
    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(String schoolId) {
        this.schoolId = schoolId;
    }

}
