package com.jjs.zanbi.service.test;

import com.jjs.zanbi.dao.OrgMapper;
import com.jjs.zanbi.model.Org;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

/**
 * Created by kaiwen on 2016/8/3.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")
public class TkTest {


    @Resource
    OrgMapper orgMapper;

    @Test
    public void testQuery(){


        Org org = orgMapper.selectByPrimaryKey(2);


//        Example example = new Example(WorkerTest.class);
//        example.createCriteria().andEqualTo("workerId",1);
//        List<WorkerTest> workerList =  workerTestMapper.selectByExample(example);


        System.out.println(org);
    }





}
