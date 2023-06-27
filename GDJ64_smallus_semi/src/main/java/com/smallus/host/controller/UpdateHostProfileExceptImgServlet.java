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
 * Servlet implementation class UpdateHostProfileExceptImgServlet
 */
@WebServlet("/host/updateProfileExp.do")
public class UpdateHostProfileExceptImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateHostProfileExceptImgServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Host loginHost = (Host) session.getAttribute("loginHost");
		String hostId=(loginHost.getHostId());

		String hostNickname=request.getParameter("hostNickname");
		String hostPw=request.getParameter("password");
		String hostHomePhone=request.getParameter("hostHomePhone");
		String hostEmail=request.getParameter("hostEmail");
	
		System.out.println(hostId+" "+hostNickname+" "+hostPw+" "+hostHomePhone+" "+hostEmail);
		Host host=Host.builder()
					.hostNickname(hostNickname)
					.hostPw(hostPw)
					.hostHomephone(hostHomePhone)
					.hostEmail(hostEmail).build();
		
		int result=new HostService().updateHostProfile(host,hostId);
		Host updateHost=new HostService().selectByhostId(hostId);
		session.setAttribute("loginHost",updateHost);
	
		if(result>0) {
			System.out.println("수정 성공");
		}else {
			System.out.println("수정 실패");
			
		}
		response.setContentType("text/csv;charset=utf-8");
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
