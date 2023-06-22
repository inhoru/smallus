package com.smallus.classes.model.dao;

import static com.smallus.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.smallus.classes.model.vo.Classes;

public class ClassesDao2 {

	private ClassesDao oriDao=new ClassesDao();
	
	private Properties sql=new Properties(); 
	
	{
		String path= ClassesDao2.class.getResource("/sql/class.properties").getPath();
		try {
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	// 상세페이지 전용. classId로 Classes 단일정보 가져오기
	// selectClassInfo=SELECT * FROM CLASS WHERE CLASS_ID=?
	public Classes selectClassByClassId(Connection conn, String classId) {
		Classes classData=new Classes();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectClassInfo"));
			pstmt.setString(1, classId);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return classData;
	}
}
