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

public class ReviewDao {
	
	private Properties sql = new Properties();
	
	public ReviewDao() {
		String path = ReviewDao.class
					.getResource("sql/review/reviewsql.properties")
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
			.memberId(rs.getString("member_id"))
			.classId(rs.getString("class_id"))
			.paymentId(rs.getString("payment_id"))
			.reviewTitle(rs.getString("review_title"))
			.reviewContent(rs.getString("review_content"))
			.reviewRating(rs.getInt("review_Rating"))
			.reviewDate(rs.getDate("review_date"))
			.build();
}
//	public List<Review> selectReview(Connection conn, int cPage, int numPerpage) {
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		List<Review> list = new ArrayList();
//		try {
//		//	pstmt=conn.prepareStatment(sql.getProperty("selectReview"));
//			pstmt.setInt(1, (cPage-1)*numPerpage+1);
//		//	pstmt.setInt(2,cPage)
		//}
//	}
	}
