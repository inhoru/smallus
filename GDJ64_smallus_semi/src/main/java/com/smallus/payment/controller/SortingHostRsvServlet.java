package com.smallus.payment.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smallus.host.model.vo.Host;
import com.smallus.payment.model.vo.PaymentCalc;
import com.smallus.payment.service.PaymentService;

/**
 * Servlet implementation class SortingHostRsvServlet
 */
@WebServlet("/host/sortingHostRsv.do")
public class SortingHostRsvServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SortingHostRsvServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session= request.getSession();
		Host host=(Host)session.getAttribute("loginHost");
		String hostId=host.getHostId();
		
		String paymentStatus=request.getParameter("paymentStatus");
		if(paymentStatus.equals("Y")) {
			paymentStatus="결제완료";
		}else if(paymentStatus.equals("N")) {
			paymentStatus="결제취소";
		}
		
		
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
			numPerpage = 6;
		}

		String pageBar = "";
		int totalData = new PaymentService().selectRsvCount(hostId);
		System.out.println(totalData);
		int totalPage = (int) Math.ceil((double) totalData / numPerpage);
		int pageBarSize = 5;
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;

		if (pageNo == 1) {
			pageBar += "<span class='h-pageBar-txt'> 이전 </span>";
		} else {
			pageBar += "<a href='" + request.getRequestURI() + "?hostId=" + hostId + "&cPage=" + (pageNo - 1)
					+ "&numPerpage=" + numPerpage + "' class='h-pageBar-txt'> 이전 </a>";
		}
		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<span class='h-pageBar-now'> " + pageNo + " </span>";
			} else {
				pageBar += "<a href='" + request.getRequestURI() + "?hostId=" + hostId + "&cPage=" + pageNo
						+ "&numPerpage=" + numPerpage + "'> " + pageNo + " </a>";
			}
			pageNo++;
		}
		if (pageNo > totalPage) {
			pageBar += "<span class='h-pageBar-txt'> 다음 </span>";
		} else {
			pageBar += "<a href='" + request.getRequestURI() + "?hostId=" + hostId + "&cPage=" + pageNo + "&numPerpage="
					+ numPerpage + "' class='h-pageBar-txt'> 다음 </a>";
		}
		request.setAttribute("pageBar", pageBar);
		
		List<PaymentCalc> sortStatusList=new PaymentService().sortingPaymentByStatus(hostId,paymentStatus,cPage,numPerpage);
		if(sortStatusList.isEmpty()||sortStatusList==null) {
			System.out.println("sortStatusList없음없");
		}else {
			System.out.println("sortStatusList있음있");
			request.setAttribute("sortStatusList",sortStatusList);				
		}
		
		request.getRequestDispatcher("/views/host/viewHostReservation.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
