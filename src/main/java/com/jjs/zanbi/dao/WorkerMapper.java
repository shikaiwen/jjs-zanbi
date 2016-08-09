package com.jjs.zanbi.dao;

import com.jjs.zanbi.model.Worker;
import com.jjs.zanbi.querybean.WorkerQueryBean;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface WorkerMapper extends Mapper<Worker> {

    List<Worker> selectByPage(WorkerQueryBean queryBean);

}