package com.smallus.payment.model.vo;

import com.smallus.classes.model.vo.Category;
import com.smallus.classes.model.vo.ClassDetail;
import com.smallus.classes.model.vo.Classes;
import com.smallus.host.model.vo.Host;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PaymentInfo {
	 private Classes classes = new Classes();
	    private ClassDetail classDetail = new ClassDetail();
	    private Category category=new Category();
	 private Host host=new Host();

}
//SELECT CATEGORY_TITLE, CLASS_TITLE, CLASS_ADDRESS, CLASS_ID, CLASS_DETAIL_ID, BOOKING_TIME_START, BOOKING_TIME_END, REMAINING_PERSONNEL, CLASS_PRICE 
//FROM CLASS_DETAIL LEFT JOIN CLASS USING(CLASS_ID)
//LEFT JOIN CATEGORY USING(CATEGORY_ID) WHERE CLASS_DETAIL_ID='CLD1004' AND CLASS_STATUS='Y';