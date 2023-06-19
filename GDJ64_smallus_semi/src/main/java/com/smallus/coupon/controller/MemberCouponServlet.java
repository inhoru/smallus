package com.smallus.coupon.controller;

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

/**
 * Servlet implementation class MemberCouponServlet
 */
@WebServlet("/mypageCoupon.do")
public class MemberCouponServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberCouponServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		new CouponService().deleteCoupon();
		int count=new CouponService().couponCount(loginMember.getMemberId());
		List<Coupon> c=new CouponService().searchByMemberCoupon(loginMember.getMemberId());
		request.setAttribute("countCoupon", count);
		request.setAttribute("coupon", c);
		request.getRequestDispatcher("/views/mypage/coupon.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
