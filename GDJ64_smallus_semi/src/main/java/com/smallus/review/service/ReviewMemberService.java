package com.smallus.review.service;

import static com.smallus.common.JDBCTemplate.close;
import static com.smallus.common.JDBCTemplate.commit;
import static com.smallus.common.JDBCTemplate.getConnection;
import static com.smallus.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.smallus.review.model.dao.ReviewDao;
import com.smallus.review.model.vo.Review;

public class ReviewMemberService {
	
	private ReviewDao dao = new ReviewDao();
	
	public List<Review> memberReview(String userId){
		Connection conn = getConnection();
		List<Review> list = dao.selectReview(conn, userId);
		close(conn);
		return list;
	}
	public int insertReview(Review r) {
		Connection conn=getConnection();
		int result=dao.insertReview(conn, r);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	/*
	 * public int deleteReviewMyPage(String reviewId) { Connection
	 * conn=getConnection(); int count=dao.deleteRevieMyPage(conn,reviewId);
	 * if(count>0) commit(conn); else rollback(conn); return count; }
	 */
	public int deleteReviewMyPage(String reviewId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
