package com.smallus.classes.model.service;

import static com.smallus.common.JDBCTemplate.close;
import static com.smallus.common.JDBCTemplate.commit;
import static com.smallus.common.JDBCTemplate.getConnection;
import static com.smallus.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.smallus.classes.model.dao.ClassesDao2;
import com.smallus.classes.model.vo.ClassDetail;
import com.smallus.classes.model.vo.Classes;

public class ClassService2 {
	
	private ClassesDao2 dao2=new ClassesDao2();
	
	public Classes selectClassByClassId(String classId){
		Connection conn=getConnection();
		Classes classData=dao2.selectClassByClassId(conn,classId);
		close(conn);
		return classData;
	}
	
	public int addClass(Classes newClass) {
		Connection conn=getConnection();
		int result=dao2.addClass(conn,newClass);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int addClassSchedule(List<ClassDetail> schedule) {
		Connection conn=getConnection();
		int result=dao2.addClassSchedule(conn,schedule);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
}
