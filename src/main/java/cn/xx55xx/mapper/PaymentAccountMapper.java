package cn.xx55xx.mapper;

import cn.xx55xx.entity.PaymentAccountEntity;

import java.util.List;

public interface PaymentAccountMapper {
    List<PaymentAccountEntity> getPaymentAccuntByBuyer(Integer buyerId);
}
