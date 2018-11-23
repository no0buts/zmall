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

	//买家登录
	@RequestMapping("/buyer/login")
	public ModelAndView toBuyerLogin() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("buyer-login");
		return modelAndView;
	}

	//买家注册
	@RequestMapping("/buyer/regist")
	public ModelAndView toBuyerRegist() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("buyer-regist");
		return modelAndView;
	}
}