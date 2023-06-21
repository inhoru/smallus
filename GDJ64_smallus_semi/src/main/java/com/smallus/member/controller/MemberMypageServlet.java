package com.smallus.member.controller;

import java.io.IOException;
import java.util.List;

import javax.print.DocFlavor.READER;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smallus.classes.model.vo.Classes;
import com.smallus.coupon.service.CouponService;
import com.smallus.member.model.vo.Member;
import com.smallus.member.service.MemberService;

/**
 * Servlet implementation class MemberMypageServlet
 */
@WebServlet("/memberMypage.do")
public class MemberMypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMypageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		int count=new CouponService().couponCount(loginMember.getMemberId());
		List<Member> m=new MemberService().paymentDetails(loginMember.getMemberId());
		List<Classes> w=new MemberService().wishList(loginMember.getMemberId(),1,100);
		int wishCount=new  MemberService().wishListCount(loginMember.getMemberId());
	request.setAttribute("wishCount", wishCount);
		request.setAttribute("wishList", w);
		request.setAttribute("paymentDetails",m);
		request.setAttribute("countCoupon", count);
		request.getRequestDispatcher("/views/mypage/mypageMain.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
