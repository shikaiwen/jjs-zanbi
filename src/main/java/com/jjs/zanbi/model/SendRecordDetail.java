package com.jjs.zanbi.model;

import javax.persistence.*;
import java.util.Date;

@Table(name = "send_record_detail")
public class SendRecordDetail {


    @Transient private Worker sender;
    @Transient private Worker receiver;

    @Transient private SendRecord sendRecord;


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "sender_id")
    private Integer senderId;

    @Column(name = "receiver_id")
    private Integer receiverId;

    /**
     * 个数
     */
    @Column(name = "zb_count")
    private Integer zbCount;

    @Column(name = "send_time")
    private Date sendTime;

    /**
     * 针对每个人的备注，可能为空，因为没有解析出来
     */
    private String remark;

    /**
     * 主发送记录id
     */
    @Column(name = "send_main_id")
    private Integer sendMainId;

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
     * @return receiver_id
     */
    public Integer getReceiverId() {
        return receiverId;
    }

    /**
     * @param receiverId
     */
    public void setReceiverId(Integer receiverId) {
        this.receiverId = receiverId;
    }

    /**
     * 获取个数
     *
     * @return zb_count - 个数
     */
    public Integer getZbCount() {
        return zbCount;
    }

    /**
     * 设置个数
     *
     * @param zbCount 个数
     */
    public void setZbCount(Integer zbCount) {
        this.zbCount = zbCount;
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
     * 获取针对每个人的备注，可能为空，因为没有解析出来
     *
     * @return remark - 针对每个人的备注，可能为空，因为没有解析出来
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 设置针对每个人的备注，可能为空，因为没有解析出来
     *
     * @param remark 针对每个人的备注，可能为空，因为没有解析出来
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * 获取主发送记录id
     *
     * @return send_main_id - 主发送记录id
     */
    public Integer getSendMainId() {
        return sendMainId;
    }

    /**
     * 设置主发送记录id
     *
     * @param sendMainId 主发送记录id
     */
    public void setSendMainId(Integer sendMainId) {
        this.sendMainId = sendMainId;
    }


    public Worker getSender() {
        return sender;
    }

    public void setSender(Worker sender) {
        this.sender = sender;
    }

    public Worker getReceiver() {
        return receiver;
    }

    public void setReceiver(Worker receiver) {
        this.receiver = receiver;
    }

    public SendRecord getSendRecord() {
        return sendRecord;
    }

    public void setSendRecord(SendRecord sendRecord) {
        this.sendRecord = sendRecord;
    }
}