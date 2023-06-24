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
public class Inquiry {
	private String boardId;
	private String memberId;
	private String boardType;
	private String boardTitle;
	private String boardContent;
	private Date boardRdate;
	private String boardCheck;
	
	private String comment_conent;
	private String commentRdate;
	private String comment_id;

}
