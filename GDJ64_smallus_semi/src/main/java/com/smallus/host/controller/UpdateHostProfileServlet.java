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
 * Servlet implementation class UpdateHostProfileServlet
 */
@WebServlet("/host/updateHostProfile.do")
public class UpdateHostProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateHostProfileServlet() {
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
		String hostPw=request.getParameter("hostPw");
		String hostHomePhone=request.getParameter("hostHomePhone");
		String hostImg=request.getParameter("hostImg");
		if(hostImg.isEmpty()||hostImg==null) {
			hostImg="DEFAULT";
		}
		if(hostPw.equals("••••••••")) {
			hostPw="1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==";
		}
		System.out.println(hostId+" "+hostNickname+" "+hostPw+" "+hostHomePhone+" "+hostImg);
		
		int data=new HostService().updateHostProfile(hostId,hostNickname,hostPw,hostHomePhone,hostImg);
		System.out.println(data);
		//response.setContentType("text/csv;charset=utf-8");
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
