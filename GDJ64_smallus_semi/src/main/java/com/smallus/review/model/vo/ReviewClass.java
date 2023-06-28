package com.smallus.review.model.vo;

import com.smallus.classes.model.vo.Classes;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReviewClass {
	private Classes classes= new Classes();
}
