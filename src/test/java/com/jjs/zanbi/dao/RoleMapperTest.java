package com.jjs.zanbi.dao;

import com.jjs.zanbi.model.Role;
import com.jjs.zanbi.test.BasicTest;
import org.junit.Test;

import javax.annotation.Resource;

/**
 * Created by kaiwen on 2016/8/6.
 */
public class RoleMapperTest extends BasicTest{


    @Resource  RoleMapper roleMapper;

    @Test
    public void selectByPk(){

        Role role = roleMapper.selectByPrimaryKey(1);
        System.out.println(role);

    }

}
