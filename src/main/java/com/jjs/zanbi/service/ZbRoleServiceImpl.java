package com.jjs.zanbi.service;

import com.jjs.zanbi.dao.ZbRoleMapper;
import com.jjs.zanbi.model.ZbRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by kaiwen on 2016/7/27.
 */
@Service("zbRoleService")
public class ZbRoleServiceImpl implements  ZbRoleService{


    @Autowired
    ZbRoleMapper zbRoleMapper;
    public ZbRole selectZbRoleById(int id) {
        return zbRoleMapper.selectByPrimaryKey(id);
    }
}
