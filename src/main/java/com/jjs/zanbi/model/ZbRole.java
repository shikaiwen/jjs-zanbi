package com.jjs.zanbi.model;

public class ZbRole {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column zb_role.id
     *
     * @mbggenerated Wed Jul 27 15:40:26 CST 2016
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column zb_role.role_name
     *
     * @mbggenerated Wed Jul 27 15:40:26 CST 2016
     */
    private String roleName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column zb_role.zb_count
     *
     * @mbggenerated Wed Jul 27 15:40:26 CST 2016
     */
    private Integer zbCount;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column zb_role.zb_compute_type
     *
     * @mbggenerated Wed Jul 27 15:40:26 CST 2016
     */
    private String zbComputeType;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column zb_role.calculate
     *
     * @mbggenerated Wed Jul 27 15:40:26 CST 2016
     */
    private String calculate;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column zb_role.id
     *
     * @return the value of zb_role.id
     *
     * @mbggenerated Wed Jul 27 15:40:26 CST 2016
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column zb_role.id
     *
     * @param id the value for zb_role.id
     *
     * @mbggenerated Wed Jul 27 15:40:26 CST 2016
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column zb_role.role_name
     *
     * @return the value of zb_role.role_name
     *
     * @mbggenerated Wed Jul 27 15:40:26 CST 2016
     */
    public String getRoleName() {
        return roleName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column zb_role.role_name
     *
     * @param roleName the value for zb_role.role_name
     *
     * @mbggenerated Wed Jul 27 15:40:26 CST 2016
     */
    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column zb_role.zb_count
     *
     * @return the value of zb_role.zb_count
     *
     * @mbggenerated Wed Jul 27 15:40:26 CST 2016
     */
    public Integer getZbCount() {
        return zbCount;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column zb_role.zb_count
     *
     * @param zbCount the value for zb_role.zb_count
     *
     * @mbggenerated Wed Jul 27 15:40:26 CST 2016
     */
    public void setZbCount(Integer zbCount) {
        this.zbCount = zbCount;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column zb_role.zb_compute_type
     *
     * @return the value of zb_role.zb_compute_type
     *
     * @mbggenerated Wed Jul 27 15:40:26 CST 2016
     */
    public String getZbComputeType() {
        return zbComputeType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column zb_role.zb_compute_type
     *
     * @param zbComputeType the value for zb_role.zb_compute_type
     *
     * @mbggenerated Wed Jul 27 15:40:26 CST 2016
     */
    public void setZbComputeType(String zbComputeType) {
        this.zbComputeType = zbComputeType == null ? null : zbComputeType.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column zb_role.calculate
     *
     * @return the value of zb_role.calculate
     *
     * @mbggenerated Wed Jul 27 15:40:26 CST 2016
     */
    public String getCalculate() {
        return calculate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column zb_role.calculate
     *
     * @param calculate the value for zb_role.calculate
     *
     * @mbggenerated Wed Jul 27 15:40:26 CST 2016
     */
    public void setCalculate(String calculate) {
        this.calculate = calculate == null ? null : calculate.trim();
    }
}