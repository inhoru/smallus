package com.smallus.Inquiry.dao;

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

import com.smallus.Inquiry.model.vo.Faq;
import com.smallus.coupon.dao.CouponDao;

public class InquiryDao {
private Properties sql= new Properties();
	
	{
		String path=CouponDao.class.getResource("/sql/inquiry.properties").getPath();
		try {
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Faq> selectAllFaq(Connection conn,int cPage,int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Faq> list=new ArrayList<Faq>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectAllFaq"));
			//SELECT * FROM (SELECT ROWNUM AS RNUM, B.* FROM (SELECT * FROM FAQ)B) WHERE RNUM BETWEEN ? AND ?
			pstmt.setInt(1,(cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) list.add(getFaq(rs));
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	public int selectFaqCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectFaqCount"));
			//SELECT COUNT(FAQ_ID) FROM FAQ
			rs=pstmt.executeQuery();
			if(rs.next())result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public List<Faq> selectCategorie(Connection conn,int cPage,int numPerpage,String categorie){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Faq> list=new ArrayList<Faq>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectCategorie"));
			//SELECT * FROM (SELECT ROWNUM AS RNUM, B.* FROM (SELECT * FROM FAQ WHERE FAQ_TYPE=?)B) WHERE RNUM BETWEEN ? AND ?
			pstmt.setString(1, categorie);
			pstmt.setInt(2,(cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) list.add(getFaq(rs));
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	public int selectCategorieCount(Connection conn,String categorie) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectCategorieCount"));
			//SELECT COUNT(FAQ_ID) FROM FAQ WHERE FAQ_TYPE=?
			pstmt.setString(1, categorie);
			rs=pstmt.executeQuery();
			if(rs.next())result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	private Faq getFaq(ResultSet rs) throws SQLException {
		return Faq.builder().faqId(rs.getString("FAQ_ID")).hostId(rs.getString("HOST_ID")).faqTitle(rs.getString("FAQ_TITLE")).faqContent(rs.getString("FAQ_CONTENT")).faqType(rs.getString("FAQ_TYPE")).build();
	}
}
