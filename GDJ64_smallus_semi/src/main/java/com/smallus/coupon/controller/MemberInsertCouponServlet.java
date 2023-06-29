package com.smallus.coupon.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smallus.coupon.model.vo.Coupon;
import com.smallus.coupon.service.CouponService;
import com.smallus.member.model.vo.Member;
import com.smallus.member.service.MemberService;

/**
 * Servlet implementation class MemberInsertCouponServlet
 */
@WebServlet("/insertCoupon.do")
public class MemberInsertCouponServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertCouponServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String coupon=request.getParameter("i-insertcoupon");
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		Coupon c = new CouponService().searchCoupon(loginMember.getMemberId(),coupon);
		int result=0;
		if(c==null) {			
			 result=new CouponService().insertCoupon(coupon,loginMember.getMemberId());
		}
		Member m=new MemberService().selectByMemberId(loginMember.getMemberId());
		session.setAttribute("loginMember",m);
		System.out.println(c);
		String msg="",loc="";
		if(result>0) {
			msg="쿠폰이 등록 되었습니다.";
			loc="/mypageCoupon.do";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
		}else {
			//입력 실패
			msg="이미등록된 쿠폰이거나 없는 쿠폰번호입니다.";
			loc="/mypageCoupon.do";
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
