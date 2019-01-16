package cn.xx55xx.service.impl;

import cn.xx55xx.entity.OrderEntity;
import cn.xx55xx.entity.ProductEntity;
import cn.xx55xx.entity.RecipientEntity;
import cn.xx55xx.mapper.OrderMapper;
import cn.xx55xx.mapper.ProductMapper;
import cn.xx55xx.mapper.RecipientMapper;
import cn.xx55xx.model.OrderReq;
import cn.xx55xx.model.OrderVO;
import cn.xx55xx.model.ProductVO;
import cn.xx55xx.model.RecipientVO;
import cn.xx55xx.service.OrderService;
import cn.xx55xx.util.GenerateOrderNoUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {


    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private RecipientMapper recipientMapper;

    Integer buyerId = 100001;



    //添加订单
    public String addOrder(OrderReq orderReq) {
        //1.将数据存入到order_info表中，订单状态设置为等待支付

        OrderEntity orderEntity =  buildOrder(orderReq,1);  //订单状态设置成等待支付的状态

        orderMapper.insertOrder(orderEntity);


        //2.根据产品id查询库存
        Integer productId = orderReq.getProductId();
        Integer productCount = orderReq.getProductCount();
        Integer productInventory = productMapper.getProductInventory(productId);
        if (productInventory >= productCount) { //库存够，减去库存
            productInventory -= productCount;
            ProductEntity productEntity = new ProductEntity();
            productEntity.setProductId(productId);
            productEntity.setProductInventory(productInventory);
            productMapper.setProductInventory(productEntity);
            return orderEntity.getOrderNumber();
        } else { // 库存不够，提示下单失败
            return "error";
        }
    }


    //查询订单
    public OrderVO getOrderByNumber(String orderNumber) {
        OrderEntity orderEntity = orderMapper.getOrderByOrderNo(orderNumber);
        OrderVO vo = mapOrderInfo(orderEntity);

        return vo;
    }



    public List<OrderEntity> getOrdersByBuyerId(Integer buyerId) {

        List<OrderEntity> orders = orderMapper.getOrdersByBuyerId(buyerId);

        return orders;
    }



    //VO即View Object，在这里处理一下数据，使得从数据库中查询到的数据方便在前端显示，如Date不作处理的话，前端显示的就是秒数
    public OrderVO mapOrderInfo(OrderEntity orderEntity) {
        OrderVO orderVO = new OrderVO();

        orderVO.setBuyerId(orderEntity.getBuyerId());
        orderVO.setOrderNumber(orderEntity.getOrderNumber());

        //产品信息，order_info表中本来存的是product_id，但是在前端需要知道产品信息
        ProductEntity productEntity = productMapper.getProductDetailById(orderEntity.getProductId());
        ProductVO productVO = new ProductVO(productEntity.getProductId(),productEntity.getProductName(),
                productEntity.getProductPrice(),productEntity.getProductOriginalprice(),
                productEntity.getProductSalesvolume(),productEntity.getProductInventory(),
                productEntity.getProductImage());

        orderVO.setProductVO(productVO);

        orderVO.setProductCount(orderEntity.getProductCount());

        //收件人信息，order_info表中本来存的是recipient_id，但是在前端需要显示收件人信息
        RecipientEntity recipientEntity = recipientMapper.getRecipientById(orderEntity.getRecipientId());
        RecipientVO recipientVO = new RecipientVO(recipientEntity.getRecipientId(),recipientEntity.getRecipientName(),
                recipientEntity.getRecipientPhonenum(),recipientEntity.getRecipientAddress(),recipientEntity.getRecipientAddressDetail());
        orderVO.setRecipientVO(recipientVO);

        //将Date类型的日期转化为供前端显示的时间（String类型）
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String orderDateStr = simpleDateFormat.format(orderEntity.getOrderDate());
        orderVO.setOrderDate(orderEntity.getOrderDate());
        orderVO.setOrderDateStr(orderDateStr);

        orderVO.setTotalMoney(orderEntity.getTotalMoney());
        orderVO.setFreight(orderEntity.getFreight());
        orderVO.setOrderState(orderEntity.getOrderState());

        return orderVO;
    }


    //将前端传到后台的数据做处理
    public OrderEntity  buildOrder(OrderReq orderReq, Integer orderState) {
        OrderEntity orderEntity = new OrderEntity();

        String orderNumber = GenerateOrderNoUtil.getOrderNo();
        orderEntity.setOrderNumber(orderNumber);
        orderEntity.setBuyerId(buyerId);
        orderEntity.setProductId(orderReq.getProductId());
        orderEntity.setProductCount(orderReq.getProductCount());
        orderEntity.setRecipientId(orderReq.getRecipientId());
        orderEntity.setTotalMoney(orderReq.getTotalMoney());
        orderEntity.setOrderState(orderState);

        return orderEntity;
    }
}
