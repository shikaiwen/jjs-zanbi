package test;

import com.jjs.zanbi.model.SendRecord;
import com.jjs.zanbi.service.SendRecordService;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2016/7/26.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations="classpath:applicationContext.xml")
public class MainTest {

    @Resource
    SendRecordService sendRecordService;

    @org.junit.Test
    public void testQuery() {

        SendRecord record = sendRecordService.selectById(1);
        System.out.println(record);
    }
}
