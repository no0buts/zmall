package cn.xx55xx.job;

import cn.xx55xx.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderPayStatusJob {

    @Autowired
    OrderService orderService;


    /**
     * 取消过期订单业务逻辑处理
     *
      */
    public void updateStatus() {
        orderService.cancelOrderList();
        new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()); //打印当前时间
    }
}
