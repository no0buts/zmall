package cn.xx55xx.service.impl;

import cn.xx55xx.entity.OrderEntity;
import cn.xx55xx.mapper.OrderMapper;
import cn.xx55xx.model.OrderReq;
import cn.xx55xx.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {


    @Autowired
    private OrderMapper orderMapper;


    public void addOrder(OrderReq orderReq) {
        OrderEntity orderEntity = new OrderEntity();
        orderEntity.setProductId(orderReq.getProductId());
        orderEntity.setProductCount(orderReq.getProductCount());

        orderMapper.insertOrder(orderEntity);

    }

    public List<OrderEntity> getOrdersByBuyerId(Integer buyerId) {

        List<OrderEntity> orders = orderMapper.getOrdersByBuyerId(buyerId);
        return orders;
    }
}
