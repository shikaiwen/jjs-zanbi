package com.jjs.zanbi.controller;

import com.github.pagehelper.PageInfo;
import com.jjs.zanbi.model.SendRecordDetail;
import com.jjs.zanbi.querybean.SendRecordQueryBean;
import com.jjs.zanbi.service.SendRecordDetailService;
import com.jjs.zanbi.service.SendRecordService;
import com.jjs.zanbi.service.WorkerService;
import com.jjs.zanbi.utils.AjaxResp;
import com.jjs.zanbi.utils.CommResult;
import com.jjs.zanbi.utils.SelectUtil;
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
    @Autowired SelectUtil selectUtil;

    @RequestMapping("send")
    public ModelAndView sendPage(){

        ModelAndView mav = new ModelAndView("front/send");
        return mav;
    }

    @RequestMapping("getListPage")
    public ModelAndView getListPage(SendRecordQueryBean queryBean){

        String orgSelectHtml = selectUtil.getOrgSelectHtml(true);


        ModelAndView mv = new ModelAndView("detail-list");
        return mv;
    }


    @RequestMapping("listData")
    @ResponseBody
    public Object listPage(SendRecordQueryBean queryBean){

        PageInfo<List<SendRecordDetail>> pageInfo = recordDetailService.selectByPage(queryBean);

        Map map = WebUtils.getEasyUiPageData(pageInfo);
        return map;
    }


    @RequestMapping("draw")
    public ModelAndView  draw(){
        ModelAndView mv = new ModelAndView("front/draw");
        return mv;
    }

    @RequestMapping("test")
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView("login");

        return mv;

    }

    @RequestMapping("main")
    public ModelAndView main() {
        ModelAndView mv = new ModelAndView("main");
        return mv;

    }
    
    
    @RequestMapping("dosend")
    @ResponseBody
    public Object doSend(HttpServletRequest req){

        CommResult commResult = recordService.doSend(req);

        if (commResult.isSuccess()) {
            return AjaxResp.getOkResp();
        }

        return AjaxResp.getErrResp();

    }



}
