package com.smallus.payment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smallus.classes.model.vo.ClassDetail;

/**
 * Servlet implementation class PaymentTestServlet
 */
@WebServlet("/paymentTest.do")
public class PaymentTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentTestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		Gson gson = new Gson();
//		// GSON을 사용하여 List를 JSON 형식의 문자열로 변환
//		String ClassDetail=request.getParameter("ClassDetail");
//		// JSON 데이터를 클라이언트로 전송 (예: HttpServletResponse)
//		response.setContentType("application/json");
//		response.setCharacterEncoding("UTF-8");
//		ClassDetail requestData=gson.fromJson(ClassDetail,ClassDetail.class); // data를 Member class로 변환해준다
		request.getRequestDispatcher("/views/payment/paymentClass.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
