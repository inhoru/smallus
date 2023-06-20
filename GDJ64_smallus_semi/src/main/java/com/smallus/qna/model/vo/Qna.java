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
public class Qna {
	private String qnaId;
	private String memberId;
	private String classId;
	private String qnaTitle;
	private String qndContent;
	private Date qndRdate;
	private String qnaFinishYn;
	

}
