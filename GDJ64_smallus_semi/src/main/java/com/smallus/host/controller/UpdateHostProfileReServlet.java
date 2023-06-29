package com.smallus.host.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smallus.host.model.vo.Host;
import com.smallus.host.service.HostService;

/**
 * Servlet implementation class UpdateHostProfileReServlet
 */
@WebServlet("/host/updateProfileExp.do")
public class UpdateHostProfileReServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateHostProfileReServlet() {
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

				String hostNickname=request.getParameter("hostNickname");
				String hostPw=request.getParameter("password");
				String hostHomePhone= request.getParameter("hostHomePhone");
				String hostEmail= request.getParameter("hostEmail");
				System.out.println(hostId+" "+hostNickname+" "+hostPw+" "+hostHomePhone);
				Host h=Host.builder()
						.hostId(hostId)
						.hostNickname(hostNickname)
						.hostPw(hostPw)
						.hostHomephone(hostHomePhone)
						.hostEmail(hostEmail)
						.build();
			
				int data=new HostService().updateHostProfile(h);
				Host newHost=new HostService().selectByhostId(hostId);
				session.setAttribute("loginHost", newHost);
				System.out.println(data);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().print(data);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
