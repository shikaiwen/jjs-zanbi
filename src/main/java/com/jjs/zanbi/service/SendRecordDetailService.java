package com.jjs.zanbi.service;

import com.github.pagehelper.PageInfo;
import com.jjs.zanbi.model.SendRecordDetail;
import com.jjs.zanbi.model.SendRecordDetailExample;
import com.jjs.zanbi.querybean.SendRecordQueryBean;

import java.util.List;

public interface SendRecordDetailService {

	public boolean saveSendRecordDetail(SendRecordDetail recordDetail);

    public List<SendRecordDetail> selectRecrodDetailByExample(SendRecordDetailExample example);


    public PageInfo<List<SendRecordDetail>> selectDetailList(SendRecordQueryBean queryBean);

}
