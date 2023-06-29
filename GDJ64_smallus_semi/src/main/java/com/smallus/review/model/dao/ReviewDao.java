package com.smallus.review.model.dao;
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

import com.smallus.review.model.vo.Review;
import com.smallus.review.model.vo.ReviewHost;

public class ReviewDao {
	
	private Properties sql = new Properties();
	
	public ReviewDao() {
		String path = ReviewDao.class
					.getResource("/sql/review.properties")
					.getPath();
		try {
				sql.load(new FileReader(path));
	}catch(IOException e) {
		e.printStackTrace();
		}
	}
	
	private Review getReview(ResultSet rs) throws SQLException{
	return Review.builder()
			.reviewId(rs.getString("review_id"))
			.paymentId(rs.getString("payment_id"))
			.reviewTitle(rs.getString("review_title"))
			.reviewContent(rs.getString("review_content"))
			.reviewRating(rs.getInt("review_Rating"))
			.reviewDate(rs.getDate("review_date"))
			.imgPath(rs.getString("CLASS_THUMBNAIL"))
			.memberId(rs.getString("member_id"))
			.classTitle(rs.getString("class_title"))
			.memberNickname(rs.getString("member_nickname"))
			.build();
}
//	public List<Review> selectReview(Connection conn,String classId) {
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		List<Review> list = new ArrayList();
//		try {
//			pstmt=conn.prepareStatement(sql.getProperty("selectReview"));
//			pstmt.setString(1, classId);
//			rs=pstmt.executeQuery();
//			while(rs.next()) {
//				list.add(getReview(rs));
//			}
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(rs);
//			close(pstmt);
//		}return list;
//	}
	public List<Review> selectReview(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Review> list = new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectReview"));
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(getReview(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	public int insertReview(Connection conn, Review r) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertReview"));
			pstmt.setString(1, r.getPaymentId());
			pstmt.setString(2, r.getReviewTitle());
			pstmt.setString(3, r.getReviewContent());
			pstmt.setInt(4, r.getReviewRating());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
//	public Review selectReviewByNo(Connection conn, int no) {
//		PreparedStatement pstmt=null;
//		ResultSet rs = null;
//		Review r = null;
//		try {
//			pstmt=conn.prepareStatement(sql.getProperty("selectReviewByNo"));
//			pstmt.setInt(1,no);
//			rs=pstmt.executeQuery();
//			if(rs.next()) r=getReview(rs);
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(rs);
//			close(pstmt);
//		}return r;
//	}
	
	public int countReviewByhostId(Connection conn, String hostId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("countReviewByhostId"));
			//SELECT COUNT(MEMBER_ID) FROM PAYMENT WHERE MEMBER_ID=?
			pstmt.setString(1, hostId);
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
	
	 public List<ReviewHost> hostReviewList(Connection conn, String hostId, int cPage, int numPerpage){
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      List<ReviewHost> list = new ArrayList<ReviewHost>();
	      try {
	         pstmt=conn.prepareStatement(sql.getProperty("hostreviewList"));
	         pstmt.setString(1, hostId);
				
				  pstmt.setInt(2, (cPage-1)*numPerpage+1);
				  pstmt.setInt(3, cPage*numPerpage);
				
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	            ReviewHost rv= new ReviewHost();
	            rv.getPayment().setPaymentId(rs.getString("PAYMENT_ID"));
	            rv.getPayment().setMemberId(rs.getString("MEMBER_ID"));
	            rv.getClasses().setClassId(rs.getString("CLASS_ID"));
	            rv.getClasses().setClassTitle(rs.getString("CLASS_TITLE"));
	            rv.getClasses().setClassPersonnel(rs.getInt("CLASS_PERSONNEL"));
	            rv.getClasses().setClassThumbnail(rs.getString("CLASS_THUMBNAIL"));
	            rv.getClasses().setClassStatus(rs.getString("CLASS_STATUS"));
	            rv.getCategory().setCategoryTitle(rs.getString("CATEGORY_TITLE"));
	            rv.getClassDetail().setBookingTimeStart(rs.getDate("BOOKING_TIME_START"));
	            rv.getClassDetail().setBookingTimeEnd(rs.getDate("BOOKING_TIME_END"));
	            rv.getReview().setReviewId(rs.getString("REVIEW_ID"));
	            rv.getReview().setReviewTitle(rs.getString("REVIEW_TITLE"));
	            rv.getReview().setReviewContent(rs.getString("REVIEW_CONTENT"));
	            rv.getReview().setReviewRating(rs.getInt("REVIEW_RATING"));
	            rv.getReview().setReviewDate(rs.getDate("REVIEW_DATE"));
	            list.add(rv);
	         }
	      }catch(SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(rs);
	         close(pstmt);
	      }return list;
	   }

	public int delete(Connection conn, String reviewId) {
		PreparedStatement pstmt=null;
		int result=0;
		
//		String sql="REMOVE REVIEW_ID"
		try {
			pstmt=conn.prepareStatement(sql.getProperty("deleteReviewByhost"));
			pstmt.setString(1, reviewId);
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	

	
	public int deleteReviewByhost(Connection conn, String reviewId) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("deleteReviewByhost"));
			pstmt.setString(1, reviewId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	
	
	
	
	
	
	
	}
