package com.smallus.classes.model.dao;

import static com.smallus.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;

import com.smallus.classes.model.vo.ClassDetail;
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
	// selectClassInfo=SELECT * FROM CLASS WHERE CLASS_ID=? ORDER BY BOOKING_TIME_START
	public Classes selectClassByClassId(Connection conn, String classId) {
		Classes classData=new Classes();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectClassInfo"));
			pstmt.setString(1, classId);
			rs = pstmt.executeQuery();
			if(rs.next()) classData=oriDao.getClasses(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return classData;
	}
	
	// 클래스 db 등록
	// addClass=INSERT INTO CLASS VALUES('CLA'||SEQ_CLASS_ID.NEXTVAL,?,?,?,?,?,?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT,DEFAULT,?)
	public int addClass(Connection conn, Classes nc) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("addClass"));
			
			pstmt.setString(1, nc.getHostId());
			pstmt.setString(2, nc.getCategoryId());
			pstmt.setString(3, nc.getClassTitle());
			pstmt.setInt(4, nc.getClassPersonnel());
			pstmt.setInt(5, nc.getClassPrice());
			pstmt.setString(6, nc.getClassAddress());
			pstmt.setString(7, nc.getClassOffer());
			pstmt.setString(8, nc.getClassSupplies());
			pstmt.setString(9, nc.getClassNotice());
			pstmt.setString(10, nc.getClassDetail());
			pstmt.setString(11, nc.getClassThumbnail());
			
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	// 클래스디테일 db 등록
	// addClassScheduld=INSERT INTO CLASS_DATAIL VALUES('CLD'||SEQ_CLASS_DETAIL.NEXTVAL,(SELECT 'CLA'||SEQ_CLASS_ID.CURRVAL FROM DUAL),?,?,(SELECT CLASS_PERSONNEL WHERE CLASS_ID='CLA'||SEQ_CLASS_ID.CURRVAL))
	public int addClassSchedule(Connection conn, List<ClassDetail> schedule) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			for(ClassDetail sc:schedule) {
				pstmt=conn.prepareStatement(sql.getProperty("addClassSchedule"));
				pstmt.setDate(1, sc.getBookingTimeStart());
				pstmt.setDate(2, sc.getBookingTimeEnd());
				result=pstmt.executeUpdate();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
}
