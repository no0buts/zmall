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

	//买家在产品详情页 点击立即购买到填写订单页面
	@RequestMapping("/order/fill")
	public ModelAndView toFillOrder() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("order-fill");
		return modelAndView;
	}

	//在填写订单会显示默认收件人信息，点击这一块儿区域，显示其全部收件人信息，即收件人列表页面
	@RequestMapping("/recipient/list")
	public ModelAndView recipientList() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("recipient-list");
		return modelAndView;
	}

}