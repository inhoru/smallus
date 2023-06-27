package com.smallus.classes.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ClassIndex {
	private Classes classes= new Classes();
	private Category category =new Category();
}
