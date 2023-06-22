package com.smallus.member.model.vo;

import com.smallus.classes.model.vo.ClassDetail;
import com.smallus.classes.model.vo.Classes;
import com.smallus.payment.model.vo.Payment;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Member {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberPhone;
	private String memberEmail;
	private String memberConsent;
	private String memberImg;
	private String memberNickname;
	private String memberSt;
	
	private Classes classes;
    private Payment payment;
    private ClassDetail classDetail;

}
