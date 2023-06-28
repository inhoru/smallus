package com.smallus.review.service;

import java.sql.Connection;
import java.util.List;

import com.smallus.review.model.dao.ReviewDao;
import com.smallus.review.model.vo.Review;

import static com.smallus.common.JDBCTemplate.*;
public class ReviewService {

	private ReviewDao dao = new ReviewDao();
	
//	public List<Review> selectReview(String classId){
//		Connection conn = getConnection();
//		List<Review> list = dao.selectReview(conn,classId);
//		close(conn);
//		return list;
//	}
	public List<Review> selectReview(String userId){
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
//	public Review selectReviewByNo(int no) {
//		Connection conn=getConnection();
//		Review r = dao.selectReviewByNo(conn,no);
//		close(conn);
//		return r;
//	}
	
	public int countReviewByhostId(String hostId) {
		Connection conn=getConnection();
		int count=dao.countReviewByhostId(conn,hostId);
		if(count>0) commit(conn);
		else rollback(conn);
		return count;
	}
	
	public List<Review> hoistReviewList(String hostId){
		Connection conn = getConnection();
		List<Review> list = dao.hoistReviewList(conn, hostId);
		close(conn);
		return list;
	}
	
}
