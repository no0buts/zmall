package cn.xx55xx.service.impl;

import cn.xx55xx.entity.PaymentAccountEntity;
import cn.xx55xx.mapper.PaymentAccountMapper;
import cn.xx55xx.model.PaymentAccountVO;
import cn.xx55xx.service.PaymentAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PaymentAccountServiceImpl implements PaymentAccountService {
    Integer buyerId = 100001;

    @Autowired
    private PaymentAccountMapper paymentAccountMapper;

    public List<PaymentAccountVO> getPaymentAccountList() {
        List<PaymentAccountEntity> paymentAccountEntities = paymentAccountMapper.getPaymentAccuntByBuyer(buyerId);
        List<PaymentAccountVO> paymentAccountVOList = mapPaymentAccount(paymentAccountEntities);


        return paymentAccountVOList;
    }

    private List<PaymentAccountVO> mapPaymentAccount(List<PaymentAccountEntity> entityList) {
        List<PaymentAccountVO> paymentVoList = new ArrayList<PaymentAccountVO>();
        for(PaymentAccountEntity paymentAccountEntity : entityList) {
            PaymentAccountVO paymentAccountVO = new PaymentAccountVO(paymentAccountEntity.getAccountId(),
                    paymentAccountEntity.getAccountNumber(), paymentAccountEntity.getAccountType(),
                    paymentAccountEntity.getPaymentPassword(), paymentAccountEntity.getBuyerId(),
                    paymentAccountEntity.getAccountBalance());
            paymentVoList.add(paymentAccountVO);
        }
        return paymentVoList;
    }
}
