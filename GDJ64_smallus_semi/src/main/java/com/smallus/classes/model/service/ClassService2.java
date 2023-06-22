package com.smallus.classes.model.service;

import static com.smallus.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.smallus.classes.model.dao.ClassesDao2;

public class ClassService2 {
	
	private ClassesDao2 dao=new ClassesDao2();
	
	public List<Class> selectClassByClassId(String classId){
		Connection conn=getConnection();
		List<Class> list=dao.
	}

}
