package com.smallus.host.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smallus.payment.model.vo.Payment;
import com.smallus.payment.service.PaymentService;

/**
 * Servlet implementation class ViewCalendarServlet
 */
@WebServlet("/host/viewCalendar.do")
public class ViewCalendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewCalendarServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//String hostId = request.getParameter("hostId");
		String hostId="c1234";
		List<Payment> cList = new PaymentService().selectPaymentByhostId(hostId);
		if(cList.isEmpty()||cList==null) {
			System.out.println("xxxx");
		}else {
			System.out.println("dddd");
		}
		// Gson 라이브러리 이용해서 json parsing하기
		// 1. Gson 클래스 생성하기
		Gson gson = new Gson();
		// 2. Gson에서 제공하는 parsing하는 메소드 사용하기
		// toJson(json으로 변경할 객체[,OutputStream]); // outputStream으로 변경한 객체 보내고 끝난다
		response.setContentType("application/json; charset=UTF-8");
		// gson.toJson(m,response.getWriter()); // 첫번째 멤버변수를 key값으로 쓴다.
		gson.toJson(cList, response.getWriter()); // list 보낼 때는 바로 list 보내도 됨 ㅠㅠ
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
