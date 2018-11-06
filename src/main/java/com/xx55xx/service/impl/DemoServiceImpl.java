package com.xx55xx.service.impl;

import com.xx55xx.entity.TestEntity;
import com.xx55xx.mapper.DemoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xx55xx.service.DemoService;

import java.util.List;

@Service("demoService")
public class DemoServiceImpl implements DemoService {

	@Autowired
	private DemoMapper demoMapper;


	public List<TestEntity> getTest() {
		List<TestEntity> dataList = demoMapper.getTest();
		return dataList;
	}
}