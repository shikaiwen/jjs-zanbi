package com.jjs.zanbi.controller;

import com.github.pagehelper.PageInfo;
import com.jjs.zanbi.model.SendRecordDetail;
import com.jjs.zanbi.querybean.SendRecordQueryBean;
import com.jjs.zanbi.service.SendRecordDetailService;
import com.jjs.zanbi.service.SendRecordService;
import com.jjs.zanbi.service.WorkerService;
import com.jjs.zanbi.utils.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/7/26.
 */

@Controller
public class IndexController {

	@Autowired SendRecordService recordService;
	@Autowired SendRecordDetailService recordDetailService;
    @Autowired WorkerService workerService;


    @RequestMapping("getListPage")
    public ModelAndView getListPage(SendRecordQueryBean queryBean){

        ModelAndView mv = new ModelAndView("administration/detail-list");
        return mv;
    }



    @RequestMapping("listData")
    @ResponseBody
    public Object listPage(SendRecordQueryBean queryBean){

        PageInfo<List<SendRecordDetail>> pageInfo = recordDetailService.selectDetailList(queryBean);

        Map map = WebUtils.getEasyUiPageData(pageInfo);
        return map;
    }





    /**
     * 人员表
     * @param queryBean
     * @return
     */
    @RequestMapping("getWorkerListPage")
    public ModelAndView workerListPage(SendRecordQueryBean queryBean){

        ModelAndView mav = new ModelAndView("administration/worker-list");

        return mav;
    }

    @RequestMapping("workerListData")
    @ResponseBody
    public Object workerListData(SendRecordQueryBean queryBean){

        PageInfo<List<SendRecordDetail>> pageInfo = recordDetailService.selectDetailList(queryBean);

        Map map = WebUtils.getEasyUiPageData(pageInfo);
        return map;
    }


    @RequestMapping("draw")
    public ModelAndView  draw(){
        ModelAndView mv = new ModelAndView("administration/front/draw");
        return mv;
    }

    @RequestMapping("test")
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView("administration/login");

        return mv;

    }

    @RequestMapping("main")
    public ModelAndView main() {
        ModelAndView mv = new ModelAndView("administration/main");
        return mv;

    }
    
    
    @RequestMapping("dosend")
    public ModelAndView doSend(HttpServletRequest req){

        recordService.doSend(req);

        ModelAndView mav = new ModelAndView("success");
        return mav;
    	
    }



}
