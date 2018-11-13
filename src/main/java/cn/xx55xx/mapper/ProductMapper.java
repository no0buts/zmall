package cn.xx55xx.mapper;

import cn.xx55xx.entity.ProductEntity;

import java.util.List;

public interface ProductMapper {
    //获取所有产品
    List<ProductEntity> getProductList();

    //根据id获取某产品的详细信息
    ProductEntity getProductDetailById(Integer productId);

}
