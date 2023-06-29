package com.smallus.payment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smallus.payment.model.vo.PaymentCompleted;
import com.smallus.payment.service.PaymentService;

/**
 * Servlet implementation class PaymentResultServlet
 */
@WebServlet("/paymentResult.do")
public class PaymentResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String paymentId=request.getParameter("paymentId");
		System.out.println(paymentId);
		PaymentCompleted p =new PaymentService().selectPaymentByPaymentId(paymentId);
		if(p!=null) {
			request.setAttribute("payment", p);
			request.getRequestDispatcher("/views/host/ViewPaymentResult.jsp").forward(request, response);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
