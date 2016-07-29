package com.jjs.zanbi.querybean;

import java.util.Date;

/**
 * Created by kaiwen on 2016/7/28.
 */
public class SendRecordQueryBean extends QueryBean {

    public String senderId;
    public String receiverId;

    public Date sendTimeStart;
    public Date sendTimeEnd;

    public String getSenderId() {
        return senderId;
    }

    public void setSenderId(String senderId) {
        this.senderId = senderId;
    }

    public String getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(String receiverId) {
        this.receiverId = receiverId;
    }

    public Date getSendTimeStart() {
        return sendTimeStart;
    }

    public void setSendTimeStart(Date sendTimeStart) {
        this.sendTimeStart = sendTimeStart;
    }

    public Date getSendTimeEnd() {
        return sendTimeEnd;
    }

    public void setSendTimeEnd(Date sendTimeEnd) {
        this.sendTimeEnd = sendTimeEnd;
    }
}
