package com.jjs.zanbi.model;

import javax.persistence.*;

@Table(name = "org")
public class Org {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 组名 如：用户组
     */
    @Column(name = "org_name")
    private String orgName;

    /**
     * 组管理者  
     */
    @Column(name = "org_manager")
    private String orgManager;

    /**
     * 类型 1：开发 2:产品
     */
    private String type;

    /**
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取组名 如：用户组
     *
     * @return org_name - 组名 如：用户组
     */
    public String getOrgName() {
        return orgName;
    }

    /**
     * 设置组名 如：用户组
     *
     * @param orgName 组名 如：用户组
     */
    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    /**
     * 获取组管理者  
     *
     * @return org_manager - 组管理者  
     */
    public String getOrgManager() {
        return orgManager;
    }

    /**
     * 设置组管理者  
     *
     * @param orgManager 组管理者  
     */
    public void setOrgManager(String orgManager) {
        this.orgManager = orgManager;
    }

    /**
     * 获取类型 1：开发 2:产品
     *
     * @return type - 类型 1：开发 2:产品
     */
    public String getType() {
        return type;
    }

    /**
     * 设置类型 1：开发 2:产品
     *
     * @param type 类型 1：开发 2:产品
     */
    public void setType(String type) {
        this.type = type;
    }
}