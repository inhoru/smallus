package com.smallus.payment.model.vo;

import com.smallus.classes.model.vo.ClassDetail;
import com.smallus.classes.model.vo.Classes;
import com.smallus.coupon.model.vo.Coupon;
import com.smallus.host.model.vo.Host;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PaymentType {
	private String paymentType;
	private String paymentName;
}
