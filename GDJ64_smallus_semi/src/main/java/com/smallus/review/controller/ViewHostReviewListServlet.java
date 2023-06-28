package com.smallus.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smallus.member.model.vo.Member;
import com.smallus.review.model.vo.Review;
import com.smallus.review.service.ReviewService;

/**
 * Servlet implementation class ReviewListServlet
 */
@WebServlet("/review/reviewList.do")
public class ViewHostReviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewHostReviewListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session=request.getSession();
		Member loginMember=(Member)session.getAttribute("loginMember");
		
		List<Review> reviews=new ReviewService().selectReview(loginMember.getMemberId());
		//List<ReviewClass> rc=new ReviewService().selectReviewClassByClassId(hostId,cPage,numPerpage);
		request.setAttribute("reviews", reviews);
		
		//System.out.println(reviews);
		
		request.getRequestDispatcher("/views/review/reviewList.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
