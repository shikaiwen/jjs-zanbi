package com.jjs.zanbi.service;

import com.jjs.zanbi.dao.SendRecordMapper;
import com.jjs.zanbi.model.SendRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2016/7/26.
 */
@Service("sendRecordService")
public class SendRecordServiceImpl implements SendRecordService{


    @Autowired
    SendRecordMapper sendRecordMapper;

    public SendRecord selectById(int i){
        SendRecord sendRecord = sendRecordMapper.selectByPrimaryKey(i);
        return sendRecord;
    }
}
