package com.smallus.Inquiry.model.vo;

import com.smallus.classes.model.vo.Category;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Faq {
	private String faqId;
	private String hostId;
	private String faqTitle;
	private String faqContent;
	private String faqType;
}
