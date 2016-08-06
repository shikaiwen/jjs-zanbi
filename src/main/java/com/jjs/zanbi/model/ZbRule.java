package com.jjs.zanbi.model;

import javax.persistence.*;

@Table(name = "zb_rule")
public class ZbRule {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "rule_name")
    private String ruleName;

    @Column(name = "zb_count")
    private Integer zbCount;

    /**
     * 暂币计算类型  1:固定 2:根据组织架构公式计算
     */
    @Column(name = "zb_compute_type")
    private String zbComputeType;

    /**
     * 计算公式
     */
    private String calculate;

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


    public String getRuleName() {
        return ruleName;
    }

    public void setRuleName(String ruleName) {
        this.ruleName = ruleName;
    }

    /**
     * @return zb_count
     */
    public Integer getZbCount() {
        return zbCount;
    }

    /**
     * @param zbCount
     */
    public void setZbCount(Integer zbCount) {
        this.zbCount = zbCount;
    }

    /**
     * 获取暂币计算类型  1:固定 2:根据组织架构公式计算
     *
     * @return zb_compute_type - 暂币计算类型  1:固定 2:根据组织架构公式计算
     */
    public String getZbComputeType() {
        return zbComputeType;
    }

    /**
     * 设置暂币计算类型  1:固定 2:根据组织架构公式计算
     *
     * @param zbComputeType 暂币计算类型  1:固定 2:根据组织架构公式计算
     */
    public void setZbComputeType(String zbComputeType) {
        this.zbComputeType = zbComputeType;
    }

    /**
     * 获取计算公式
     *
     * @return calculate - 计算公式
     */
    public String getCalculate() {
        return calculate;
    }

    /**
     * 设置计算公式
     *
     * @param calculate 计算公式
     */
    public void setCalculate(String calculate) {
        this.calculate = calculate;
    }
}