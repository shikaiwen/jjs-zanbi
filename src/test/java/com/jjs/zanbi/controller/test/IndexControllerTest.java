package com.jjs.zanbi.controller.test;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.setup.DefaultMockMvcBuilder;
import org.springframework.web.context.WebApplicationContext;

import javax.annotation.Resource;
import java.util.Calendar;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.webAppContextSetup;

/**
 * Created by Administrator on 2016/7/27.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations="classpath:applicationContext.xml")
public class IndexControllerTest {


    @Resource
    WebApplicationContext wac;
    DefaultMockMvcBuilder mockBuilder = null;
    MockMvc mockMvc;

    @Before
    public void setup(){
//		MockitoAnnotations.initMocks(this);
//		MockMvcBuilders.webAppContextSetup(wac)
        mockBuilder = webAppContextSetup(wac);
//		SystemFilter sysFilter = new SystemFilter();
//		mockBuilder.addFilters( sysFilter );
        mockMvc = mockBuilder.build();
//		mockMvc = MockMvcBuilders.standaloneSetup(agentController).build();
    }


    @Test
    public void testDoSend() throws Exception{

//		MockHttpServletRequestBuilder builder = get("jjsumc/myHouse/getXinFangList/01000098");
        MockHttpServletRequestBuilder builder = get("/dosend");

		builder.param("senderid", "2")
        .param("receiverId","1","2","3")
                .param("countUnit","1")
        .param("remark","88888888")
        ;
        ResultActions re = mockMvc.perform(builder);
        re.andDo(print() );

    }

    @Test
    public void testCalendar(){
        Calendar cal = Calendar.getInstance();

        cal.set(Calendar.DAY_OF_MONTH, 1);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.SECOND,0);
        cal.set(Calendar.MINUTE,0);
        cal.getTime();
        System.out.println(cal);
    }

}
