package cn.xx55xx.service.impl;

import cn.xx55xx.entity.RecipientEntity;
import cn.xx55xx.mapper.RecipientMapper;
import cn.xx55xx.model.RecipientIdDefaultReq;
import cn.xx55xx.model.RecipientReq;
import cn.xx55xx.service.RecipientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecipientServiceImpl implements RecipientService {


    @Autowired
    private RecipientMapper recipientMapper;


    public List<RecipientEntity> getRecipientByBuyerId(Integer buyerId) {
        List<RecipientEntity> recipientEntities = recipientMapper.getRecipientByBuyerId(buyerId);
        return recipientEntities;
    }

    public void deleteRecipient(Integer recipientId) {
        recipientMapper.deleteRecipient(recipientId);
    }

    public void updateDefaultRecipient(RecipientIdDefaultReq recipientIdDefaultReq) {
        String recipientDefaultId = recipientIdDefaultReq.getRecipientDefaultId();
        String recipientNewId = recipientIdDefaultReq.getRecipientNewId();
        recipientMapper.updateDefaultRecipient(recipientDefaultId);
        recipientMapper.updateNewDefaultRecipient(recipientNewId);
    }

    public void addRecipient(RecipientReq recipientReq, Integer buyerId) {
        RecipientEntity recipientEntity = new RecipientEntity();
        recipientEntity.setBuyerId(buyerId);
        recipientEntity.setRecipientName(recipientReq.getRecipientName());
        recipientEntity.setRecipientPhonenum(recipientReq.getRecipientPhonenum());
        recipientEntity.setRecipientAddress(recipientReq.getRecipientAddress());
        recipientEntity.setRecipientAddressDetail(recipientReq.getRecipientAddressDetail());
        recipientEntity.setRecipientDefault(recipientReq.getRecipientDefault());

        recipientMapper.insertRecipient(recipientEntity);
    }

    public void updateRecipient(RecipientReq recipientReq) {
        RecipientEntity recipientEntity = new RecipientEntity();
        recipientEntity.setRecipientId(recipientReq.getRecipientId());
        recipientEntity.setRecipientName(recipientReq.getRecipientName());
        recipientEntity.setRecipientPhonenum(recipientReq.getRecipientPhonenum());
        recipientEntity.setRecipientAddress(recipientReq.getRecipientAddress());
        recipientEntity.setRecipientAddressDetail(recipientReq.getRecipientAddressDetail());
        //recipientEntity.setRecipientDefault(recipientReq.getRecipientDefault());

        recipientMapper.updateRecipient(recipientEntity);
    }


}
