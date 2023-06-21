package com.smallus.notice.model.vo;

import com.smallus.host.model.vo.Host;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Notice {
	private String hostId;
	private String noticeType;
	private String noticeTitle;
	private String noticeContent;
}
