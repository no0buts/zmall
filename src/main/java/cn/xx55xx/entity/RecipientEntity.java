package cn.xx55xx.entity;

import java.util.Date;

public class RecipientEntity {

    private Integer recipientId;
    private Integer buyerId;
    private String recipientName;
    private String recipientPhonenum;
    private String recipientAddress;
    private String recipientAddressDetail;
    private Integer recipientDefault;
    private Date recipientCreateTime;
    private Date recipientUpdateTime;

    public RecipientEntity() {
    }

    public Integer getRecipientId() {
        return recipientId;
    }

    public void setRecipientId(Integer recipientId) {
        this.recipientId = recipientId;
    }

    public Integer getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(Integer buyerId) {
        this.buyerId = buyerId;
    }

    public String getRecipientName() {
        return recipientName;
    }

    public void setRecipientName(String recipientName) {
        this.recipientName = recipientName;
    }

    public String getRecipientPhonenum() {
        return recipientPhonenum;
    }

    public void setRecipientPhonenum(String recipientPhonenum) {
        this.recipientPhonenum = recipientPhonenum;
    }

    public String getRecipientAddress() {
        return recipientAddress;
    }

    public void setRecipientAddress(String recipientAddress) {
        this.recipientAddress = recipientAddress;
    }

    public String getRecipientAddressDetail() {
        return recipientAddressDetail;
    }

    public void setRecipientAddressDetail(String recipientAddressDetail) {
        this.recipientAddressDetail = recipientAddressDetail;
    }

    public Integer getRecipientDefault() {
        return recipientDefault;
    }

    public void setRecipientDefault(Integer recipientDefault) {
        this.recipientDefault = recipientDefault;
    }

    public Date getRecipientCreateTime() {
        return recipientCreateTime;
    }

    public void setRecipientCreateTime(Date recipientCreateTime) {
        this.recipientCreateTime = recipientCreateTime;
    }

    public Date getRecipientUpdateTime() {
        return recipientUpdateTime;
    }

    public void setRecipientUpdateTime(Date recipientUpdateTime) {
        this.recipientUpdateTime = recipientUpdateTime;
    }
}
