package cn.xx55xx.entity;

public class BuyerEntity {
    private Integer buyerId;
    private String buyerAccount;
    private String buyerPassword;
    private String buyerNickname;
    private String buyerTruename;
    private String buyerHeadimg;
    private String buyerPhonenum;

    public BuyerEntity() {
    }

    public BuyerEntity(Integer buyerId, String buyerAccount, String buyerPassword, String buyerNickname, String buyerTruename, String buyerHeadimg, String buyerPhonenum) {
        this.buyerId = buyerId;
        this.buyerAccount = buyerAccount;
        this.buyerPassword = buyerPassword;
        this.buyerNickname = buyerNickname;
        this.buyerTruename = buyerTruename;
        this.buyerHeadimg = buyerHeadimg;
        this.buyerPhonenum = buyerPhonenum;
    }

    public Integer getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(Integer buyerId) {
        this.buyerId = buyerId;
    }

    public String getBuyerAccount() {
        return buyerAccount;
    }

    public void setBuyerAccount(String buyerAccount) {
        this.buyerAccount = buyerAccount;
    }

    public String getBuyerPassword() {
        return buyerPassword;
    }

    public void setBuyerPassword(String buyerPassword) {
        this.buyerPassword = buyerPassword;
    }

    public String getBuyerNickname() {
        return buyerNickname;
    }

    public void setBuyerNickname(String buyerNickname) {
        this.buyerNickname = buyerNickname;
    }

    public String getBuyerTruename() {
        return buyerTruename;
    }

    public void setBuyerTruename(String buyerTruename) {
        this.buyerTruename = buyerTruename;
    }

    public String getBuyerHeadimg() {
        return buyerHeadimg;
    }

    public void setBuyerHeadimg(String buyerHeadimg) {
        this.buyerHeadimg = buyerHeadimg;
    }

    public String getBuyerPhonenum() {
        return buyerPhonenum;
    }

    public void setBuyerPhonenum(String buyerPhonenum) {
        this.buyerPhonenum = buyerPhonenum;
    }
}
