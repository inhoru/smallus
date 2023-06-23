package com.smallus.classes.model.service;

import static com.smallus.common.JDBCTemplate.getConnection;
import static com.smallus.common.JDBCTemplate.close;

import java.sql.Connection;

import com.smallus.classes.model.dao.ClassesDao2;
import com.smallus.classes.model.vo.Classes;

public class ClassService2 {
	
	private ClassesDao2 dao2=new ClassesDao2();
	
	public Classes selectClassByClassId(String classId){
		Connection conn=getConnection();
		Classes classData=dao2.selectClassByClassId(conn,classId);
		close(conn);
		return classData;
	}

}
