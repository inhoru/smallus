package com.smallus.payment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smallus.coupon.service.CouponService;
import com.smallus.member.model.vo.Member;
import com.smallus.member.service.MemberService;
import com.smallus.payment.model.vo.Payment;
import com.smallus.payment.service.PaymentService;

/**
 * Servlet implementation class MemberPaymentCancelEndSerlvet
 */
@WebServlet("/memberpaymentCancelEnd.do")
public class MemberPaymentCancelEndSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPaymentCancelEndSerlvet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	HttpSession session = request.getSession();
	Member loginMember = (Member) session.getAttribute("loginMember");
	String memberId= loginMember.getMemberId();
	
	 String paymentId = request.getParameter("paymentId");
	System.out.println(paymentId);
	int result=new PaymentService().paymentCancel(paymentId);
	Payment p=new PaymentService().searchBypaymentId(paymentId);
	if(p.getCouponId()!=null) {
		int result2=new PaymentService().reinsertCoupon(memberId,p.getCouponId(),p.getMemberId(),p.getCreatedDate(),p.getExpiredDated());
	}
	System.out.println(result);
	String msg="",loc="";
	if(result>0) {
		//입력 성공
		msg="예약취소 완료되었습니다.";
		loc="/";
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.setAttribute("script",
				"opener.location.replace('" + request.getContextPath() + "/memberpayment.do');close();");
	}else {
		//입력 실패
		msg="예약취소를 실패했습니다. :( \n다시시도하세요";
		loc="/memberpayment.do";
	}
	request.setAttribute("msg", msg);
	request.setAttribute("loc", loc);
	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);


	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
