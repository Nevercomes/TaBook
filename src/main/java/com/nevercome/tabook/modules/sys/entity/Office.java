package com.nevercome.tabook.modules.sys.entity;

import com.nevercome.tabook.common.persistence.TreeEntity;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;
import java.util.List;

public class Office extends TreeEntity<Office> {

    private static final long serialVersionUID = 1L;
    private Area area;		// 归属区域
    private String code; 	// 机构编码
    private List<String> childDeptList;//快速添加子部门

    public Office(){
        super();
    }

    public Office(String id){
        super(id);
    }

    public List<String> getChildDeptList() {
        return childDeptList;
    }

    public void setChildDeptList(List<String> childDeptList) {
        this.childDeptList = childDeptList;
    }

    public Office getParent() {
        return parent;
    }

    public void setParent(Office parent) {
        this.parent = parent;
    }

    @NotNull
    public Area getArea() {
        return area;
    }

    public void setArea(Area area) {
        this.area = area;
    }

    @Length(min=0, max=100)
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }
}
