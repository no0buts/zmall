package cn.xx55xx.model;

public class PaymentAccountVO {
    private Integer accountId;
    private String accountNumber;
    private Integer accountType;
    private String paymentPassword;
    private Integer buyerId;
    private Double accountBalance;

    public PaymentAccountVO() {
    }

    public PaymentAccountVO(Integer accountId, String accountNumber, Integer accountType, String paymentPassword, Integer buyerId, Double accountBalance) {
        this.accountId = accountId;
        this.accountNumber = accountNumber;
        this.accountType = accountType;
        this.paymentPassword = paymentPassword;
        this.buyerId = buyerId;
        this.accountBalance = accountBalance;
    }

    public Integer getAccountId() {
        return accountId;
    }

    public void setAccountId(Integer accountId) {
        this.accountId = accountId;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public Integer getAccountType() {
        return accountType;
    }

    public void setAccountType(Integer accountType) {
        this.accountType = accountType;
    }

    public String getPaymentPassword() {
        return paymentPassword;
    }

    public void setPaymentPassword(String paymentPassword) {
        this.paymentPassword = paymentPassword;
    }

    public Integer getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(Integer buyerId) {
        this.buyerId = buyerId;
    }

    public Double getAccountBalance() {
        return accountBalance;
    }

    public void setAccountBalance(Double accountBalance) {
        this.accountBalance = accountBalance;
    }
}
