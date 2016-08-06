package com.jjs.zanbi.service.impl;

import com.jjs.zanbi.dao.RoleMapper;
import com.jjs.zanbi.model.Role;
import com.jjs.zanbi.service.RoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by kaiwen on 2016/8/6.
 */

@Service("roleService")
public class RoleServiceImpl implements RoleService {

    @Resource
    RoleMapper roleMapper;

    public List<Role> selectAll(){
        List<Role> roles = roleMapper.selectAll();
        return roles;
    }

}
