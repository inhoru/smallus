package com.smallus.payment.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Payment {
	private String paymentId;
	private String paymentType;
	private String classDetailId;
	private String couponId;
	private int amount;
	private int finalPrice;
	private Date paymentDate;
	private String paymentStatus;
	private String memberId;
}
