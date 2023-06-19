package com.smallus.coupon.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smallus.coupon.service.CouponService;
import com.smallus.member.model.vo.Member;

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
		Member infoMember = (Member) request.getAttribute("infoMember");
		int result=new CouponService().insertCoupon(coupon,infoMember.getMemberId());
		
		String msg="",loc="";
		if(result>0) {
		
			msg="쿠폰이 등록 되었습니다.";
			loc="/mypageCoupon.do";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
		}else {
			//입력 실패
			msg="없는 쿠폰 번호입니다.";
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
