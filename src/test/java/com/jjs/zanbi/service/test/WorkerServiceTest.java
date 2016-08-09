package com.jjs.zanbi.service.test;

import com.github.pagehelper.PageInfo;
import com.jjs.zanbi.dao.WorkerMapper;
import com.jjs.zanbi.model.Worker;
import com.jjs.zanbi.querybean.WorkerQueryBean;
import com.jjs.zanbi.service.WorkerService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by kaiwen on 2016/8/1.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")
public class WorkerServiceTest {

    @Resource
    WorkerMapper workerMapper;

    @Resource
    WorkerService workerService;

    @Test
    public void test(){

        WorkerQueryBean queryBean = new WorkerQueryBean();
        queryBean.setOrgId(3);
        PageInfo<List<Worker>> listPageInfo = workerService.selectByPage(queryBean);

        System.out.println(listPageInfo);
    }


    @Test
    public void selectByKeyWords(){

        WorkerQueryBean workerQueryBean = new WorkerQueryBean();
        List<Worker> workerList = workerService.selectByKeyWords(workerQueryBean);

        System.out.println(workerList);
    }
}
