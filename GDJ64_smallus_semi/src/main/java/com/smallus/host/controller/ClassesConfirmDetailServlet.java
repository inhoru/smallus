package com.smallus.host.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smallus.admin.service.AdminService;
import com.smallus.classes.model.vo.Classes;

/**
 * Servlet implementation class ClassesConfirmDetailServlet
 */
@WebServlet("/host/viewClasseByHost.do")
public class ClassesConfirmDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassesConfirmDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String classId=request.getParameter("classId");
		System.out.println(classId);
		Classes classinfo=new AdminService().selectByClassId(classId);
		String msg,loc;
		if(classinfo!=null) {
			request.setAttribute("classinfo", classinfo);
			request.getRequestDispatcher("/views/host/hostClassConfirmDetail.jsp").forward(request, response);
			return;
		}else {
			msg="조회된 클래스가 없습니다.";
			loc="/class/viewHostClassDetail.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
