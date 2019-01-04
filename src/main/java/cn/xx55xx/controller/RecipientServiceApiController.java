package cn.xx55xx.controller;


import cn.xx55xx.entity.RecipientEntity;
import cn.xx55xx.manager.RedisCacheManager;
import cn.xx55xx.model.*;
import cn.xx55xx.service.RecipientService;
import cn.xx55xx.util.PhoneFormatCheckUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class RecipientServiceApiController {

    private final static String NULL_PARAM = "NULL_PARAM_MSG";
    private final static String NULL_PARAM_MSG = "收件人信息必须填写完整！";
    private final static String PHONENUM_ERROR = "PHONENUM_ERROR_MSG";
    private final static String PHONENUM_ERROR_MSG = "手机号码有误！";



    @Autowired
    private RecipientService recipientService;

    @Autowired
    private RedisCacheManager redisCacheManager;


    @RequestMapping("/api/getRedisValue")
    public @ResponseBody ResponseData getRedisValue(
            @RequestBody RedisValueReq recipientReq) {
        ResponseStatus responseStatus = new ResponseStatus();
        Object redisValue = redisCacheManager.get(recipientReq.getRedisKey());
        return new ResponseData(responseStatus, redisValue);
    }

    @RequestMapping("/api/setRedisValue")
    public @ResponseBody ResponseData setRedisValue(
            @RequestBody RedisValueReq recipientReq) {
        ResponseStatus responseStatus = new ResponseStatus();
        redisCacheManager.set(recipientReq.getRedisKey(), recipientReq.getRedisValue());
        return new ResponseData(responseStatus, redisCacheManager.get(recipientReq.getRedisKey()));
    }



    //添加收件人
    @RequestMapping("/api/addRecipient")
    public @ResponseBody ResponseData addRecipient(
            @RequestBody RecipientReq recipientReq) {
        ResponseStatus responseStatus = new ResponseStatus();
        Integer buyerId = 100001;
        recipientService.addRecipient(recipientReq, buyerId);

        return new ResponseData(responseStatus, null);
    }


    //获取全部收件人
    @RequestMapping("/api/getAllRecipient")
    public @ResponseBody ResponseData getAllRecipientJson() {
        ResponseStatus responseStatus = new ResponseStatus();
        Integer buyerId = 100001;
        List<RecipientEntity> recipientEntities = recipientService.getRecipientByBuyerId(buyerId);

        return new ResponseData(responseStatus, recipientEntities);
    }


    //更新某个收件人
    @RequestMapping("/api/updateRecipient")
    public @ResponseBody ResponseData updateRecipient(
            @RequestBody RecipientReq recipientReq) {
        ResponseStatus respStatus = new ResponseStatus();

        if (StringUtils.isNotBlank(recipientReq.getRecipientName()) && StringUtils.isNotBlank(recipientReq.getRecipientPhonenum())
            && StringUtils.isNotBlank(recipientReq.getRecipientAddress()) && StringUtils.isNotBlank(recipientReq.getRecipientAddressDetail())) {
            if (PhoneFormatCheckUtils.isPhoneLegal(recipientReq.getRecipientPhonenum())) {

            } else {
                respStatus.setStatus(false, PHONENUM_ERROR, PHONENUM_ERROR_MSG);
            }
        } else {
            respStatus.setStatus(false, NULL_PARAM, NULL_PARAM_MSG);
        }

        Integer buyerId = 100001;
        recipientService.updateRecipient(recipientReq);
        return new ResponseData(respStatus, null);
    }

    //删除某个收件人
    @RequestMapping("/api/deleteRecipient")
    public @ResponseBody ResponseData deleteRecipient (Integer recipientId) {
        ResponseStatus responseStatus = new ResponseStatus();

        recipientService.deleteRecipient(recipientId);
        return new ResponseData(responseStatus, null);

    }

    //改变默认收件人
    @RequestMapping("/api/updateDefaultRecipient")
    public @ResponseBody ResponseData updateDefaultRecipient (
            @RequestBody RecipientIdDefaultReq recipientIdDefaultReq) {
        ResponseStatus responseStatus = new ResponseStatus();
        recipientService.updateDefaultRecipient(recipientIdDefaultReq);

        return new ResponseData(responseStatus, null);
    }

}
