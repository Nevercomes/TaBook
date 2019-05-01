package com.nevercome.tabook.modules.sys.dao;

import com.nevercome.tabook.common.persistence.CrudDao;
import com.nevercome.tabook.common.persistence.annotation.MyBatisDao;
import com.nevercome.tabook.modules.sys.entity.Identity;

/**
 * @author: sun
 * @date: 2019/5/1
 */
@MyBatisDao
public interface IdentityDao extends CrudDao<Identity> {
}
