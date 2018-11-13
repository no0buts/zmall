package cn.xx55xx.service;

import cn.xx55xx.entity.ProductEntity;

import java.util.List;

public interface ProductService {
	List<ProductEntity> getProductList();

	ProductEntity getProductDetailById(Integer productId);
}