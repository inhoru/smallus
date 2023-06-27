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
	private String paymentType;
	private Date paymentDate;
	private String paymentStatus;
	
	private String classId;
	private String classTitle;
	private Date bookingTimeStart;
	private Date bookingTimeEnd; 
	
	private Date createdDate;
	private Date expiredDated;
	
	
	
	
	@Override
	public String toString() {
		return paymentId+","+classTitle+","+bookingTimeStart+","+bookingTimeEnd+","+classPersonnel+","+memberId;
	}

}
