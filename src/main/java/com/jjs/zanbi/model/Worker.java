package com.jjs.zanbi.model;

public class Worker {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column worker.id
     *
     * @mbggenerated Fri Jul 29 13:41:03 CST 2016
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column worker.worker_id
     *
     * @mbggenerated Fri Jul 29 13:41:03 CST 2016
     */
    private String workerId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column worker.name
     *
     * @mbggenerated Fri Jul 29 13:41:03 CST 2016
     */
    private String name;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column worker.zb_role_id
     *
     * @mbggenerated Fri Jul 29 13:41:03 CST 2016
     */
    private Integer zbRoleId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column worker.org_id
     *
     * @mbggenerated Fri Jul 29 13:41:03 CST 2016
     */
    private String orgId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column worker.status
     *
     * @mbggenerated Fri Jul 29 13:41:03 CST 2016
     */
    private String status;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column worker.id
     *
     * @return the value of worker.id
     *
     * @mbggenerated Fri Jul 29 13:41:03 CST 2016
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column worker.id
     *
     * @param id the value for worker.id
     *
     * @mbggenerated Fri Jul 29 13:41:03 CST 2016
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column worker.worker_id
     *
     * @return the value of worker.worker_id
     *
     * @mbggenerated Fri Jul 29 13:41:03 CST 2016
     */
    public String getWorkerId() {
        return workerId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column worker.worker_id
     *
     * @param workerId the value for worker.worker_id
     *
     * @mbggenerated Fri Jul 29 13:41:03 CST 2016
     */
    public void setWorkerId(String workerId) {
        this.workerId = workerId == null ? null : workerId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column worker.name
     *
     * @return the value of worker.name
     *
     * @mbggenerated Fri Jul 29 13:41:03 CST 2016
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column worker.name
     *
     * @param name the value for worker.name
     *
     * @mbggenerated Fri Jul 29 13:41:03 CST 2016
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column worker.zb_role_id
     *
     * @return the value of worker.zb_role_id
     *
     * @mbggenerated Fri Jul 29 13:41:03 CST 2016
     */
    public Integer getZbRoleId() {
        return zbRoleId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column worker.zb_role_id
     *
     * @param zbRoleId the value for worker.zb_role_id
     *
     * @mbggenerated Fri Jul 29 13:41:03 CST 2016
     */
    public void setZbRoleId(Integer zbRoleId) {
        this.zbRoleId = zbRoleId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column worker.org_id
     *
     * @return the value of worker.org_id
     *
     * @mbggenerated Fri Jul 29 13:41:03 CST 2016
     */
    public String getOrgId() {
        return orgId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column worker.org_id
     *
     * @param orgId the value for worker.org_id
     *
     * @mbggenerated Fri Jul 29 13:41:03 CST 2016
     */
    public void setOrgId(String orgId) {
        this.orgId = orgId == null ? null : orgId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column worker.status
     *
     * @return the value of worker.status
     *
     * @mbggenerated Fri Jul 29 13:41:03 CST 2016
     */
    public String getStatus() {
        return status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column worker.status
     *
     * @param status the value for worker.status
     *
     * @mbggenerated Fri Jul 29 13:41:03 CST 2016
     */
    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }
}