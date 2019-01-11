package cn.xx55xx.service.impl;

import cn.xx55xx.entity.OrderEntity;
import cn.xx55xx.entity.ProductEntity;
import cn.xx55xx.mapper.OrderMapper;
import cn.xx55xx.mapper.ProductMapper;
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

    @Autowired
    private ProductMapper productMapper;

    Integer buyerId = 100001;

    //添加订单
    public String addOrder(OrderReq orderReq) {
        //将数据存入到order_info表中，订单状态设置为等待支付
        Integer productId = orderReq.getProductId();
        Integer productCount = orderReq.getProductCount();
        OrderEntity orderEntity = new OrderEntity();
        String orderNumber = GenerateOrderNoUtil.getOrderNo();
        orderEntity.setOrderNumber(orderNumber);
        orderEntity.setBuyerId(buyerId);
        orderEntity.setProductId(productId);
        orderEntity.setProductCount(productCount);
        orderEntity.setRecipientId(orderReq.getRecipientId());
        orderEntity.setTotalMoney(orderReq.getTotalMoney());
        orderEntity.setOrderState(1);

        orderMapper.insertOrder(orderEntity);


        //根据产品id查询库存
        Integer productInventory = productMapper.getProductInventory(productId);
        if (productInventory >= productCount) { //库存够，减去库存
            productInventory -= productCount;
            ProductEntity productEntity = new ProductEntity();
            productEntity.setProductId(productId);
            productEntity.setProductInventory(productInventory);
            productMapper.setProductInventory(productEntity);
            return orderNumber;
        } else { // 库存不够，提示下单失败
            return "error";
        }



    }

    public List<OrderEntity> getOrdersByBuyerId(Integer buyerId) {

        List<OrderEntity> orders = orderMapper.getOrdersByBuyerId(buyerId);
        return orders;
    }
}
