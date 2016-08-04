package com.jjs.zanbi.dao;

import com.jjs.zanbi.model.SendRecordDetail;
import com.jjs.zanbi.querybean.SendRecordQueryBean;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface SendRecordDetailMapper extends Mapper<SendRecordDetail> {

    List<SendRecordDetail> selectByPage(SendRecordQueryBean queryBean);

}