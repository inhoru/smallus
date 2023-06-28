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
	
	public List<Classes> searchCategories(Connection conn,String search,int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Classes> list=new ArrayList<Classes>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchCategories"));
			pstmt.setString(1,"%"+search+"%");
			pstmt.setString(2,"%"+search+"%");
			pstmt.setInt(3, (cPage-1)*numPerpage+1);
			pstmt.setInt(4, cPage*numPerpage);
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
	         pstmt=conn.prepareStatement(sql.getProperty("searchCategoriesCount"));
	         pstmt.setString(1,"%"+search+"%");
	         pstmt.setString(2,"%"+search+"%");
	         rs=pstmt.executeQuery();
	         if(rs.next()) 
	            totalData=rs.getInt(1);
	      }catch(SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	      }return totalData;
	   }
	
	public  Classes getClass(ResultSet rs) throws SQLException {
		return Classes.builder().classId(rs.getString("CLASS_ID")).categoryTitle(rs.getString("CATEGORY_TITLE")).classTitle(rs.getString("CLASS_TITLE"))
				.classThumbnail(rs.getString("CLASS_THUMBNAIL")).classAddress(rs.getString("ADDRESS")).build();
	}
	
	public List<ClassIndex> selectNewClassByCategory(Connection conn, String categoryId){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ClassIndex> list=new ArrayList<ClassIndex>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectNewClassByCategory"));
			pstmt.setString(1,categoryId);
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
	public List<ClassIndex> selectBestClassByCategory(Connection conn, String categoryTitle){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ClassIndex> list=new ArrayList<ClassIndex>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectBestClassByCategory"));
			pstmt.setString(1,categoryTitle);
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
}
