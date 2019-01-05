package cn.xx55xx.model;


public class OrderReq {

    private Integer productId;
    private Integer productCount;
    private Integer recipientId;
    private Double productTotalMoney;
    private Double actualPay;


    public OrderReq() {
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getProductCount() {
        return productCount;
    }

    public void setProductCount(Integer productCount) {
        this.productCount = productCount;
    }

    public Integer getRecipientId() {
        return recipientId;
    }

    public void setRecipientId(Integer recipientId) {
        this.recipientId = recipientId;
    }

    public Double getProductTotalMoney() {
        return productTotalMoney;
    }

    public void setProductTotalMoney(Double productTotalMoney) {
        this.productTotalMoney = productTotalMoney;
    }

    public Double getActualPay() {
        return actualPay;
    }

    public void setActualPay(Double actualPay) {
        this.actualPay = actualPay;
    }
}