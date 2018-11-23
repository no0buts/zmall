package cn.xx55xx.service.impl;

import cn.xx55xx.entity.BuyerEntity;
import cn.xx55xx.mapper.BuyerMapper;
import cn.xx55xx.model.BuyerReq;
import cn.xx55xx.service.BuyerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BuyerServiceImpl implements BuyerService {

    @Autowired
    private BuyerMapper buyerMapper;

    /**
     * 注册时ajax异步请求该账号是否已被注册,返回true表示可以注册
     * @param buyerAccount
     * @return
     */
    public Boolean isExistBuyerAccount(String buyerAccount) {
        if(buyerMapper.getBuyerByAccount(buyerAccount) == null) {
            return true;   //表示不存在，可以注册
        }else {
            return false;  //表示存在，不能再注册
        }
    }

    /**
     * 买家注册成功时插入买家信息
     * @param buyerReq
     */
    public void buyerRegist(BuyerReq buyerReq) {
        BuyerEntity buyerEntity = new BuyerEntity(null,
                buyerReq.getBuyerAccount(),
                buyerReq.getBuyerPassword(),
                buyerReq.getBuyerNickname(),
                buyerReq.getBuyerTruename(),
                buyerReq.getBuyerHeadimg(),
                buyerReq.getBuyerPhonenum());

        buyerMapper.insertBuyer(buyerEntity);
    }

    public BuyerEntity getBuyerByAccount(String buyerAccount) {
        return buyerMapper.getBuyerByAccount(buyerAccount);
    }


}
