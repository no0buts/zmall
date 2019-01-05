package cn.xx55xx.service.impl;

import cn.xx55xx.entity.OrderEntity;
import cn.xx55xx.mapper.OrderMapper;
import cn.xx55xx.model.OrderReq;
import cn.xx55xx.service.OrderService;
import cn.xx55xx.util.GenerateOrderNoUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {


    @Autowired
    private OrderMapper orderMapper;


    Integer buyerId = 100001;

    //添加订单
    public void addOrder(OrderReq orderReq) {

        OrderEntity orderEntity = new OrderEntity();
        orderEntity.setOrderNumber(GenerateOrderNoUtil.getOrderNo());
        orderEntity.setBuyerId(buyerId);
        orderEntity.setProductId(orderReq.getProductId());
        orderEntity.setProductCount(orderReq.getProductCount());
        orderEntity.setRecipientId(orderReq.getRecipientId());
        orderEntity.setTotalMoney(orderReq.getProductTotalMoney());
        orderEntity.setActualPay(orderReq.getActualPay());

        orderMapper.insertOrder(orderEntity);

    }

    public List<OrderEntity> getOrdersByBuyerId(Integer buyerId) {

        List<OrderEntity> orders = orderMapper.getOrdersByBuyerId(buyerId);
        return orders;
    }
}
