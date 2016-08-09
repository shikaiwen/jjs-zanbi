package com.jjs.zanbi.service.test;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.github.pagehelper.PageInfo;
import com.jjs.zanbi.dao.WorkerMapper;
import com.jjs.zanbi.model.SendRecordDetail;
import com.jjs.zanbi.querybean.SendRecordQueryBean;
import com.jjs.zanbi.service.SendRecordDetailService;
import com.jjs.zanbi.service.SendRecordService;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by kaiwen on 2016/7/28.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")
public class SendRecordServiceTest {

    @Resource SendRecordDetailService sendRecordDetailService;

    @Resource
    SendRecordService sendRecordService;
    @Resource
    WorkerMapper workerMapper;


    @Resource
    SqlSessionFactory ssf;
    @Test
    public void testWorker(){
        SqlSession sqlSession = ssf.openSession();
        List list = sqlSession.selectList("com.jjs.zanbi.dao.WorkerMapper.selectEx");
        System.out.println(list);
    }

    @Test
    public void queryByPageTest(){

        SendRecordQueryBean queryBean = new SendRecordQueryBean();
//        queryBean.setSenderId("1");

        PageInfo<List<SendRecordDetail>> pageInfo = sendRecordDetailService.selectByPage(queryBean);

        System.out.println(JSON.toJSONString(pageInfo, SerializerFeature.DisableCircularReferenceDetect));

        System.out.println(pageInfo);

    }

    @Test
    public void selectSendCountByMonth(){

        int senderId = 1;
        Date date = new Date();
        date.setDate(1);
        date.setMonth(6);
        int i = sendRecordService.selectSendCountByMonth(senderId, date);

        System.out.println(i);

    }
}
