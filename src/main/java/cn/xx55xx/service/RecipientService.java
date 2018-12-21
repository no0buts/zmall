package cn.xx55xx.service;

import cn.xx55xx.entity.RecipientEntity;
import cn.xx55xx.model.RecipientReq;

import java.util.List;

public interface RecipientService {

    /**
     * 找到某个买家的所有收件人
     * @param buyerId
     * @return
     */
    List<RecipientEntity> getRecipientByBuyerId(Integer buyerId);

    /**
     * 添加一个收件人
     * @param recipientReq
     */
    void addRecipient(RecipientReq recipientReq, Integer buyerId);

    /**
     * 编辑收件人
     * @param recipientReq
     */
    void updateRecipient(RecipientReq recipientReq);


    /**
     * 删除一个收件人
     * @param recipientId
     */
    void deleteRecipient(Integer recipientId);
}
