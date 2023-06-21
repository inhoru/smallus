package com.smallus.host.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Host {
	private String hostId;
	private String hostPw;
	private String hostName;
	private String hostPhone;
	private String hostHomephone;
	private String hostEmail;
	private String hostConsent;
	private String hostImg;
	private String hostNickname;
	private String hostSt;
	private String hostAccountBank;
	private String hostAccount;
	private String hostAccountName;	
	
}