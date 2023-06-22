package com.smallus.coupon.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Coupon {
	private String couponId;
	private String couponName;
	private int couponPrice;
	private Date created_date;
	private Date expiredDate;
}
