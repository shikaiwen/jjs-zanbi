package com.jjs.zanbi.dao;

import com.jjs.zanbi.model.SendRecordDetail;
import com.jjs.zanbi.querybean.SendRecordQueryBean;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface SendRecordDetailMapper extends Mapper<SendRecordDetail> {

    List<SendRecordDetail> selectByPage(SendRecordQueryBean queryBean);


    @Select("sselect sum(zb_count) from send_record_detail where sender_id= #{id}")
    int getSendCountByWorker(int id);

    @Select("sselect sum(zb_count) from send_record_detail where receiver_id= #{id}")
    int getReceiveCountByWorker(int id);
}