package com.xx55xx.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xx55xx.service.DemoService;

@Controller
public class DemoController {

	@Autowired
	private DemoService demoService;

	@RequestMapping("/hello")
	public String hello() {
		System.out.println("执行hello控制器方法");
		// 调用业务层执行查询操作
		demoService.getTest();
		return "hello";
	}
}