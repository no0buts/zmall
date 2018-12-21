package cn.xx55xx.model;


public class OrderReq {

    private Integer productId;
    private Integer productCount;
    private Integer payType;


    public OrderReq() {
    }

    public Integer getProductCount() {
        return productCount;
    }

    public void setProductCount(Integer productCount) {
        this.productCount = productCount;
    }

    public Integer getPayType() {
        return payType;
    }

    public void setPayType(Integer payType) {
        this.payType = payType;
    }

    public Integer getProductId() {

        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }
}
