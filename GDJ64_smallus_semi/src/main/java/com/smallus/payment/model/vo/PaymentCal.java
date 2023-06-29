package com.smallus.payment.model.vo;

import com.smallus.classes.model.vo.ClassDetail;
import com.smallus.classes.model.vo.Classes;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PaymentCal {
	private Payment payment= new Payment();
	private ClassDetail classDetail = new ClassDetail();
	private Classes classes=new Classes();	
}
