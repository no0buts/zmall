package com.xx55xx.mapper;

import com.xx55xx.entity.TestEntity;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface DemoMapper {
    List<TestEntity> getTest();
}
