package com.jjs.zanbi.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jjs.zanbi.dao.OrgMapper;
import com.jjs.zanbi.dao.SendRecordDetailMapper;
import com.jjs.zanbi.model.Org;
import com.jjs.zanbi.model.SendRecordDetail;
import com.jjs.zanbi.model.SendRecordDetailExample;
import com.jjs.zanbi.querybean.SendRecordQueryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("sendRecordDetailService")
public class SendRecordDetailServiceImpl implements SendRecordDetailService {

    @Autowired
    SendRecordDetailMapper detailMapper;

    @Autowired
    OrgMapper orgMapper;

    public boolean saveSendRecordDetail(SendRecordDetail recordDetail) {

        int count = detailMapper.insertSelective(recordDetail);
        return count == 1;
    }


    public List<SendRecordDetail> selectRecrodDetailByExample(SendRecordDetailExample example) {
        return detailMapper.selectByExample(example);
    }


    public PageInfo<List<SendRecordDetail>> selectDetailList(SendRecordQueryBean queryBean) {

        PageHelper.startPage(queryBean.getPageNum(), queryBean.getPageSize() );

        List<SendRecordDetail> detailList =  detailMapper.selectDetailList(queryBean);
        PageInfo<List<SendRecordDetail>> det = new PageInfo(detailList);

        for (SendRecordDetail sendRecordDetail : detailList) {
            int receiverOrgId = sendRecordDetail.getReceiver().getOrgId();
            int senderOrgId = sendRecordDetail.getSender().getOrgId();

            Org receiverOrg = orgMapper.selectByPrimaryKey(receiverOrgId);
            Org senderOrg = orgMapper.selectByPrimaryKey(senderOrgId);
            sendRecordDetail.getReceiver().setOrg(receiverOrg);
            sendRecordDetail.getSender().setOrg(senderOrg);


        }




        return det;
    }

}
