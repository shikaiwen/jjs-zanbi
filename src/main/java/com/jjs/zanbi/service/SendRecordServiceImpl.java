package com.jjs.zanbi.service;

import com.jjs.zanbi.dao.SendRecordMapper;
import com.jjs.zanbi.model.*;
import com.jjs.zanbi.utils.CommResult;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/**
 * Created by Administrator on 2016/7/26.
 */
@Service("sendRecordService")
public class SendRecordServiceImpl implements SendRecordService {

    @Autowired
    SendRecordDetailService recordDetailService;

    @Autowired
    SendRecordMapper sendRecordMapper;

    @Autowired
    ZbRoleService zbRoleService;

    @Autowired
    WorkerService workerService;



    public SendRecord selectById(int i) {
        SendRecord sendRecord = sendRecordMapper.selectByPrimaryKey(i);
        return sendRecord;
    }



    public boolean saveRecord(SendRecord record) {
        int count = sendRecordMapper.insertSelective(record);
        return count == 1;
    }

    public CommResult doSend(HttpServletRequest req) {

        CommResult result = new CommResult();
        int senderid = NumberUtils.toInt(req.getParameter("senderid"),0);
        Worker worker = workerService.selectWorkerBySenderId(senderid);
        if(worker == null){
            return result.setErrorMsg("用户不存在");
        }

        int countUnit = NumberUtils.toInt(req.getParameter("countUnit"), 1);

        String reqIp = req.getRemoteAddr();
        String[] receiverArr = req.getParameterValues("receiverId");
        String remark = req.getParameter("remark");

        int needAll = receiverArr.length * countUnit;
        int allowCount = this.getAllowSendCount(senderid);
        if (needAll > allowCount) {
            return result.setErrorMsg("当前仅可发送：" + allowCount + "个");
        }


        SendRecord record = new SendRecord();

        record.setSenderId(senderid);
        record.setRemark(remark);
        record.setSenderIp(reqIp);
        record.setSendTime(new Date());

        //插入主表
        boolean saveRecordResult = this.saveRecord(record);

        //插入明细
        for (int i = 0; i < receiverArr.length; i++) {

            int receiverId = Integer.parseInt(receiverArr[i]);

            SendRecordDetail detail = new SendRecordDetail();
            detail.setSenderId(senderid);
            detail.setReceiverId(receiverId);
            detail.setSendTime(new Date());
            detail.setZbCount(countUnit);
            //待解析
            detail.setRemark(remark);

            boolean saveResult = recordDetailService.saveSendRecordDetail(detail);
            if (!saveRecordResult) {
                throw new RuntimeException("保存明细失败");
            }
        }

        return result;
    }


    public int getAllowSendCount(int senderId) {

        Worker worker = workerService.selectWorkerBySenderId(senderId);
        int zbRoleId = worker.getZbRoleId();
        ZbRole zbRole = zbRoleService.selectZbRoleById(zbRoleId);

        int roleCount = zbRole.getZbCount();

        Calendar cal = Calendar.getInstance();

        // 如果设为0，则 getTime会变成前一月的30号
        cal.set(Calendar.DAY_OF_MONTH, 1);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.SECOND,0);
        cal.set(Calendar.MINUTE,0);


        int sendCount = this.selectSendCountByMonth(senderId, cal.getTime());
        int receiveCount = this.selectReceiveCountByMonth(senderId, cal.getTime());

        return roleCount + receiveCount - sendCount;

    }


    @Autowired
    SendRecordDetailService sendRecordDetailService;
    public int selectSendCountByMonth(int senderId,Date date){


        int total = 0;
        SendRecordDetailExample detailExample = new SendRecordDetailExample();
        SendRecordDetailExample.Criteria criteria = detailExample.createCriteria();

        criteria.andSenderIdEqualTo(senderId);

        Calendar nextMonth = Calendar.getInstance(Locale.CHINESE);
        nextMonth.setTime(date);
        nextMonth.add(Calendar.MONTH, 1);


        criteria.andSendTimeBetween(date, nextMonth.getTime());

        List<SendRecordDetail> detailList = sendRecordDetailService.selectRecrodDetailByExample(detailExample);

        if (CollectionUtils.isEmpty(detailList)) {
            return total;
        }


        for (SendRecordDetail sendRecordDetail : detailList) {
            total += sendRecordDetail.getZbCount();
        }


        return total;
    }


    public int selectReceiveCountByMonth(int receiverId,Date date) {

        int total = 0;
        SendRecordDetailExample detailExample = new SendRecordDetailExample();
        SendRecordDetailExample.Criteria criteria = detailExample.createCriteria();

        criteria.andReceiverIdEqualTo(receiverId);

        Date currentMonth = Calendar.getInstance(Locale.CHINESE).getTime();

        Calendar nextMonth = Calendar.getInstance(Locale.CHINESE);
        nextMonth.add(Calendar.MONTH, 1);

        criteria.andSendTimeBetween(currentMonth, nextMonth.getTime());

        List<SendRecordDetail> detailList = sendRecordDetailService.selectRecrodDetailByExample(detailExample);

        if (CollectionUtils.isEmpty(detailList)) {
            return total;
        }


        for (SendRecordDetail sendRecordDetail : detailList) {
            total += sendRecordDetail.getZbCount();
        }

        return total;
    }

}
