package cn.xx55xx.service;

import cn.xx55xx.entity.OrderEntity;
import cn.xx55xx.model.OrderReq;
import cn.xx55xx.model.OrderVO;

import java.util.List;

public interface OrderService {

    /**
     * 添加一份订单
     * @param orderReq
     */
    String addOrder(OrderReq orderReq);


    /**
     * 根据订单编号查询订单
     * @param orderNumber  订单编号
     * @return 订单视图对象
     */
    OrderVO getOrderByNumber(String orderNumber);



    /**
     * 查询用户的所有订单
     * @param buyerId
     * @return
     */
    List<OrderEntity> getOrdersByBuyerId(Integer buyerId);


    void cancelOrderList();
}
