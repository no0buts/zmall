package cn.xx55xx.mapper;

import cn.xx55xx.entity.RecipientEntity;

import java.util.List;

public interface RecipientMapper {
    List<RecipientEntity> getRecipientByBuyerId(Integer buyerId);
    void insertRecipient(RecipientEntity recipientEntity);
    void updateRecipient(RecipientEntity recipientEntity);
    void deleteRecipient(Integer reipientId);
}
