package com.smallus.host.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class AjaxViewHostCalcServlet
 */
@WebServlet(name = "/host/ajaxViewHostCalc.do", urlPatterns = { "/host/ajaxViewHostCalc.do" })
public class AjaxViewHostCalcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxViewHostCalcServlet() {
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
		
		List<Calc> calcList=new CalcService().selectAllcalcByhostId(hostId, 1, 10);
		if(calcList.isEmpty()||calcList==null) {
			System.out.println("ajax calcList 없음없");
		}else {
			System.out.println("ajax calcList 있음있");
			Host newHost=new HostService().selectByhostId(hostId);
			session.setAttribute("loginHost", newHost);
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out=response.getWriter();
			out.print(calcList);
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
