package com.jjs.zanbi.model;

import javax.persistence.*;

@Table(name = "worker")
public class Worker {


    @Transient private Org org;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 暂时不用
     */
    @Column(name = "worker_id")
    private String workerId;

    private String name;

    /**
     * 默认普通成员
     */
    @Column(name = "zb_role_id")
    private Integer zbRoleId;

    /**
     * 所属组id
     */
    @Column(name = "org_id")
    private Integer orgId;

    /**
     * 状态 0：禁用 1：可用
     */
    private String status;

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
     * 获取暂时不用
     *
     * @return worker_id - 暂时不用
     */
    public String getWorkerId() {
        return workerId;
    }

    /**
     * 设置暂时不用
     *
     * @param workerId 暂时不用
     */
    public void setWorkerId(String workerId) {
        this.workerId = workerId;
    }

    /**
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取默认普通成员
     *
     * @return zb_role_id - 默认普通成员
     */
    public Integer getZbRoleId() {
        return zbRoleId;
    }

    /**
     * 设置默认普通成员
     *
     * @param zbRoleId 默认普通成员
     */
    public void setZbRoleId(Integer zbRoleId) {
        this.zbRoleId = zbRoleId;
    }

    /**
     * 获取所属组id
     *
     * @return org_id - 所属组id
     */
    public Integer getOrgId() {
        return orgId;
    }

    /**
     * 设置所属组id
     *
     * @param orgId 所属组id
     */
    public void setOrgId(Integer orgId) {
        this.orgId = orgId;
    }

    /**
     * 获取状态 0：禁用 1：可用
     *
     * @return status - 状态 0：禁用 1：可用
     */
    public String getStatus() {
        return status;
    }

    /**
     * 设置状态 0：禁用 1：可用
     *
     * @param status 状态 0：禁用 1：可用
     */
    public void setStatus(String status) {
        this.status = status;
    }

    public Org getOrg() {
        return org;
    }

    public void setOrg(Org org) {
        this.org = org;
    }
}