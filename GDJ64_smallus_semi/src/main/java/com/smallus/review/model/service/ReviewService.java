package com.smallus.review.model.service;

import java.sql.Connection;
import java.util.List;

import com.smallus.review.model.dao.ReviewDao;
import com.smallus.review.model.vo.Review;

public class ReviewService {

	private ReviewDao dao = new ReviewDao();
	
//	public List<Review> selectNotice(int cPage, int nemPerpage){
//		Connection conn = getConnection();
//		List<Review> list = dao.selectNotice(conn,cPage,numPerpage);
//		close(conn);
//		return list;
//	}
//	public int insertReview(Review r) {
//		Connection conn=getConnection();
//		if(result>0) commit(conn);
//		else rollback(conn);
//		close(conn);
//		return result;
//	}
//	public Review selectReviewByNo(int no) {
//		Connection conn=getConnection();
//		Review r = dao.selectReviewByNo(conn,no);
//		close(conn);
//		return r;
//	}
}
