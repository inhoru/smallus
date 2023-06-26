package com.smallus.payment.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smallus.classes.model.vo.ClassDetail;
import com.smallus.classes.model.vo.Classes;
import com.smallus.coupon.model.vo.Coupon;
import com.smallus.coupon.service.CouponService;
import com.smallus.member.model.vo.Member;

/**
 * Servlet implementation class PaymentClassServlet
 */
@WebServlet("/class/payment2.do")
public class PaymentClassServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentClassServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		
		// memberId를 매개변수로 하는 쿠폰 가격 가져오기 
		List<Coupon> coupon=new CouponService().selectCouponByMemberId(loginMember.getMemberId());
		
		//CATEGORY_TITLE, CLASS_TITLE, CLASS_ADDRESS, CLASS_ID, CLASS_DETAIL_ID,
		//BOOKING_TIME_START, BOOKING_TIME_END,  CLASS_PERSONNEL, REMAINING_PERSONNEL, CLASS_PRICE
		String categoryTitle=request.getParameter("categoryTitle");
		String classTitle=request.getParameter("classTitle");
		String classId=request.getParameter("classId");
		String classPrice=request.getParameter("classPrice");
		String personnel=request.getParameter("personnel");
		String classAddress=request.getParameter("classAddress");
		Classes c=Classes.builder().classId(classId).classTitle(classTitle).classAddress(classAddress)
				.classPrice(Integer.parseInt(classPrice))
				.classPersonnel(Integer.parseInt(personnel)).build();
		
		
		String classDetailId=request.getParameter("classDetailId");
		String classBookingTimeStart=request.getParameter("classBookingTimeStart");
		String classBookingTimeEnd=request.getParameter("classBookingTimeEnd");
		String remainingPersonnel=request.getParameter("remainingPersonnel");
		
		
//		System.out.println("categoryTitle : "+categoryTitle);
//		System.out.println("classTitle : "+classTitle);
//		System.out.println("classId : "+classId);
//		System.out.println("classPrice : "+classPrice);
//		System.out.println("personnel : "+personnel);
//		System.out.println("classAddress : "+classAddress);
//		
//		System.out.println("classDetailId : "+classDetailId);
//		System.out.println("classBookingTimeStart : "+classBookingTimeStart);
//		System.out.println("classBookingTimeEnd : "+classBookingTimeEnd);
//		System.out.println("remainingPersonnel : "+remainingPersonnel);
		
		System.out.println("coupon : "+coupon);
		
		Gson gson= new Gson();
		response.setContentType("application/json; charset=UTF-8");
//		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		gson.toJson(coupon,response.getWriter());
		out.print(categoryTitle);
//		request.setAttribute("classes",c);
//		request.setAttribute("coupon",coupon);
//		request.setAttribute("hostNickname","nickname");
//		request.setAttribute("categoryTitle", categoryTitle);
//		request.setAttribute("classDetailId",classDetailId);
//		request.setAttribute("classBookingTimeStart",classBookingTimeStart);
//		request.setAttribute("classBookingTimeEnd",classBookingTimeEnd);
//		request.setAttribute("remainingPersonnel",remainingPersonnel);
		
//		request.getRequestDispatcher("/views/payment/paymentClass.jsp").forward(request, response);
			
//			request.setAttribute("msg", "잘못된 접근입니다.");
//			request.setAttribute("loc", "/");
//			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
