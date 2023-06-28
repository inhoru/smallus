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
	// selectClassInfo=SELECT * FROM CLASS JOIN HOST USING(HOST_ID) JOIN CATEGORY USING(CATEGORY_ID) WHERE CLASS_ID=?
	public Classes selectClassByClassId(Connection conn, String classId) {
		Classes classData=new Classes();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectClassInfo"));
			pstmt.setString(1, classId);
			rs = pstmt.executeQuery();
			if(rs.next()) classData=getClasses(rs);
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
				System.out.println("sc.getBookingTimeEnd() : "+sc.getBookingTimeEnd());
				System.out.println("getTime : "+sc.getBookingTimeEnd().getTime());
//				System.out.println("getHours : "+sc.getBookingTimeEnd().getHours()); 확인하고 싶었으나 사용시 오류)
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
	
	// builder 패턴을 이용해서 Classes 객체 가져오기
		public static Classes getClasses(ResultSet rs) throws SQLException {
			return Classes.builder().classId(rs.getString("CLASS_ID")).hostId(rs.getString("HOST_ID")).categoryId(rs.getString("CATEGORY_ID"))
					.classTitle(rs.getString("CLASS_TITLE")).classPersonnel(rs.getInt("CLASS_PERSONNEL")).classPrice(rs.getInt("CLASS_PRICE")).classAddress(rs.getString("CLASS_ADDRESS"))
					.classOffer(rs.getString("CLASS_OFFER")).classSupplies(rs.getString("CLASS_SUPPLIES")).classNotice(rs.getString("CLASS_NOTICE")).classDetail(rs.getString("CLASS_DETAIL"))
					.classStatus(rs.getString("CLASS_STATUS")).classUpLoadDate(rs.getDate("CLASS_UPLOAD_DATE")).classPassDate(rs.getDate("CLASS_PASS_DATE")).classPassId(rs.getString("CLASS_PASS_ID"))
					.classThumbnail(rs.getString("CLASS_THUMBNAIL")).categoryTitle(rs.getString("CATEGORY_TITLE")).hostNickname(rs.getString("HOST_NICKNAME")).build();
		}
	
}
