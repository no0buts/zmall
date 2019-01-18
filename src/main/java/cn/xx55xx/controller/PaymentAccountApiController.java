package cn.xx55xx.controller;

import cn.xx55xx.model.PaymentAccountVO;
import cn.xx55xx.model.ResponseData;
import cn.xx55xx.model.ResponseStatus;
import cn.xx55xx.service.PaymentAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class PaymentAccountApiController {
    @Autowired
    private PaymentAccountService paymentAccountService;

    //查询用户的所有支付账户
    @RequestMapping("/api/getPaymentAccountList")
    public @ResponseBody
    ResponseData getPaymentAccountList() {
        ResponseStatus responseStatus = new ResponseStatus();
        List<PaymentAccountVO> paymentAccountVOS =  paymentAccountService.getPaymentAccountList();

        return new ResponseData(responseStatus, paymentAccountVOS);
    }

}
