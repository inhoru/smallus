package com.smallus.classes.model.vo;

import java.sql.Date;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ClassDetail {
	private String classDetailId;
	private String classId;
	private Date bookingTimeStart;
	private Date bookingTimeEnd;
	private int remainingPersonnel;

	private  String bookingTimeStart1; 
	private  String bookingTimeEnd1; 
	
}
