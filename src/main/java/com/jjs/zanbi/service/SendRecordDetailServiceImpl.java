package com.jjs.zanbi.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.jjs.zanbi.dao.SendRecordDetailMapper;
import com.jjs.zanbi.model.SendRecordDetail;

public class SendRecordDetailServiceImpl implements SendRecordDetailService{

	@Autowired SendRecordDetailMapper detailMapper;
	
	public boolean saveSendRecordDetail(SendRecordDetail recordDetail) {
		
		int count = detailMapper.insertSelective(recordDetail);
		return count == 1;
	}

}
