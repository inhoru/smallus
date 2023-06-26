package com.smallus.Inquiry.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class InquiryComment {
	private String commentId;
	private String boardId;
	private String commentConent;
	private Date commentRdate;
}
