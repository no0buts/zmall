package cn.xx55xx.model;

public class RecipientVO {
    private Integer recipientId;
    private String recipientName;
    private String recipientPhonenum;
    private String recipientAddress;
    private String recipientAddressDetail;
    private Integer recipientDefault;

    public RecipientVO() {
    }

    public RecipientVO(Integer recipientId, String recipientName, String recipientPhonenum, String recipientAddress, String recipientAddressDetail) {
        this.recipientId = recipientId;
        this.recipientName = recipientName;
        this.recipientPhonenum = recipientPhonenum;
        this.recipientAddress = recipientAddress;
        this.recipientAddressDetail = recipientAddressDetail;
    }

    public Integer getRecipientId() {
        return recipientId;
    }

    public void setRecipientId(Integer recipientId) {
        this.recipientId = recipientId;
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
}
