package cn.xx55xx.mapper;

import cn.xx55xx.entity.BuyerEntity;

public interface BuyerMapper {

    /**
     * 通过买家账号查找买家
     * @param buyer_account
     * @return
     */
    BuyerEntity getBuyerByAccount(String buyer_account);

    /**
     * 插入一条买家记录
     * @param buyerEntity
     */
    void insertBuyer(BuyerEntity buyerEntity);

}
