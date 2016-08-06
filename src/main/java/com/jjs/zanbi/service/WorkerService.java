package com.jjs.zanbi.service;

import com.github.pagehelper.PageInfo;
import com.jjs.zanbi.model.Worker;
import com.jjs.zanbi.querybean.WorkerQueryBean;

import java.util.List;

/**
 * Created by kaiwen on 2016/7/27.
 */
public interface WorkerService {

    /**
     * 根据主键查
     *
     * @param i
     * @return
     */
    public Worker selectWorkerById(int i);

    /**
     * 根据senderId查
     *
     * @param senderId
     * @return
     */
    public Worker selectWorkerBySenderId(int senderId);

    /**
     *  分页查询
     */
    public PageInfo<List<Worker>> selectByPage(WorkerQueryBean queryBean);

    public boolean addWorker(Worker worker);


    public boolean deleteByPrimaryKey(int id);


}
