package com.smallus.host.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smallus.host.model.vo.Host;
import com.smallus.host.service.HostService;
import com.smallus.member.model.vo.Member;

/**
 * Servlet implementation class UpdateHostCalcServlet
 */
@WebServlet(name = "/host/updateHostCalc.do", urlPatterns = { "//host/updateHostCalc.do" })
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
		
		HttpSession session=request.getSession();
		Host loginHost = (Host) session.getAttribute("hostInfo");
		//String hostId=loginHost.getHostId();
		
		//Host host= new HostService().updateHostCalc(hostId);
		System.out.println(loginHost);
		Gson gson= new Gson();
		response.setContentType("application/json; charset=UTF-8");
		gson.toJson(loginHost,response.getWriter()); 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
