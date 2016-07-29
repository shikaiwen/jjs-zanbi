package com.jjs.zanbi.utils;

/**
 * Created by kaiwen on 2016/7/27.
 */

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import java.io.Serializable;

/**
 *
 * @author 施凯文
 *
 */
@SuppressWarnings("rawtypes")
public class CommResult<T> implements Serializable {

    private static final long serialVersionUID = 743488371436933270L;
    // 结果
    private boolean success = true;

    private String errorCode;
    //如果发生错误，可以查看errCode获取错误原因
    private String errorMsg;

    private String desc;


    // 方法返回结果
    private T data;



    public CommResult() {
        super();
    }

    public CommResult(T resultObj) {
        this.data = resultObj;
    }

    public CommResult(boolean isOk, T resultObj) {
        super();
        this.success = isOk;
        this.data = resultObj;
    }

    public CommResult(boolean success, String errCode, String errorMsg) {
        super();
        this.success = success;
        this.errorCode = errCode;
        this.errorMsg = errorMsg;
    }



    public boolean isSuccess() {
        return success;
    }


    public CommResult setSuccess(boolean success) {
        this.success = success;
        if(data != null && data instanceof Boolean){
            this.setData((T)Boolean.TRUE);
        }
        return this;
    }

    public String getErrorCode() {
        return errorCode;
    }

    public CommResult setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
        return this;
    }

    public CommResult setDescAppend(String desc){
        this.errorMsg += "-" + desc;
        return this;
    }

    public T getData() {
        return (T)data;
    }

    public CommResult<T> setData(T resultObj) {
        this.data = resultObj;
        return this;
    }
    public String getErrorMsg() {
        return this.errorMsg;
    }

    public CommResult setErrorcode(String errCode) {
        this.errorCode = errCode;
        return this;
    }


    public void wrapResult(CommResult res){
        if(!res.isSuccess()){
            this.setSuccess(false);
            this.setErrorCode(res.getErrorCode());
            this.setErrorMsg(res.getErrorMsg());
        }
    }


    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }

    public String getDesc() {
        return desc;
    }

    public CommResult setDesc(String desc) {
        this.desc = desc;
        return this;
    }

    public void setErrorCode(String errorCode) {
        this.errorCode = errorCode;

    }


}
