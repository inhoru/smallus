package com.smallus.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smallus.review.service.ReviewService;

/**
 * Servlet implementation class DeleteReviewByHostServlet
 */
@WebServlet("/review/deleteReviewByHost.do")
public class DeleteReviewByHostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReviewByHostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String reviewId= request.getParameter("reviewId");
		System.out.println(reviewId);
		int result= new ReviewService().deleteReviewByhost(reviewId);
		if(result>0) System.out.println("성공 ");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/csv;charset=utf-8");
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
