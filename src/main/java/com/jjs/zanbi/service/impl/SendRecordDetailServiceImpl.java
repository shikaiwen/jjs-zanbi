package com.jjs.zanbi.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jjs.zanbi.dao.OrgMapper;
import com.jjs.zanbi.dao.SendRecordDetailMapper;
import com.jjs.zanbi.model.Org;
import com.jjs.zanbi.model.SendRecordDetail;
import com.jjs.zanbi.querybean.SendRecordQueryBean;
import com.jjs.zanbi.service.SendRecordDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Service("sendRecordDetailService")
public class SendRecordDetailServiceImpl implements SendRecordDetailService {

    @Autowired
    SendRecordDetailMapper detailMapper;

    @Autowired
    OrgMapper orgMapper;

    public List<SendRecordDetail> selectList(Example example) {
        return detailMapper.selectByExample(example);
    }

    public boolean saveSendRecordDetail(SendRecordDetail recordDetail) {

        int count = detailMapper.insertSelective(recordDetail);
        return count == 1;
    }


    public PageInfo<List<SendRecordDetail>> selectByPage(SendRecordQueryBean queryBean) {

        PageHelper.startPage(queryBean.getPageNum(), queryBean.getPageSize() );


        List<SendRecordDetail> detailList =  detailMapper.selectByPage(queryBean);


        PageInfo<List<SendRecordDetail>> pageInfo = new PageInfo(detailList);

        for (SendRecordDetail sendRecordDetail : detailList) {
            int receiverOrgId = sendRecordDetail.getReceiver().getOrgId();
            int senderOrgId = sendRecordDetail.getSender().getOrgId();

            Org receiverOrg = orgMapper.selectByPrimaryKey(receiverOrgId);
            Org senderOrg = orgMapper.selectByPrimaryKey(senderOrgId);
            sendRecordDetail.getReceiver().setOrg(receiverOrg);
            sendRecordDetail.getSender().setOrg(senderOrg);

        }


        return pageInfo;

    }

}
