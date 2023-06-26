package com.smallus.classes.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smallus.host.model.vo.Host;

/**
 * Servlet implementation class InsertClassDetailServlet
 */
@WebServlet("/class/insertClassDetail.do")
public class InsertClassDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertClassDetailServlet() {
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
		int result=0;
		//int result= new ClassService().insertClassDetail(hostId);
		String msg; String loc;
		if(result>0) {
			System.out.println(result);
			msg="클래스 세부 일정 등록을 성공 했습니다 :)";
			loc="/views/host/viewHostClassDetail.jsp";
		}else {
			msg="클래스 세부 일정 등록을 실패했습니다 ;(";
			loc="/";
					
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher(loc).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
