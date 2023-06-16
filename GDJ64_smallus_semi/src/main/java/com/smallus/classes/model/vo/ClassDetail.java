package com.smallus.classes.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ClassDetail {
	private String ClassDetaleId;
	private Class ClassId;
	private Date BookingTimeStart;
	private Date BookingTimeEnd;

}
