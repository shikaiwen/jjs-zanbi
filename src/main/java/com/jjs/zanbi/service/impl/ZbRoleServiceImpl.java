package com.jjs.zanbi.service.impl;

import com.jjs.zanbi.dao.ZbRuleMapper;
import com.jjs.zanbi.model.ZbRule;
import com.jjs.zanbi.service.ZbRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by kaiwen on 2016/7/27.
 */
@Service("zbRoleService")
public class ZbRoleServiceImpl implements ZbRoleService {


    @Autowired
    ZbRuleMapper zbRoleMapper;
    public ZbRule selectZbRoleById(int id) {
        return zbRoleMapper.selectByPrimaryKey(id);
    }
}
