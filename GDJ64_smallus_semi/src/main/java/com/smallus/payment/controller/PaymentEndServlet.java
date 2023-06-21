package com.smallus.payment.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class PaymentEndServlet
 */
@WebServlet("/payments/callback_receive.do")
public class PaymentEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String data=request.getParameter("data");
		request.setAttribute("data", data);
		Gson gson= new Gson();
		gson.toJson(data,response.getWriter());
		response.setContentType("application/json; charset=UTF-8");
		if(data!=null&&!data.isEmpty()) {
			System.out.println("data O");
		}else {
			System.out.println("data X");
		}
		request.getRequestDispatcher("/views/payment/paymentResult.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		request.setCharacterEncoding("UTF-8");
		String data=request.getParameter("data");
		
		//int age=Integer.parseInt(request.getParameter("age"));
		System.out.println("post 방식으로 요청");
		System.out.println(data);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.print(data);
		out.print(" 사용자가 post 방식으로 보낸 데이터");
		
	}

}
