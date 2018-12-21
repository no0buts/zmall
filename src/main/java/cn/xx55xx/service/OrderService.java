package cn.xx55xx.service;

import cn.xx55xx.entity.OrderEntity;
import cn.xx55xx.model.OrderReq;

import java.util.List;

public interface OrderService {

    /**
     * 添加一份订单
     * @param orderReq
     */
    void addOrder(OrderReq orderReq);

    /**
     * 查询用户的所有订单
     * @param buyerId
     * @return
     */
    List<OrderEntity> getOrdersByBuyerId(Integer buyerId);


}
