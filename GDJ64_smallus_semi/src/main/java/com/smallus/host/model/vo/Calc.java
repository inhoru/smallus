package com.smallus.host.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Calc {
	private String calcId;
	private String hostId;
	private String calcStatus;
	private Date calcReqDate;
	private Date calcPassDate;
	private int calcPrice;
	private int calcFinalPrice;
}

//CALC_ID	VARCHAR2(30) PRIMARY KEY,
//HOST_ID	VARCHAR2(100) REFERENCES HOST(HOST_ID) ON DELETE CASCADE,
//CALC_STATUS	VARCHAR2(30) DEFAULT '정산 대기' CHECK(CALC_STATUS IN('정산 대기','처리 중','정산 완료')),
//CALC_REQ_DATE DATE,
//CALC_PASS_DATE	DATE,
//CALC_PRICE	NUMBER	NOT NULL,
//CALC_FINAL_PRICE NUMBER