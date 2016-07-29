package com.jjs.zanbi.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.annotation.JSONField;

import java.util.HashMap;
import java.util.Map;

/**
 * ajax 返回数据 
 * 数据格式  {"status":"ok","data":{}}
 * status 说明： ok:操作成功， timeout:session超时 ，error:错误
 * 
 * 
 * 加入针对异步超时等其他处理
 * 
 * @author Administrator
 *
 */
public class AjaxResp {






	public static void main(String[] args) {
		AjaxResp rep = AjaxResp.getOkResp();
		String str = JSON.toJSONString(rep);
		System.out.println(str);
	}
	
	private static final String errorStatus = "error";
	private static final String successStatus = "ok";
	private static final String successDesc = "操作成功";
	private static final String errorDesc = "操作失败";
	
	private static final String timeoutStatus = "timeout";
	private static final String timeoutDesc = "登录超时";
	
	public static AjaxResp getOkResp(){
		AjaxResp a = new AjaxResp();
		a.status = successStatus;
		a.desc = successDesc;
		return a;
	}
	
	public static AjaxResp getErrResp(){
		AjaxResp a = new AjaxResp();
		a.status = errorStatus;
		a.desc = errorDesc;
		return a;
	}
	
	public static AjaxResp getTimeoutResp(){
		AjaxResp a = new AjaxResp();
		a.status = timeoutStatus;
		a.desc = timeoutDesc;
		return a;
	}
	
	@JSONField(ordinal=1)
	private String status;
	
	@JSONField(ordinal=2)
	private String desc;
	
	@JSONField(ordinal=3)
	private Map<String,Object> data = new HashMap<String,Object>();
	
	public AjaxResp put(String key,Object val){
		this.data.put(key, val);
		return this;
	}
	
	public AjaxResp remove(String key,Object val){
		data.remove(key);
		return this;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
	
	public String getDesc() {
		return desc;
	}

	public AjaxResp setDesc(String desc) {
		this.desc = desc;
		return this;
	}
	public Map<String, Object> getData() {
		return data;
	}

	public AjaxResp setData(Map<String, Object> data) {
		this.data = data;
		return this;
	}
	
	
	
}
