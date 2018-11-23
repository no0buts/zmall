package cn.xx55xx.service;

import cn.xx55xx.entity.BuyerEntity;
import cn.xx55xx.model.BuyerReq;

public interface BuyerService {

    /**
     * 注册/登录时ajax异步请求该账号是否已被注册
     * @param buyerAccount
     * @return
     */
    Boolean isExistBuyerAccount(String buyerAccount);

    /**
     * 注册成功后添加买家信息到数据库
     * @param buyerReq
     */
    void buyerRegist(BuyerReq buyerReq);


    /**
     * 买家登录根据用户账号查询用户对象
     * @param buyerAccount
     * @return
     */
    BuyerEntity getBuyerByAccount(String buyerAccount);


}
