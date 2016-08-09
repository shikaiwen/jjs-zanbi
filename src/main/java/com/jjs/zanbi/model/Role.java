package com.jjs.zanbi.model;

import javax.persistence.*;

@Table(name = "role")
public class Role {


    @Transient
    ZbRule zbRule;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "role_name")
    private String roleName;

    /**
     * 是否为产品经理 0：否 1：是
     */
    @Column(name = "is_product_mgr")
    private String isProductMgr;

    /**
     * 1：开发 2：产品
     */
    @Column(name = "role_type")
    private Byte roleType;

    @Column(name = "zb_rule_id")
    private Integer zbRuleId;

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
     * @return role_name
     */
    public String getRoleName() {
        return roleName;
    }

    /**
     * @param roleName
     */
    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    /**
     * 获取是否为产品经理 0：否 1：是
     *
     * @return is_product_mgr - 是否为产品经理 0：否 1：是
     */
    public String getIsProductMgr() {
        return isProductMgr;
    }

    /**
     * 设置是否为产品经理 0：否 1：是
     *
     * @param isProductMgr 是否为产品经理 0：否 1：是
     */
    public void setIsProductMgr(String isProductMgr) {
        this.isProductMgr = isProductMgr;
    }

    /**
     * 获取1：开发 2：产品
     *
     * @return role_type - 1：开发 2：产品
     */
    public Byte getRoleType() {
        return roleType;
    }

    /**
     * 设置1：开发 2：产品
     *
     * @param roleType 1：开发 2：产品
     */
    public void setRoleType(Byte roleType) {
        this.roleType = roleType;
    }

    /**
     * @return zb_rule_id
     */
    public Integer getZbRuleId() {
        return zbRuleId;
    }

    /**
     * @param zbRuleId
     */
    public void setZbRuleId(Integer zbRuleId) {
        this.zbRuleId = zbRuleId;
    }

    public ZbRule getZbRule() {
        return zbRule;
    }

    public void setZbRule(ZbRule zbRule) {
        this.zbRule = zbRule;
    }


}