package com.smallus.main.model.vo;

import com.smallus.Inquiry.model.vo.Faq;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Wish {
	private String wishId;
	private String memberId;
	private String classId;
	
}
