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
import com.smallus.payment.model.vo.MainPayment;

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
//	public List<ClassIndex> NewClassList(Connection conn){
//		PreparedStatement pstmt=null;
//		ResultSet rs=null;
//		List<ClassIndex> list=new ArrayList<ClassIndex>();
//		try {
//			pstmt=conn.prepareStatement(sql.getProperty("newClassList"));
//			rs=pstmt.executeQuery();
//			while(rs.next()) {
//				ClassIndex c=new ClassIndex();
//				c.getClasses().setClassTitle(rs.getString("CLASS_TITLE"));
//				c.getClasses().setClassAddress(rs.getString("CLASS_ADDRESS"));
//				c.getClasses().setClassThumbnail(rs.getString("CLASS_THUMBNAIL"));
//				c.getCategory().setCategoryTitle(rs.getString("CATEGORY_TITLE"));
//				c.getClasses().setClassId(rs.getString("CLASS_ID"));
//				list.add(c);
//			}
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(rs);
//			close(pstmt);
//		}return list;
//	}
	
}
