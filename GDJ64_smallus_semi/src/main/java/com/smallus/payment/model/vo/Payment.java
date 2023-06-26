package com.smallus.payment.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Payment implements Serializable {
	private String paymentId;
	private String classDetailId;
	private String memberId;
	private String couponId;
	private int price;
	private int classPersonnel;
	private int TotalPrice;
	private String impUid;
	private String request;
	private String paymentType;
	private Date paymentDate;
	private String paymentStatus;
	
	private String classId;
	private String classTitle;
	private Date bookingTimeStart;
	private Date bookingTimeEnd; 
	
	private Date createdDate;
	private Date expiredDated;
	
	
	
	
//	PAYMENT_ID	VARCHAR2(30) PRIMARY KEY,	
//	CLASS_DETAIL_ID	VARCHAR2(20)	NOT NULL	REFERENCES CLASS_DETAIL(CLASS_DETAIL_ID),
//    MEMBER_ID VARCHAR2(16) REFERENCES MEMBER(MEMBER_ID),
//	COUPON_ID	VARCHAR2(100) REFERENCES COUPON_TYPE(COUPON_ID),
//	PRICE	NUMBER	NOT NULL,
//    CLASS_PERSONNEL NUMBER,
//	TOTAL_PRICE	NUMBER	NOT NULL,    
//	IMP_UID VARCHAR2(30),
//	HOST_ID VARCHAR2(100) REFERENCES HOST(HOST_ID),
//    REQUEST VARCHAR2(2000),    
//    PAYMENT_TYPE	VARCHAR2(20) REFERENCES PAYMENT_TYPE(PAYMENT_TYPE),
//    PAYMENT_DATE DATE DEFAULT SYSDATE,
//	PAYMENT_STATUS	VARCHAR2(20) NOT NULL
	
	
//	P.PAYMENT_ID, C.CLASS_TITLE, CD.BOOKING_TIME_START, CD.BOOKING_TIME_END, P.MEMBER_ID
	@Override
	public String toString() {
		return paymentId+","+classTitle+","+bookingTimeStart+","+bookingTimeEnd+","+classPersonnel+","+memberId;
	}

}
