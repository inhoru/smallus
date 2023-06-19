package com.smallus.host.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smallus.classes.model.vo.Classes;
import com.smallus.host.service.HostService;

/**
 * Servlet implementation class ViewClassListServlet
 */
@WebServlet("/host/viewClassList.do")
public class ViewClassListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewClassListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String hostId=request.getParameter("hostId");
		System.out.println(hostId);
		List<Classes> classList=new HostService().selectClassesByHostId(hostId);
		if(classList!=null&&!classList.isEmpty()) {
			request.setAttribute("classList", classList);
			request.getRequestDispatcher("/views/host/hostClassList.jsp").forward(request, response);
			System.out.println("클래스 있음 ");
			System.out.println(classList.size());
		}else {
			System.out.println("클래스 djqt음 ");
			request.setAttribute("msg", "조회할 클래스가 없습니다.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
