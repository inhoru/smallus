package com.smallus.payment.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smallus.coupon.model.vo.Coupon;
import com.smallus.coupon.service.CouponService;
import com.smallus.member.model.vo.Member;
import com.smallus.payment.model.vo.PaymentInfo;
import com.smallus.payment.service.PaymentService;

/**
 * Servlet implementation class PaymentClassServlet
 */
@WebServlet("/class/payment.do")
public class PaymentClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentClassServlet() {
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
//		List<Coupon> coupon=new CouponService().selectCouponByMemberId(loginMember.getMemberId());
		String classDetailId=request.getParameter("id");
		PaymentInfo pInfo= new PaymentService().selectPaymentInfo(classDetailId);
		String personnel=request.getParameter("personnel");
//		System.out.println(classDetailId);
//		// memberId를 매개변수로 하는 쿠폰 가격 가져오기 
//		List<Coupon> coupon=new CouponService().selectCouponByMemberId(loginMember.getMemberId());
//		PaymentInfo pInfo= new PaymentService().selectPaymentInfo(classDetailId);
//		// 선택한 수량, 디테일 클래스 아이디만 가지고 이동 -> 
//		
		List<Coupon> coupon=new CouponService().selectCouponByMemberId(loginMember.getMemberId());
		request.setAttribute("coupon",coupon);
		request.setAttribute("paymentInfo",pInfo);
		request.setAttribute("personnel",personnel);
		
		System.out.println("coupon : "+coupon);
		System.out.println("pInfo : "+pInfo);
		System.out.println("personnel : "+personnel);
//		
		
//		
//		Gson gson= new Gson();
//		response.setContentType("application/json; charset=UTF-8");
//		PrintWriter out=response.getWriter();
//		gson.toJson(coupon,response.getWriter());
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
