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
	
	private String commentConent;
	private Date commentRdate;
	private String commentId;
	
	private String sfId;
	
	private String sfRename;

}
