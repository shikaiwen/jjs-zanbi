package com.jjs.zanbi.service;

import com.github.pagehelper.PageInfo;
import com.jjs.zanbi.model.SendRecordDetail;
import com.jjs.zanbi.querybean.SendRecordQueryBean;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

public interface SendRecordDetailService {


    public List<SendRecordDetail> selectList(Example example);


    public boolean saveSendRecordDetail(SendRecordDetail recordDetail);


    public PageInfo<List<SendRecordDetail>> selectByPage(SendRecordQueryBean queryBean);

}
