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
