package com.jjs.zanbi.querybean;

/**
 * Created by kaiwen on 2016/7/29.
 */
public class WorkerQueryBean extends QueryBean {

    private Integer orgId;

    private String name;

    private String keywords;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getOrgId() {
        return orgId;
    }

    public void setOrgId(Integer orgId) {
        this.orgId = orgId;
    }


    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }
}
