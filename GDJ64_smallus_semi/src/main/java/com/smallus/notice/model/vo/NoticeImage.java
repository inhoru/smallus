package com.smallus.notice.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class NoticeImage {
	private String noticeImageId;
	private String noticeId;
	private String noticeImageOrignal;
	private String noticeImageRename;
}
