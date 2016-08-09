package com.jjs.zanbi.controller.test;

import com.jjs.zanbi.service.WorkerService;
import org.junit.Test;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;

import javax.annotation.Resource;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

/**
 * Created by kaiwen on 2016/8/8.
 */
public class WorkerControllerTest extends IndexControllerTest {

    @Resource WorkerService workerService;
    @Test
    public void testSelectByKeyWords() throws Exception {


        MockHttpServletRequestBuilder builder = get("/worker/queryByKeywords");

        builder.param("keywords", "测");
        ;
        ResultActions re = mockMvc.perform(builder);

        re.andDo(print());

    }
}
