package cn.xx55xx.controller;

import cn.xx55xx.entity.OrderEntity;
import cn.xx55xx.model.OrderReq;
import cn.xx55xx.model.ResponseData;
import cn.xx55xx.model.ResponseStatus;
import cn.xx55xx.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class OrderServiceApiController {
    @Autowired
    private OrderService orderService;



    //点击提交订单后，
    @RequestMapping("/api/submitOrder")
    public @ResponseBody ResponseData submitOrder (
            @RequestBody OrderReq orderReq) {
        ResponseStatus responseStatus = new ResponseStatus();

        orderService.addOrder(orderReq);

        return new ResponseData(responseStatus,null);
    }


    //查看订单
    @RequestMapping("/api/getAllOrders")
    public @ResponseBody ResponseData getAllOrders () {
        ResponseStatus responseStatus = new ResponseStatus();

        Integer buyerId = 100001;
        List<OrderEntity> orderEntities = orderService.getOrdersByBuyerId(buyerId);

        return new ResponseData(responseStatus,orderEntities);
    }
}
