package cn.xx55xx.controller;

import cn.xx55xx.entity.ProductEntity;
import cn.xx55xx.model.ResponseData;
import cn.xx55xx.model.ResponseStatus;
import cn.xx55xx.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class ServiceApiController {

	@Autowired
	private ProductService productService;

	//产品列表
	@RequestMapping("/api/getProductList")
	public @ResponseBody
	ResponseData getProductList(HttpServletRequest request,
								HttpServletResponse response) {
		ResponseStatus responseStatus = new ResponseStatus();
		List<ProductEntity> productEntities = productService.getProductList();
		return new ResponseData(responseStatus,productEntities);
	}

	//产品详情
	@RequestMapping("/api/getProductDetailJson/{productId}")
	public  @ResponseBody
	ResponseData getProductDetailJson(@PathVariable Integer productId,
									  HttpServletRequest request,
									  HttpServletResponse response) {
		ResponseStatus responseStatus = new ResponseStatus();
		ProductEntity product = productService.getProductDetailById(productId);
		return new ResponseData(responseStatus, product);
	}


}