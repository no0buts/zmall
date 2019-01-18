package cn.xx55xx.controller;

import cn.xx55xx.entity.OrderEntity;
import cn.xx55xx.model.OrderReq;
import cn.xx55xx.model.OrderVO;
import cn.xx55xx.model.ResponseData;
import cn.xx55xx.model.ResponseStatus;
import cn.xx55xx.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class OrderServiceApiController {
    @Autowired
    private OrderService orderService;

    Integer buyerId = 100001;

    //点击提交订单后，
    @RequestMapping("/api/submitOrder")
    public @ResponseBody ResponseData submitOrder (
            @RequestBody OrderReq orderReq) {
        ResponseStatus responseStatus = new ResponseStatus();

        String str = orderService.addOrder(orderReq);

        return new ResponseData(responseStatus, str);
    }


    //根据订单号获取订单信息
    @RequestMapping("/api/getOrderJson/{orderNumber}")
    public @ResponseBody ResponseData getOrderJson(@PathVariable String orderNumber,
                              HttpServletRequest request,
                              HttpServletResponse response) {
        ResponseStatus responseStatus = new ResponseStatus();
        OrderVO orderVO = orderService.getOrderByNumber(orderNumber);
        return new ResponseData(responseStatus ,orderVO);
    }



    //查看所有订单
    @RequestMapping("/api/getAllOrders")
    public @ResponseBody ResponseData getAllOrders () {
        ResponseStatus responseStatus = new ResponseStatus();

        Integer buyerId = 100001;
        List<OrderEntity> orderEntities = orderService.getOrdersByBuyerId(buyerId);

        return new ResponseData(responseStatus,orderEntities);
    }
}
