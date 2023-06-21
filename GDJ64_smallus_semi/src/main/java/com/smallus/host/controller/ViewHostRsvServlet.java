package com.smallus.host.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smallus.host.model.vo.Host;
import com.smallus.payment.model.vo.Payment;
import com.smallus.payment.service.PaymentService;

/**
 * Servlet implementation class ReservationScheduleServlet
 */
@WebServlet("/host/viewHostRsv.do")
public class ViewHostRsvServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewHostRsvServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String hostId=request.getParameter("hostId");
		
		List<Payment> rsvList=new PaymentService().selectPaymentByhostId(hostId);
		if(rsvList.isEmpty()) {
			System.out.println("없음없");
		}else {
			System.out.println("있음있");
			request.setAttribute("rsvList",rsvList);				
		}
		System.out.println(hostId);
		System.out.println(rsvList);
		
		response.sendRedirect(request.getContextPath()+"/views/host/viewHostReservation.jsp");
		
		
//		// Gson 라이브러리 이용해서 json parsing하기
//		// 1. Gson 클래스 생성하기
//		Gson gson= new Gson();
//		// 2. Gson에서 제공하는 parsing하는 메소드 사용하기
//		// toJson(json으로 변경할 객체[,OutputStream]); // outputStream으로 변경한 객체 보내고 끝난다
//		response.setContentType("application/json; charset=UTF-8");
//		//gson.toJson(m,response.getWriter()); // 첫번째 멤버변수를 key값으로 쓴다.
//		gson.toJson(rsvList,response.getWriter()); // list 보낼 때는 바로 list 보내도 됨 ㅠㅠ
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
