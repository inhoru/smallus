package com.smallus.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Notifications {
	private String notiflId;
	private String hostId;
	private String memberId;
	private String typeTitle;
	private String notiflMessage;
	private	Date createdAt;
	private String notiflType;
	
}
