package com.smallus.Inquiry.dao;

import static com.smallus.classes.model.dao.ClassesDao.getClasses2;
import static com.smallus.member.dao.MemberDao.getMember;
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
import com.smallus.Inquiry.model.vo.Inquiry;
import com.smallus.Inquiry.model.vo.InquiryComment;
import com.smallus.coupon.dao.CouponDao;
import com.smallus.member.model.vo.Member;

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
	public List<Faq> selectAllFaq(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Faq> list=new ArrayList<Faq>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectAllFaq"));
			
			rs=pstmt.executeQuery();
			while(rs.next()) list.add(getFaq(rs));
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public List<Faq> selectCategorie(Connection conn,String categorie){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Faq> list=new ArrayList<Faq>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectCategorie"));
			
			pstmt.setString(1, categorie);
			rs=pstmt.executeQuery();
			while(rs.next()) list.add(getFaq(rs));
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	public int selectInquiryCount(Connection conn,String memberId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectInquiryCount"));
			
			pstmt.setString(1, memberId);
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
	

	public List<Inquiry> selectAllInquiry(Connection conn,int cPage,int numPerpage,String memberId){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Inquiry> list=new ArrayList<Inquiry>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectAllInquiry"));
			
			pstmt.setString(1, memberId);
			pstmt.setInt(2,(cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
		
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(getInquiry(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	public int InquiryRemove(Connection conn,String memberId,String remove) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("inquiryRemove"));
		
			pstmt.setString(1, memberId);
			pstmt.setString(2, remove);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println(result);
		return result;
	}
	public int InsertInquiry(Connection conn, String memberId,String boardType, String boardTitle, String boardContent) {
		
		PreparedStatement pstmt=null;
		int result=0;
		try {
		
			pstmt=conn.prepareStatement(sql.getProperty("insertInquiry"));
			pstmt.setString(1, memberId);
			pstmt.setString(2, boardType);
			pstmt.setString(3, boardTitle);
			pstmt.setString(4, boardContent);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int Insertupfiles(Connection conn,String files) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
	
			pstmt=conn.prepareStatement(sql.getProperty("insertupfiles"));
			pstmt.setString(1, files);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	 public Member searchMemberId(Connection conn,String boardId)  {
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      Member m = null;
	      try {
	         pstmt = conn.prepareStatement(sql.getProperty("searchMemberId"));
	   
	         pstmt.setString(1, boardId);
	         rs = pstmt.executeQuery();
	         if (rs.next()) {
	            m = getMember(rs);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rs);
	         close(pstmt);
	      }   
	      return m;
	   }
	 public int insertNot(Connection conn,String memberId) {
			PreparedStatement pstmt=null;
			int result=0;
			try {
				
				pstmt=conn.prepareStatement(sql.getProperty("insertNot"));
				String c="답변이 등록되었습니다.";
				String d="1:1문의";
				pstmt.setString(1, memberId);
				pstmt.setString(2,c);
				pstmt.setString(3,d);
				result=pstmt.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			return result;
		}
	
	
	private Inquiry getInquiry(ResultSet rs) throws SQLException {
		return Inquiry.builder().boardId(rs.getString("BOARD_ID")).memberId(rs.getString("MEMBER_ID")).boardType(rs.getString("BOARD_TYPE")).boardTitle(rs.getString("BOARD_TITLE")).boardContent(rs.getString("BOARD_CONTENT")).boardRdate(rs.getDate("BOARD_RDATE")).boardCheck(rs.getString("BOARD_CHECK")).commentConent(rs.getString("COMMENT_CONENT")).commentRdate(rs.getDate("COMMENT_RDATE")).commentId(rs.getString("COMMENT_ID")).boardId(rs.getString("BOARD_ID")).sfId(rs.getString("SF_ID")).sfRename(rs.getString("SF_RENAME")).build();
	}
	
	private Faq getFaq(ResultSet rs) throws SQLException {
		return Faq.builder().faqId(rs.getString("FAQ_ID")).hostId(rs.getString("HOST_ID")).faqTitle(rs.getString("FAQ_TITLE")).faqContent(rs.getString("FAQ_CONTENT")).faqType(rs.getString("FAQ_TYPE")).build();
	}
	private InquiryComment getComment(ResultSet rs) throws SQLException {
		return InquiryComment.builder().commentConent(rs.getString("COMMENT_CONENT")).commentRdate(rs.getDate("COMMENT_RDATE")).commentId(rs.getString("COMMENT_ID")).build();
	}
	public static Inquiry getInquiry2(ResultSet rs) throws SQLException {
	      return Inquiry.builder().boardId(rs.getString("BOARD_ID")).memberId(rs.getString("MEMBER_ID")).boardType(rs.getString("BOARD_TYPE")).boardTitle(rs.getString("BOARD_TITLE")).boardContent(rs.getString("BOARD_CONTENT")).boardRdate(rs.getDate("BOARD_RDATE")).boardCheck(rs.getString("BOARD_CHECK")).sfId(rs.getString("SF_ID")).sfRename(rs.getString("SF_RENAME")).build();
	   }
}
