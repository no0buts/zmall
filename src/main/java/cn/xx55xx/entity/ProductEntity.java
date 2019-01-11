package cn.xx55xx.entity;

public class ProductEntity {
    private Integer productId;   //产品id
    private String productName;    //产品名称
    private Double productPrice;   //产品价格
    private Double productOriginalprice;   //产品原价
    private Integer productSalesvolume;   //产品销量
    private Integer productInventory;      //库存
    private String productImage;       //产品图片

    public ProductEntity() {
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(Double productPrice) {
        this.productPrice = productPrice;
    }

    public Double getProductOriginalprice() {
        return productOriginalprice;
    }

    public void setProductOriginalprice(Double productOriginalprice) {
        this.productOriginalprice = productOriginalprice;
    }

    public Integer getProductSalesvolume() {
        return productSalesvolume;
    }

    public void setProductSalesvolume(Integer productSalesvolume) {
        this.productSalesvolume = productSalesvolume;
    }

    public Integer getProductInventory() {
        return productInventory;
    }

    public void setProductInventory(Integer productInventory) {
        this.productInventory = productInventory;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }
}
