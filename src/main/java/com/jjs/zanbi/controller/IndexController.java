package com.jjs.zanbi.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jjs.zanbi.model.SendRecord;
import com.jjs.zanbi.model.SendRecordDetail;
import com.jjs.zanbi.service.SendRecordDetailService;
import com.jjs.zanbi.service.SendRecordService;

/**
 * Created by Administrator on 2016/7/26.
 */

@Controller
public class IndexController {

	@Autowired SendRecordService recordService;
	@Autowired SendRecordDetailService recordDetailService;
	
	

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
    	
    	String senderId = req.getParameter("senderId");
    	String [] receiverArr = req.getParameterValues("receiverList");
    	String remark = req.getParameter("remarks");

    	
    	SendRecord record = new SendRecord();
    	record.setSenderId(senderId);
    	record.setRemark(remark);
    	
    	//插入主表
    	recordService.saveRecord(record);
    	
    	//插入明细
    	
    	for(int i = 0 ; i < receiverArr.length;i++){
    		
    		String receiverId = receiverArr[i];
    		
    		SendRecordDetail detail = new SendRecordDetail();
    		detail.setSenderId(senderId);
    		detail.setReceiverId(receiverId);
    		detail.setSendTime(new Date());
    		//待解析
    		detail.setRemark(remark);
    		
    		recordDetailService.saveSendRecordDetail(detail);
    	}
    	
    	
    	
    	return null;
    	
    }
    
}
