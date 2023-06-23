package com.smallus.classes.model.dao;

import static com.smallus.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.smallus.classes.model.vo.ClassDetail;
import com.smallus.classes.model.vo.Classes;
import com.smallus.payment.dao.PaymentDao;

public class ClassesDao {

	private Properties sql = new Properties();

	{
		String path = PaymentDao.class.getResource("/sql/class.properties").getPath();
		try {
			sql.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	// builder 패턴을 이용해서 필요한 Class 객체만 사용
	public Classes getClass(ResultSet rs) throws SQLException {
		return Classes.builder().classId(rs.getString("CLASS_ID")).categoryTitle(rs.getString("CATEGORY_TITLE")).classTitle(rs.getString("CLASS_TITLE")).classUpLoadDate(rs.getDate("CLASS_UPLOAD_DATE"))
				.classPassDate(rs.getDate("CLASS_PASS_DATE")).classPassId(rs.getString("CLASS_PASS_ID")).classThumbnail(rs.getString("CLASS_THUMBNAIL")).build();
	}
	
	
	// builder 패턴을 이용해서 Classes 객체 가져오기
	public static Classes getClasses(ResultSet rs) throws SQLException {
		return Classes.builder().classId(rs.getString("CLASS_ID")).hostId(rs.getString("HOST_ID")).categoryId(rs.getString("CATEGORY_ID"))
				.classTitle(rs.getString("CLASS_TITLE")).classPersonnel(rs.getInt("CLASS_PERSONNEL")).classPrice(rs.getInt("CLASS_PRICE")).classAddress(rs.getString("CLASS_ADDRESS"))
				.classOffer(rs.getString("CLASS_OFFER")).classSupplies(rs.getString("CLASS_SUPPLIES")).classNotice(rs.getString("CLASS_NOTICE")).classDetail(rs.getString("CLASS_DETAIL"))
				.classStatus(rs.getString("CLASS_STATUS")).classUpLoadDate(rs.getDate("CLASS_UPLOAD_DATE")).classPassDate(rs.getDate("CLASS_PASS_DATE")).classPassId(rs.getString("CLASS_PASS_ID"))
				.classThumbnail(rs.getString("CLASS_THUMBNAIL")).build();
	}
	
	
	public ClassDetail getClassDetail(ResultSet rs) throws SQLException {
		return ClassDetail.builder().classDetailId(rs.getString("CLASS_DETAIL_ID")).classId(rs.getString("CLASS_ID"))
				.bookingTimeStart(rs.getDate("BOOKING_TIME_START")).bookingTimeEnd(rs.getDate("BOOKING_TIME_END"))
				.build();
	}

	//selectClassDetailByClassId=SELECT * FROM CLASS_DETAIL WHERE CLASS_ID=?
	public List<ClassDetail> selectClassDetailByClassId(Connection conn, String classId) {
		List<ClassDetail> list = new ArrayList<ClassDetail>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectClassDetailByClassId"));
			pstmt.setString(1, classId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(getClassDetail(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	// Classes vo에서 toString override 한 객체를 가져온다.
	
	//selectAllClassesByHostId=SELECT * FROM (SELECT ROWNUM AS RNUM, C.* FROM 
	//(SELECT CLASS_ID, CATEGORY_TITLE, CLASS_TITLE, CLASS_UPLOAD_DATE, CLASS_PASS_DATE, CLASS_PASS_ID, CLASS_THUMBNAIL 
	//FROM CLASS LEFT JOIN CATEGORY USING(CATEGORY_ID) WHERE HOST_ID=? )C) WHERE RNUM BETWEEN ? AND ?
	
	//return classId+","+categoryTitle+","+classTitle+","+classUpLoadDate+","+classPassDate+","+classPassId+","+classThumbnail;
	public List<Classes> selectAllClassesByHostId(Connection conn, String hostId, int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Classes> list=new ArrayList<Classes>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectAllClassesByHostId"));
			pstmt.setString(1, hostId);
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Classes c=new Classes();
				list.add(getClass(rs));
//				c.setClassId(rs.getString("CLASS_ID"));
//				c.setCategoryTitle(rs.getString("CATEGORY_TITLE"));
//				c.setClassTitle(rs.getString("CLASS_TITLE"));
//				c.setClassUpLoadDate(rs.getDate("CLASS_UPLOAD_DATE"));
//				c.setClassPassDate(rs.getDate("CLASS_PASS_DATE"));
//				c.setClassPassId(rs.getString("CLASS_PASS_ID"));
//				c.setClassThumbnail(rs.getString("CLASS_THUMBNAIL"));
//				list.add(c);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	// Classes vo에서 toString override 한 객체를 가져온다.
	// selectClassesByHostId=SELECT CLASS_ID, CATEGORY_TITLE, CLASS_TITLE, CLASS_UPLOAD_DATE, CLASS_PASS_DATE, CLASS_PASS_ID, CLASS_THUMBNAIL 
	// FROM CLASS LEFT JOIN CATEGORY USING(CATEGORY_ID) WHERE HOST_ID=? AND CLASS_PASS_ID=?
	// return classId+","+categoryTitle+","+classTitle+","+classUpLoadDate+","+classPassDate+","+classPassId+","+classThumbnail;
	
	public List<Classes> selectClassListByPassStatus(Connection conn, String hostId, String passStatus,int cPage, int numPerpage) {
		List<Classes> list = new ArrayList<Classes>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectClassListByPassStatus"));
			pstmt.setString(1, hostId);
			pstmt.setString(2, passStatus+"%");
			pstmt.setInt(3, (cPage-1)*numPerpage+1);
			pstmt.setInt(4, cPage*numPerpage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Classes c = new Classes();
				list.add(getClass(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	
	//selectClassesByHostId=SELECT * FROM CLASS WHERE HOST_ID=?
	public List<Classes> selectClassesByHostId(Connection conn, String hostId){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Classes> list=new ArrayList<Classes>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectClassesByHostId"));
			pstmt.setString(1, hostId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Classes c=new Classes();
				list.add(getClasses(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	// 페이징 처리를 위한 totalData 구하는 로직
	//selectClassCount=SELECT COUNT(*) AS RN FROM CLASS
	public int selectClassCount(Connection conn, String hostId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectClassCount"));
			pstmt.setString(1, hostId);
			rs=pstmt.executeQuery();
			if(rs.next()) result=rs.getInt("RN");
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	
	//selectClassCountByStatus=SELECT COUNT(*) FROM CLASS WHERE HOST_ID=? AND CLASS_PASS_ID LIKE ?
	public int selectClassCountByStatus(Connection conn, String hostId, String passStatus) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectClassCountByStatus"));
			pstmt.setString(1, hostId);
			pstmt.setString(2, passStatus+"%");
			rs=pstmt.executeQuery();
			if(rs.next()) result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
//	selectClassByCalendar=SELECT CLASS_TITLE, BOOKING_TIME_START, BOOKING_TIME_END, MEMBER_ID, P.CLASS_PERSONNEL 
//	FROM CLASS JOIN CLASS_DETAIL USING(CLASS_ID) JOIN PAYMENT P USING(CLASS_DETAIL_ID) WHERE HOST_ID=?
	public List<Classes> selectClassByCalendar(Connection conn, String hostId){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Classes> list=new ArrayList<Classes>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectClassByCalendar"));
			pstmt.setString(1, hostId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Classes c=new Classes();
				list.add(getClasses(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	
	
}
