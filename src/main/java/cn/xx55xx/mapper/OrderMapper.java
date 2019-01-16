package cn.xx55xx.mapper;

import cn.xx55xx.entity.OrderEntity;

import java.util.List;

public interface OrderMapper {
    //插入一条订单记录
    void insertOrder(OrderEntity orderEntity);

    //根据订单号查找订单
    OrderEntity getOrderByOrderNo(String orderNumber);

    List<OrderEntity> getOrdersByBuyerId(Integer buyerId);

}
