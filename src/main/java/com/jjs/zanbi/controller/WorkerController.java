package com.jjs.zanbi.controller;

import com.github.pagehelper.PageInfo;
import com.jjs.zanbi.model.Worker;
import com.jjs.zanbi.querybean.WorkerQueryBean;
import com.jjs.zanbi.service.SendRecordDetailService;
import com.jjs.zanbi.service.SendRecordService;
import com.jjs.zanbi.service.WorkerService;
import com.jjs.zanbi.utils.AjaxResp;
import com.jjs.zanbi.utils.SelectUtil;
import com.jjs.zanbi.utils.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * Created by kaiwen on 2016/8/6.
 */

@Controller
@RequestMapping("worker")
public class WorkerController {



    @Autowired
    SendRecordService recordService;
    @Autowired
    SendRecordDetailService recordDetailService;
    @Autowired
    WorkerService workerService;

    @Autowired
    SelectUtil selectUtil;


    /**
     * 人员表
     * @param queryBean
     * @return
     */
    @RequestMapping("getListPage")
    public ModelAndView workerListPage(WorkerQueryBean queryBean){

        ModelAndView mav = new ModelAndView("worker/worker-list");
        mav.addObject("orgSelectHtml", selectUtil.getOrgSelectHtml(true));

        return mav;
    }

    @RequestMapping("listData")
    @ResponseBody
    public Object workerListData(WorkerQueryBean queryBean){

        PageInfo<List<Worker>> pageInfo = workerService.selectByPage(queryBean);

        Map map = WebUtils.getEasyUiPageData(pageInfo);
        return map;
    }


    @RequestMapping("goAdd")
    public ModelAndView goAdd(Worker worker){

        ModelAndView mav = new ModelAndView("worker/add");
        mav.addObject("orgSelectHtml", selectUtil.getOrgSelectHtml(false));
        mav.addObject("roleSelectHtml", selectUtil.getRoleSelectHtml(false));


        return mav;
    }


    @RequestMapping("doAdd")
    @ResponseBody
    public Object doAdd(Worker worker) {
        boolean result = workerService.addWorker(worker);

        return result ? AjaxResp.getOkResp() :   AjaxResp.getErrResp();
    }

    @RequestMapping("doDelete")
    @ResponseBody
    public Object doDelete(Worker worker) {

        boolean result = workerService.deleteByPrimaryKey(worker.getId());

        return result ? "ok" : "error";
    }

    @RequestMapping("queryByKeywords")
    @ResponseBody
    public Object queryByKeywords(WorkerQueryBean queryBean) {

        List<Worker> workerList = workerService.selectByKeyWords(queryBean);
        return AjaxResp.getOkResp().put("list", workerList);
    }

}
