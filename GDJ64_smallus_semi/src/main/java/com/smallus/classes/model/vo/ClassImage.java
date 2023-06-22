package com.smallus.classes.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class ClassImage {
	
	private String sfId;
	private String classId; 
	private String sfOrigial;
	private String sfRename;

}
