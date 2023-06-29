package com.smallus.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smallus.review.service.ReviewMemberService;

/**
 * Servlet implementation class DeleteReviewMyPage
 */
@WebServlet("/revies/deleteReviewMyPage.do")
public class DeleteReviewMyPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReviewMyPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String reviewId= request.getParameter("reviewId");
		/*System.out.println(reviewId);*/
		int result= new ReviewMemberService().deleteReviewMyPage(reviewId);
		if(result>0) System.out.println("성공 ");
		response.sendRedirect(request.getContextPath()+"/review/reviewList.do");
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
