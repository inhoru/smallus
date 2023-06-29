package com.smallus.main.model.vo;

import java.io.Serializable;

import com.smallus.Inquiry.model.vo.Faq;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Wish implements Serializable{
	private String wishId;
	private String memberId;
	private String classId;
	
}
