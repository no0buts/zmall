package cn.xx55xx.controller;

import cn.xx55xx.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;

	@RequestMapping("/hello")
	public String hello() {
		// 调用业务层执行查询操作
		productService.getProductList();
		return "hello";
	}
}