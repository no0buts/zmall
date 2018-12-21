package cn.xx55xx.mapper;

import cn.xx55xx.entity.OrderEntity;

import java.util.List;

public interface OrderMapper {
    void insertOrder(OrderEntity orderEntity);
    List<OrderEntity> getOrdersByBuyerId(Integer buyerId);

}
