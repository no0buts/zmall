package cn.xx55xx.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UrlController {

	@RequestMapping("/product/list")
	public ModelAndView productList() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("product-list");
		return modelAndView;
	}


	@RequestMapping("/product/{productId}")
	public ModelAndView toProductDetail() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "product-detail" );
		return modelAndView;
	}
}