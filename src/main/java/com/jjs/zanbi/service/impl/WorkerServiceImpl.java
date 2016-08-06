package com.jjs.zanbi.service.impl;

import com.github.pagehelper.PageInfo;
import com.jjs.zanbi.dao.WorkerMapper;
import com.jjs.zanbi.model.Worker;
import com.jjs.zanbi.querybean.WorkerQueryBean;
import com.jjs.zanbi.service.WorkerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by kaiwen on 2016/7/27.
 */

@Service("workerService")
public class WorkerServiceImpl implements WorkerService {


    @Autowired
    WorkerMapper workerMapper;
    public Worker selectWorkerById(int id) {

        return workerMapper.selectByPrimaryKey(id);
    }

    public Worker selectWorkerBySenderId(int senderId) {
//        WorkerExample example = new WorkerExample();
//        WorkerExample.Criteria criteria = example.createCriteria();
//        criteria.andIdEqualTo(senderId);
//
//        Worker worker = workerMapper.selectByPrimaryKey(senderId);

        return null;
    }

    //包含机构信息
    public PageInfo<List<Worker>> selectByPage(WorkerQueryBean queryBean) {

        List<Worker> workerList = workerMapper.selectByPage(queryBean);

        return new PageInfo(workerList);
    }

    public boolean addWorker(Worker worker) {
        int i = workerMapper.insertSelective(worker);
        return i == 1;
    }

    public boolean deleteByPrimaryKey(int id) {
        int count = workerMapper.deleteByPrimaryKey(id);
        return count == 1;
    }


}
