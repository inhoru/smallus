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
