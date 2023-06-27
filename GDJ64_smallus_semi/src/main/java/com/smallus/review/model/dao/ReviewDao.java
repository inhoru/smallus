package com.smallus.review.model.dao;
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
import static com.smallus.common.JDBCTemplate.close;

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
			.reviewId(rs.getString("riview_id"))
			.paymentId(rs.getString("payment_id"))
			.reviewTitle(rs.getString("review_title"))
			.reviewContent(rs.getString("review_content"))
			.reviewRating(rs.getInt("review_Rating"))
			.reviewDate(rs.getDate("review_date"))
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
	public List<Review> selectReview(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Review> list = new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectReview"));
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
	
	
	
	
	
	
	
	
	
	
	
	
	}
