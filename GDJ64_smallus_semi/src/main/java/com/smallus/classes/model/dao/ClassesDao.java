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
import com.smallus.classes.model.vo.ClassIndex;
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
	//CLASS_ID, CATEGORY_TITLE, CLASS_TITLE, CLASS_UPLOAD_DATE, CLASS_PASS_DATE, CLASS_PASS_ID, CLASS_THUMBNAIL, CLASS_STATUS
	// builder 패턴을 이용해서 필요한 Class 객체만 사용
	public Classes getClass(ResultSet rs) throws SQLException {
		return Classes.builder().classId(rs.getString("CLASS_ID")).categoryTitle(rs.getString("CATEGORY_TITLE")).classTitle(rs.getString("CLASS_TITLE")).classUpLoadDate(rs.getDate("CLASS_UPLOAD_DATE"))
				.classPassDate(rs.getDate("CLASS_PASS_DATE")).classPassId(rs.getString("CLASS_PASS_ID")).classThumbnail(rs.getString("CLASS_THUMBNAIL")).classStatus(rs.getString("CLASS_STATUS")).build();
	}
	
	
	// builder 패턴을 이용해서 Classes 객체 가져오기
	public static Classes getClasses(ResultSet rs) throws SQLException {
		return Classes.builder().classId(rs.getString("CLASS_ID")).hostId(rs.getString("HOST_ID")).categoryId(rs.getString("CATEGORY_ID"))
				.classTitle(rs.getString("CLASS_TITLE")).classPersonnel(rs.getInt("CLASS_PERSONNEL")).classPrice(rs.getInt("CLASS_PRICE")).classAddress(rs.getString("CLASS_ADDRESS"))
				.classOffer(rs.getString("CLASS_OFFER")).classSupplies(rs.getString("CLASS_SUPPLIES")).classNotice(rs.getString("CLASS_NOTICE")).classDetail(rs.getString("CLASS_DETAIL"))
				.classStatus(rs.getString("CLASS_STATUS")).classUpLoadDate(rs.getDate("CLASS_UPLOAD_DATE")).classPassDate(rs.getDate("CLASS_PASS_DATE")).classPassId(rs.getString("CLASS_PASS_ID"))
				.classThumbnail(rs.getString("CLASS_THUMBNAIL")).categoryTitle(rs.getString("CATEGORY_TITLE")).build();
	}
	public static Classes getClasses2(ResultSet rs) throws SQLException {
		return Classes.builder().classId(rs.getString("CLASS_ID")).hostId(rs.getString("HOST_ID")).categoryId(rs.getString("CATEGORY_ID"))
				.classTitle(rs.getString("CLASS_TITLE")).classPersonnel(rs.getInt("CLASS_PERSONNEL")).classPrice(rs.getInt("CLASS_PRICE")).classAddress(rs.getString("CLASS_ADDRESS"))
				.classOffer(rs.getString("CLASS_OFFER")).classSupplies(rs.getString("CLASS_SUPPLIES")).classNotice(rs.getString("CLASS_NOTICE")).classDetail(rs.getString("CLASS_DETAIL"))
				.classStatus(rs.getString("CLASS_STATUS")).classUpLoadDate(rs.getDate("CLASS_UPLOAD_DATE")).classPassDate(rs.getDate("CLASS_PASS_DATE")).classPassId(rs.getString("CLASS_PASS_ID"))
				.classThumbnail(rs.getString("CLASS_THUMBNAIL")).build();
	}
	
	
	public ClassDetail getClassDetail(ResultSet rs) throws SQLException {
		return ClassDetail.builder().classDetailId(rs.getString("CLASS_DETAIL_ID")).classId(rs.getString("CLASS_ID"))
				.bookingTimeStart(rs.getDate("BOOKING_TIME_START")).bookingTimeEnd(rs.getDate("BOOKING_TIME_END"))
				.remainingPersonnel(rs.getInt("REMAINING_PERSONNEL"))
				.build();
	}

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
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	// Classes vo에서 toString override 한 객체를 가져온다.
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
	
	

	public Classes selectClassByClassId(Connection conn, String hostId, String classId){
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			Classes c=new Classes();
			try {
				pstmt=conn.prepareStatement(sql.getProperty("selectClassByClassId"));
				pstmt.setString(1, hostId);
				pstmt.setString(2, classId);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					c=getClasses(rs);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}return c;
		}
	
	
	public int updateRemainPersonnel(Connection conn, int updateRemainPersonnel, String classDetailId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("updateRemainPersonnel"));
			pstmt.setInt(1, updateRemainPersonnel);
			pstmt.setString(2, classDetailId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	public List<ClassIndex> newClassList(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ClassIndex> list=new ArrayList<ClassIndex>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("newClassList"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ClassIndex c=new ClassIndex();
				c.getClasses().setClassTitle(rs.getString("CLASS_TITLE"));
				c.getCategory().setCategoryTitle(rs.getString("CATEGORY_TITLE"));
				c.getClasses().setClassAddress(rs.getString("CLASS_ADDRESS"));
				c.getClasses().setClassThumbnail(rs.getString("CLASS_THUMBNAIL"));
				list.add(c);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public int updatedClassStatusByClassId(Connection conn, String classId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("updatedClassStatusByClassId"));
			pstmt.setString(1, classId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	public int deleteClassDetailBydetaiLid(Connection conn, String classDetailId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("deleteClassDetailBydetaiLid"));
			pstmt.setString(1, classDetailId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	public int InsertClassDetailByClassDetailPage(Connection conn, ClassDetail classdetail) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("InsertClassDetailByClassDetailPage"));
			pstmt.setString(1,classdetail.getClassId());
			pstmt.setDate(2, classdetail.getBookingTimeStart());
			pstmt.setDate(3, classdetail.getBookingTimeEnd());
			pstmt.setInt(4, classdetail.getRemainingPersonnel());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
}
