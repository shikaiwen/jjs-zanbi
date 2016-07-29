package com.jjs.zanbi.service;

import com.jjs.zanbi.model.SendRecord;
import com.jjs.zanbi.utils.CommResult;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Administrator on 2016/7/26.
 */
public interface SendRecordService {

    SendRecord selectById(int i);
 
    boolean saveRecord(SendRecord record);

    //发送主业务方法
    CommResult doSend(HttpServletRequest request);



}
