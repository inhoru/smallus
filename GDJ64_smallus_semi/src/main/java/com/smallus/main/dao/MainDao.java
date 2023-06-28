package com.smallus.main.dao;

import static com.smallus.classes.model.dao.ClassesDao.getClasses2;
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

import com.smallus.classes.model.vo.ClassIndex;
import com.smallus.classes.model.vo.Classes;
import com.smallus.payment.dao.PaymentDao;

public class MainDao {
	private Properties sql = new Properties();

	{
		String path = PaymentDao.class.getResource("/sql/main.properties").getPath();
		try {
			sql.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
//	public List<Classes> mainPage(Connection conn) {
//		List<Classes> list = new ArrayList<Classes>();
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		try {
//			pstmt = conn.prepareStatement(sql.getProperty("mainPage"));
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				list.add(getClasses2(rs));
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(rs);
//			close(pstmt);
//		}
//		return list;
//	}
	
	
//	public List<MainPayment> selectBestClass(Connection conn) {
//		List<MainPayment> list = new ArrayList<MainPayment>();
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		int totalPriceSum = 0;
//		try {
//			pstmt = conn.prepareStatement(sql.getProperty("selectBestClass"));
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				MainPayment p=new MainPayment();
//				p.getClasses().setClassTitle(rs.getString("CLASS_TITLE"));
//				p.getClasses().setClassAddress(rs.getString("CLASS_ADDRESS"));
//				p.getClasses().setClassThumbnail(rs.getString("CLASS_THUMBNAIL"));
//				p.getCategory().setCategoryTitle(rs.getString("CATEGORY_TITLE"));
//				p.getClasses().setClassId(rs.getString("CLASS_ID"));
//				list.add(p);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(rs);
//			close(pstmt);
//		}
//		return list;
//	}
	public List<ClassIndex> NewClassList(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ClassIndex> list=new ArrayList<ClassIndex>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("newClassList"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ClassIndex c=new ClassIndex();
				c.getClasses().setClassTitle(rs.getString("CLASS_TITLE"));
				c.getClasses().setClassAddress(rs.getString("ADDRESS"));
				c.getClasses().setClassThumbnail(rs.getString("CLASS_THUMBNAIL"));
				c.getCategory().setCategoryTitle(rs.getString("CATEGORY_TITLE"));
				c.getClasses().setClassId(rs.getString("CLASS_ID"));
				list.add(c);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
//	CLASS_TITLE, CLASS_ADDRESS, CLASS_THUMBNAIL, CATEGORY_TITLE, CLASS_ID
	public List<ClassIndex> wishClassList(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ClassIndex> list=new ArrayList<ClassIndex>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("wishClassList"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ClassIndex c=new ClassIndex();
				c.getClasses().setClassTitle(rs.getString("CLASS_TITLE"));
				c.getClasses().setClassAddress(rs.getString("ADDRESS"));
				c.getClasses().setClassThumbnail(rs.getString("CLASS_THUMBNAIL"));
				c.getCategory().setCategoryTitle(rs.getString("CATEGORY_TITLE"));
				c.getClasses().setClassId(rs.getString("CLASS_ID"));
				list.add(c);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public List<Classes> searchCategoriesCheck(Connection conn,String search){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Classes> list=new ArrayList<Classes>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchCategoriesCheck"));
			pstmt.setString(1,"%"+search+"%");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(getClasses2(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	
	}
	public List<Classes> searchCategories(Connection conn,String search,int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Classes> list=new ArrayList<Classes>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchCategories"));
			pstmt.setString(1,"%"+search+"%");
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				
				list.add(getClass(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	
	}
	public List<Classes> searchAddres(Connection conn,String search,int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Classes> list=new ArrayList<Classes>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchAddres"));
			pstmt.setString(1,"%"+search+"%");
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(getClass(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	
	}
	public int searchCategoriesCount(Connection conn,String search) {
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      int totalData=0;
	      try {
	         //SELECT COUNT(CLASS_ID) FROM CLASS WHERE CLASS_TITLE LIKE ?
	         pstmt=conn.prepareStatement(sql.getProperty("searchCategoriesCount"));
	         pstmt.setString(1,"%"+search+"%");
	         rs=pstmt.executeQuery();
	         if(rs.next()) 
	            totalData=rs.getInt(1);
	      }catch(SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	      }return totalData;
	   }
	public int searchAddresCount(Connection conn,String search) {
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      int totalData=0;
	      try {
	         //SELECT COUNT(CLASS_ID) FROM CLASS WHERE CLASS_TITLE LIKE ?
	         pstmt=conn.prepareStatement(sql.getProperty("searchAddresCount"));
	         pstmt.setString(1,"%"+search+"%");
	         rs=pstmt.executeQuery();
	         if(rs.next()) 
	            totalData=rs.getInt(1);
	      }catch(SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	      }return totalData;
	   }
	public static Classes getClass(ResultSet rs) throws SQLException {
		return Classes.builder().classId(rs.getString("CLASS_ID")).categoryTitle(rs.getString("CATEGORY_TITLE")).classTitle(rs.getString("CLASS_TITLE")).classUpLoadDate(rs.getDate("CLASS_UPLOAD_DATE"))
				.classPassDate(rs.getDate("CLASS_PASS_DATE")).classPassId(rs.getString("CLASS_PASS_ID")).classThumbnail(rs.getString("CLASS_THUMBNAIL")).classStatus(rs.getString("CLASS_STATUS")).build();
		
	}
}
