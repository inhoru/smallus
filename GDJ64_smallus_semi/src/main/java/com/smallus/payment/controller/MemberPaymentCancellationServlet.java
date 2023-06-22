package com.smallus.payment.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smallus.payment.model.vo.PaymentCompleted;
import com.smallus.payment.service.PaymentService;

/**
 * Servlet implementation class MemberPaymentCancellationServlet
 */
@WebServlet("/memberCancellation.do")
public class MemberPaymentCancellationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPaymentCancellationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String paymentId=request.getParameter("id");
		System.out.println(paymentId);
		List<PaymentCompleted> list=new PaymentService().paymentCompleted(paymentId);
		request.setAttribute("paymentList", list);
		String cPage=request.getParameter("cPage");
		request.setAttribute("cPage", cPage);
		 request.getRequestDispatcher("/views/mypage/paymentCancellation.jsp").forward(
		  request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
