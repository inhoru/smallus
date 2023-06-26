package com.smallus.notice.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Notice {
	private String noticeId;
	private String hostId;
	private String noticeType;
	private String noticeTitle;
	private Date noticeRdate;
	private String noticeContent;
	
	private String noticeImageOrignal;
	private String noticeImageRename;
}
