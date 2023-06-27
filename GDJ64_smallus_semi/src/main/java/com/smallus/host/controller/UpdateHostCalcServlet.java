package com.smallus.host.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smallus.host.model.vo.Host;
import com.smallus.host.service.HostService;

/**
 * Servlet implementation class UpdateHostCalcServlet
 */
@WebServlet("/host/updateHostAccount.do")
public class UpdateHostCalcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateHostCalcServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		Host loginHost = (Host) session.getAttribute("loginHost");
		String hostId=(loginHost.getHostId());
		
		String hostAccountBank=request.getParameter("hostAccountBank");
		String hostAccount=request.getParameter("hostAccount");
		String hostAccountName=request.getParameter("hostAccountName");
		int calcReqDate=Integer.parseInt(request.getParameter("calcReqDate"));
		int result= new HostService().updateHostCalc(hostAccountBank, hostAccount, hostAccountName, calcReqDate, hostId);
		Host host=new HostService().selectByhostId(hostId);
		//System.out.println(hostId+" "+hostAccountBank+""+hostAccount+""+hostAccountName+""+calcReqDate);
		//System.out.println("calcReqDate : "+calcReqDate+" result : "+result);
		if(result>0) {
			session.setAttribute("loginHost", host);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.print(hostAccountBank);
			out.print(hostAccount);
			out.print(hostAccountName);
			out.print(calcReqDate);
		}else {
			request.setAttribute("msg", "저장에 실패 했습니다 ;(");
			request.setAttribute("loc", "/views/host/viewHostCalc.jsp");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
	}

}
