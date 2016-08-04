package com.jjs.zanbi.model;

import javax.persistence.*;
import java.util.Date;

@Table(name = "send_record")
public class SendRecord {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "sender_id")
    private Integer senderId;

    @Column(name = "send_time")
    private Date sendTime;

    /**
     * 这是发送时备注的原文
     */
    private String remark;

    /**
     * 发送的电脑主机
     */
    @Column(name = "sender_ip")
    private String senderIp;

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
     * @return sender_id
     */
    public Integer getSenderId() {
        return senderId;
    }

    /**
     * @param senderId
     */
    public void setSenderId(Integer senderId) {
        this.senderId = senderId;
    }

    /**
     * @return send_time
     */
    public Date getSendTime() {
        return sendTime;
    }

    /**
     * @param sendTime
     */
    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

    /**
     * 获取这是发送时备注的原文
     *
     * @return remark - 这是发送时备注的原文
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 设置这是发送时备注的原文
     *
     * @param remark 这是发送时备注的原文
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * 获取发送的电脑主机
     *
     * @return sender_ip - 发送的电脑主机
     */
    public String getSenderIp() {
        return senderIp;
    }

    /**
     * 设置发送的电脑主机
     *
     * @param senderIp 发送的电脑主机
     */
    public void setSenderIp(String senderIp) {
        this.senderIp = senderIp;
    }
}