package com.smallus.review.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smallus.member.controller.MemberIdDuplicate;
import com.smallus.review.model.vo.Review;

/**
 * Servlet implementation class reviewList
 */
@WebServlet("/reviewListMyPage.do")
public class ReviewMemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewMemberListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date today=null;
		try {
			today=sdf.parse("2023-06-21 14:30");
		}catch(ParseException e) {
			//e.printStackTrace()
			today=new Date();	
		}
		
//		List<Review> reviewList=new ReviewMemberService()
		

		List<Review> reviews = List.of(
				Review.builder(). reviewId("RVW1000").
				memberId("test").
				paymentId("PYM20230502").
				reviewTitle("후기제목입니다").
				reviewContent("후기내용입니다").
				reviewRating(5).
				reviewDate(today).
				build()
				);
		request.setAttribute("reviews",reviews);
		request.getRequestDispatcher("/views/review/reviewList.jsp").forward(request, response); //주소수정예정
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
