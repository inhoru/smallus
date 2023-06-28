package com.smallus.review.model.vo;

import com.smallus.classes.model.vo.Category;
import com.smallus.classes.model.vo.ClassDetail;
import com.smallus.classes.model.vo.Classes;
import com.smallus.payment.model.vo.Payment;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReviewHost {
	private Review review= new Review();
	private Payment payment=new Payment();
	private Classes classes = new Classes();
	private Category category = new Category();
	private ClassDetail classDetail = new ClassDetail();
}
