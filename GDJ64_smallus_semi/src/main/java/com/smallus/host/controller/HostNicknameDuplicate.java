package com.smallus.host.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smallus.host.model.vo.Host;
import com.smallus.host.service.HostService;



/**
 * Servlet implementation class hostNicknameDuplicate
 */
@WebServlet("/host/nicknameDuplicate.do")
public class HostNicknameDuplicate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HostNicknameDuplicate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hostNickname=request.getParameter("hostNickname");
//		System.out.println(hostNickname);
		Host h=new HostService().selectByhostNickname(hostNickname);
//		System.out.println(h);
		request.setAttribute("hostNickname", h);
		request.getRequestDispatcher("/views/host/nicknameDuplicate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
