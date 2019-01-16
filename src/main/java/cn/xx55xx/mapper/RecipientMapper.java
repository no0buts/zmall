package cn.xx55xx.mapper;

import cn.xx55xx.entity.RecipientEntity;

import java.util.List;

public interface RecipientMapper {
    List<RecipientEntity> getRecipientByBuyerId(Integer buyerId);
    void insertRecipient(RecipientEntity recipientEntity);
    void updateRecipient(RecipientEntity recipientEntity);
    void deleteRecipient(Integer reipientId);

    void updateDefaultRecipient(String recipientDefaultId);//将之前的默认收件人recipient_default字段值改为0
    void updateNewDefaultRecipient(String recipientNewId);//将新的默认收件人recipient_default字段值改为1

    RecipientEntity getRecipientById(Integer recipientId);
}
