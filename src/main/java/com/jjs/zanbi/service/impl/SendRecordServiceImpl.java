package com.jjs.zanbi.service.impl;

import com.jjs.zanbi.dao.RoleMapper;
import com.jjs.zanbi.dao.SendRecordDetailMapper;
import com.jjs.zanbi.dao.SendRecordMapper;
import com.jjs.zanbi.model.*;
import com.jjs.zanbi.querybean.WorkerQueryBean;
import com.jjs.zanbi.service.*;
import com.jjs.zanbi.utils.CommResult;
import com.jjs.zanbi.utils.Const;
import com.jjs.zanbi.utils.WebUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created by Administrator on 2016/7/26.
 */
@Service("sendRecordService")
public class SendRecordServiceImpl implements SendRecordService {

    static Logger logger = LoggerFactory.getLogger(SendRecordServiceImpl.class);

    @Autowired
    SendRecordDetailService recordDetailService;

    @Autowired
    SendRecordMapper sendRecordMapper;

    @Autowired
    SendRecordDetailMapper sendRecordDetailMapper;

    @Autowired
    ZbRoleService zbRoleService;

    @Autowired
    WorkerService workerService;

    @Autowired
    RoleMapper roleMapper;

    @Autowired
    OrgService orgService;
    public Map<String,Object> sumAllOrg(){

        List<Org> orgList =  orgService.selectAll();

        Map<String,Object> sumMap = new HashMap<String,Object>();

        for (Org org : orgList) {
            WorkerQueryBean workerQueryBean = new WorkerQueryBean();
            workerQueryBean.setOrgId(org.getId());


            List<Worker> workerList = workerService.selectByKeyWords(workerQueryBean);

            int orgSum = 0;


            for (Worker worker : workerList) {


                Role role = roleMapper.selectByPrimaryKey(worker.getRoleId());
                int workerGet = 0;
                int workerId = worker.getId();

                int receiveCount = sendRecordDetailMapper.getReceiveCountByWorker(workerId);
                int sendCount = sendRecordDetailMapper.getSendCountByWorker(workerId);

                if(sendCount <= Const.MEMBER_ZAN_COUNT){
                    sendCount = 0;
                }

                if(role.getIsProductMgr().equals("1")){

                    workerGet = this.getInitCount(workerId);

                    workerGet -= sendCount;
                    workerGet += receiveCount;

                }else{

                    workerGet = receiveCount;

                    workerGet -= sendCount;

                }

                logger.debug( " {} 获取有效赞币 {} 个" , worker.getName() , workerGet );

                orgSum += workerGet;

            }

        }

        return sumMap;

    }


    public int getRealCountByWorker(int workerId) {

        int sendCount = sendRecordDetailMapper.getSendCountByWorker(workerId);
        int receiveCount = sendRecordDetailMapper.getReceiveCountByWorker(workerId);

        if(sendCount<=5) return receiveCount;

        return receiveCount + 5 - sendCount;

    }

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
        String[] receiverArr = req.getParameterValues("receiverId[]");
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
            detail.setSendMainId(record.getId());
            //待解析
            detail.setRemark(remark);

            boolean saveResult = recordDetailService.saveSendRecordDetail(detail);
            if (!saveRecordResult) {
                throw new RuntimeException("保存明细失败");
            }
        }

        return result;
    }


    public int getInitCount(int workerId) {

        Worker worker = workerService.selectWorkerBySenderId(workerId);
        int senderRoleId = worker.getRoleId();

        Role senderRole = roleMapper.selectByPrimaryKey(senderRoleId);

        ZbRule zbRule =  zbRoleService.selectZbRoleById(senderRole.getZbRuleId());
        int roleCount = 0;
        //计算规则有两种一种是通过计算，一种是固定值
        if(zbRule.getZbComputeType().equals("1")){
            roleCount = zbRule.getZbCount();
        }else{
            //根据表达式计算
            String cal = zbRule.getCalculate();
            int orgCount = workerService.countByOrg(worker.getOrgId());
            String sub = cal.replace("sub",orgCount+"");
            roleCount = WebUtils.getSubMemByJs(sub);
        }

        return roleCount;
    }

    public int getAllowSendCount(int senderId) {

        Worker worker = workerService.selectWorkerBySenderId(senderId);
        int senderRoleId = worker.getRoleId();

        Role senderRole = roleMapper.selectByPrimaryKey(senderRoleId);

        ZbRule zbRule =  zbRoleService.selectZbRoleById(senderRole.getZbRuleId());

        int roleCount = 0;
        //计算规则有两种一种是通过计算，一种是固定值
        if(zbRule.getZbComputeType().equals("1")){
            roleCount = zbRule.getZbCount();
        }else{

            //根据表达式计算
            String cal = zbRule.getCalculate();

            int orgCount = workerService.countByOrg(worker.getOrgId());

//            orgCount -= 1;

            String sub = cal.replace("sub",orgCount+"");

            roleCount = WebUtils.getSubMemByJs(sub);

        }

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

        Calendar nextMonth = Calendar.getInstance(Locale.CHINESE);
        nextMonth.setTime(date);
        nextMonth.add(Calendar.MONTH, 1);

        Example example = new Example(SendRecordDetail.class);
        example.createCriteria()
                .andEqualTo("senderId",senderId)
                .andBetween("sendTime",date , nextMonth.getTime());
        List<SendRecordDetail> detailList = sendRecordDetailService.selectList(example);

        for (SendRecordDetail sendRecordDetail : detailList) {
            total += sendRecordDetail.getZbCount();
        }

        return total;
    }


    public int selectReceiveCountByMonth(int receiverId,Date date) {

        int total = 0;

        Calendar nextMonth = Calendar.getInstance(Locale.CHINESE);
        nextMonth.setTime(date);
        nextMonth.add(Calendar.MONTH, 1);

        Example example = new Example(SendRecordDetail.class);
        example.createCriteria()
                .andEqualTo("receiverId",receiverId)
                .andBetween("sendTime",date , nextMonth.getTime());
        List<SendRecordDetail> detailList = sendRecordDetailService.selectList(example);

        for (SendRecordDetail sendRecordDetail : detailList) {
            total += sendRecordDetail.getZbCount();
        }

        return total;
    }

}
