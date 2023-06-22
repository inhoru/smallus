package com.smallus.review.model.vo;

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
public class Review {
	private String reviewId;
	private String paymentId;
	private String reviewTitle;
	private String reviewContent;
	private int reviewRating;
	private Date reviewDate;

}
