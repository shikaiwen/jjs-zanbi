package com.jjs.zanbi.model;

import javax.persistence.*;

@Table(name = "worker")
public class Worker {

    @Transient private Org org;
    @Transient private Role role;

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
     * 所属组id
     */
    @Column(name = "org_id")
    private Integer orgId;

    /**
     * 状态 0：禁用 1：可用
     */
    private String status;

    /**
     * 角色id
     */
    @Column(name = "role_id")
    private Integer roleId;

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

    /**
     * 获取角色id
     *
     * @return role_id - 角色id
     */
    public Integer getRoleId() {
        return roleId;
    }

    /**
     * 设置角色id
     *
     * @param roleId 角色id
     */
    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Org getOrg() {
        return org;
    }

    public void setOrg(Org org) {
        this.org = org;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }



}