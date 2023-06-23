package com.smallus.payment.model.vo;

import com.smallus.classes.model.vo.ClassDetail;
import com.smallus.classes.model.vo.Classes;
import com.smallus.host.model.vo.Calc;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PaymentCalc {
	private Payment payment= new Payment();
	private ClassDetail classDetail = new ClassDetail();
	private Classes classes= new Classes();
}
//P.PAYMENT_ID, C.CLASS_TITLE, CD.BOOKING_TIME_START, CD.BOOKING_TIME_END, 
//P.CLASS_PERSONNEL, P.PAYMENT_DATE, P.MEMBER_ID, P.PAYMENT_STATUS 

//CATEGORY_TITLE, CLASS_TITLE, CLASS_ADDRESS, CLASS_ID, CLASS_DETAIL_ID,
//BOOKING_TIME_START, BOOKING_TIME_END,  CLASS_PERSONNEL, REMAINING_PERSONNEL, CLASS_PRICE