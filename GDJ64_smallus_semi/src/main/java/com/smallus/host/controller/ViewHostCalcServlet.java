package com.smallus.host.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smallus.host.model.vo.Calc;
import com.smallus.host.model.vo.Host;
import com.smallus.host.service.CalcService;
import com.smallus.host.service.HostService;

/**
 * Servlet implementation class ViewHostCalcServlet
 */
@WebServlet("/host/viewHostCalc.do")
public class ViewHostCalcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewHostCalcServlet() {
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
		String hostId=(host.getHostId());
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
		int totalData = new CalcService().selectCalcCount(hostId);
		System.out.println(totalData+" "+hostId);
		int totalPage = (int) Math.ceil((double) totalData / numPerpage);
		System.out.println(hostId+" "+totalData);
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
		Gson gson= new Gson();
		List<Calc> calcList=new CalcService().selectAllcalcByhostId(hostId, cPage, numPerpage);
		//int month=Integer.parseInt(request.getParameter("month")); 사용자에게 입력 받음 
		int calcReqDate= host.getCalcReqDate();
		int month=5;
		//List<Calc> cList= new CalcService().selectCalcByMonth(hostId,month,calcReqDate);
		if(calcList.isEmpty()||calcList==null) {
			System.out.println("selectAllcalcByhostId 없음없");
			Host newHost=new HostService().selectByhostId(hostId);
			session.setAttribute("loginHost", newHost);
		}else {
			System.out.println("selectAllcalcByhostId 있음있");
			request.setAttribute("calcList",calcList);				
			request.setAttribute("cPage", cPage);
			gson.toJson(calcList,response.getWriter());
		}
		request.getRequestDispatcher("/views/host/viewHostCalc.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
