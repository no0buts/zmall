package cn.xx55xx.service.impl;

import cn.xx55xx.entity.ProductEntity;
import cn.xx55xx.mapper.ProductMapper;
import cn.xx55xx.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productMapper;


	public List<ProductEntity> getProductList() {
		List<ProductEntity> productList = productMapper.getProductList();
		return productList;
	}

	public ProductEntity getProductDetailById(Integer productId) {
		ProductEntity productEntity = productMapper.getProductDetailById(productId);
		return productEntity;
	}


}