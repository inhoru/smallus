package com.smallus.payment.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smallus.coupon.service.CouponService;
import com.smallus.member.model.vo.Member;
import com.smallus.payment.model.vo.Payment;
import com.smallus.payment.service.PaymentService;

/**
 * Servlet implementation class MemberPaymentServlet
 */
@WebServlet("/memberpayment.do")
public class MemberPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 페이징 처리
		int cPage, numPerpage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1;
		}
		try {
			numPerpage = Integer.parseInt(request.getParameter("numPerpage"));
		} catch (NumberFormatException e) {
			numPerpage = 5;
		}
		HttpSession session=request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		List<Member> list=new PaymentService().searchByMemberPayment(loginMember.getMemberId(),cPage,numPerpage);
		int totalData=new PaymentService().paymentCount(loginMember.getMemberId());
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		String pageBar="";
		if (pageNo == 1) {
			pageBar += "<span class='h-pageBar-txt'> 이전 </span>";
		} else {
			pageBar += "<a href='" + request.getRequestURI() + "?cPage=" + (pageNo - 1) + "&numPerpage=" + numPerpage + "' class='h-pageBar-txt'> 이전 </a>";
		}
		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<span class='h-pageBar-now'> " + pageNo + " </span>";
			} else {
				pageBar += "<a href='" + request.getRequestURI() + "?cPage=" + pageNo + "&numPerpage=" + numPerpage + "'> " + pageNo + " </a>";
			}
			pageNo++;
		}
		if (pageNo > totalPage) {
			pageBar += "<span class='h-pageBar-txt'> 다음 </span>";
		} else {
			pageBar += "<a href='" + request.getRequestURI() + "?cPage=" + pageNo + "&numPerpage=" + numPerpage + "' class='h-pageBar-txt'> 다음 </a>";
		}
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("paymentCount", totalData);
		request.setAttribute("payment", list);
		request.setAttribute("cPage", cPage);
		
		request.getRequestDispatcher("/views/mypage/payment.jsp").forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
