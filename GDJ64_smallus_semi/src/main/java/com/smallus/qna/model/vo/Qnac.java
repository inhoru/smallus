package com.smallus.qna.model.vo;

import java.util.Date;

import com.smallus.classes.model.vo.Category;
import com.smallus.classes.model.vo.Classes;
import com.smallus.member.model.vo.Wishlist;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Qnac {
	private String qnacId;
	private String qnaId;
	private String hostId;
	private String qnacContent;
	private Date qnacRdate;
	

}
