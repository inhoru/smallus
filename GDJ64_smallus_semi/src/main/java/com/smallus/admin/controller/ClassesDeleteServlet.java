package com.smallus.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smallus.admin.service.AdminService;

/**
 * Servlet implementation class ClassesDeleteServlet
 */
@WebServlet("/admin/ClassesDeleteServlet.do")
public class ClassesDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassesDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String classId=request.getParameter("classId");
		System.out.println(classId);
		int result=new AdminService().deleteByClass(classId);
		String msg,loc;
		if(result>0) {
			msg="클래스 게시중단을 완료했습니다.";
			loc="/admin/ClassesListServlet.do";
		}else {
			msg="클래스 게시중단을 실패했습니다.";
			loc="/admin/ClassesListServlet.do";
		}
		request.setAttribute("msg",msg);
		request.setAttribute("loc",loc);
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
