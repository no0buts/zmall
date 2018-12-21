package cn.xx55xx.controller;

import cn.xx55xx.entity.BuyerEntity;
import cn.xx55xx.entity.ProductEntity;
import cn.xx55xx.model.BuyerReq;
import cn.xx55xx.model.ResponseData;
import cn.xx55xx.model.ResponseStatus;
import cn.xx55xx.service.BuyerService;
import cn.xx55xx.service.ProductService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class ServiceApiController {

	private final static String NULL_PARAM = "NULL_PARAM";
	private final static String NULL_PARAM_MSG = "账号和密码不能为空";
	private final static String NULL_BUYER = "NULL_BUYER";
	private final static String NULL_BUYER_MSG = "您输入的账号不存在，请重新输入";
	private final static String FALSE_PASSWORD = "FALSE_PASSWORD";
	private final static String FALSE_PASSWORD_MSG = "您输入的密码有误，请重新输入";
	private final static String REGIST_ACCOUNT_REPEAT = "REGIST_ACCOUNT_REPEAT";
	private final static String REGIST_ACCOUNT_REPEAT_MSG = "该账号已被注册";



	@Autowired
	private ProductService productService;
	@Autowired
	private BuyerService buyerService;

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

	//控制登录
	@RequestMapping("/api/buyerLogin")
	public @ResponseBody ResponseData getBuyerLoginJson(
			@RequestBody BuyerReq buyerReq) {
		ResponseStatus respStatus = new ResponseStatus();
		respStatus.setSuccess(true);
		if (StringUtils.isNotBlank(buyerReq.getBuyerAccount()) && StringUtils.isNotBlank(buyerReq.getBuyerPassword())) {
			// TODO 根据输入的账号查询用户信息
			BuyerEntity buyerEntity = buyerService.getBuyerByAccount(buyerReq.getBuyerAccount());
			if(buyerEntity != null ) { //buyer存在，判断密码
				if(buyerEntity.getBuyerPassword().equals(buyerReq.getBuyerPassword())) { //密码正确，即可登录
					respStatus.setStatus(true,null,null);
				} else {
					respStatus.setStatus(false, FALSE_PASSWORD, FALSE_PASSWORD_MSG);
				}
			} else {
				respStatus.setStatus(false, NULL_BUYER, NULL_BUYER_MSG);
			}
		} else {
			respStatus.setStatus(false, NULL_PARAM, NULL_PARAM_MSG);
		}

		return new ResponseData(respStatus,null);
	}

	//控制注册
	@RequestMapping("/api/buyerRegist")
	public @ResponseBody ResponseData getBuyerRegistJson(
			@RequestBody BuyerReq buyerReq) {
		ResponseStatus respStatus = new ResponseStatus();
		respStatus.setSuccess(true);
		// TODO 非空判断
		if (StringUtils.isNotBlank(buyerReq.getBuyerAccount()) && StringUtils.isNotBlank(buyerReq.getBuyerPassword())) {
			// TODO 查询输入的账号是否存在（已被注册）
			BuyerEntity buyerEntity = buyerService.getBuyerByAccount(buyerReq.getBuyerAccount());
			if(buyerEntity == null) {  //没查到，则这个账号没被注册，即该账号可以注册
				buyerService.buyerRegist(buyerReq);
			} else {
				respStatus.setStatus(false, REGIST_ACCOUNT_REPEAT, REGIST_ACCOUNT_REPEAT_MSG);
			}
		} else {   //空参数
			respStatus.setStatus(false, NULL_PARAM, NULL_PARAM_MSG);
		}


		return new ResponseData(respStatus, null);
	}


}