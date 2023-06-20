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
 * Servlet implementation class EnrollHostServlet
 */
@WebServlet("/host/enrollHost.do")
public class EnrollHostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollHostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hostId=request.getParameter("hostId");
		String hostPw=request.getParameter("password");
		String hostName=request.getParameter("hostName");
		String hostNickname=request.getParameter("hostNickname");
		String hostEmail=request.getParameter("hostEmail");
		String hostPhone=request.getParameter("hostPhone");
		String hostHomePhone=request.getParameter("hostHomePhone");
		
		Host h=Host.builder().
				hostId(hostId).
				hostPw(hostPw).
				hostName(hostName).
				hostNickname(hostNickname).
				hostEmail(hostEmail).
				hostPhone(hostPhone).
				hostHomephone(hostHomePhone).
				build();
//		System.out.println(h);
	int result=new HostService().enrollHost(h);
	String msg="",loc="";
	if(result>0) {
		//입력 성공
		msg="호스트 회원가입을 축하드립니다!";
		loc="/";
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
//		request.getRequestDispatcher("/views/host/hostLogin.jsp").forward(request, response);
	}else {
		//입력 실패
		msg="회원가입에 실패하였습니다. :( \n다시시도하세요";
		loc="/host/enrollhost.do";
	}
	request.setAttribute("msg", msg);
	request.setAttribute("loc", loc);
	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
