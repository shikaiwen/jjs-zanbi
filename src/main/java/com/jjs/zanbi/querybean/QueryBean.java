package com.jjs.zanbi.querybean;

/**
 * Created by kaiwen on 2016/7/29.
 */
public class QueryBean {

    int pageNum = 1;
    int pageSize = 10;


    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}
