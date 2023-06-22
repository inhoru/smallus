package com.smallus.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smallus.admin.service.AdminService;

/**
 * Servlet implementation class ClassesConfirmServlet
 */
@WebServlet("/admin/ClassesReject.do")
public class ClassesrRejectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassesrRejectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String classPassId=request.getParameter("classPassId");
		String classId=request.getParameter("classId");
		System.out.println(classPassId);
		System.out.println(classId);
		int result=new AdminService().classReject(classPassId,classId);
		System.out.println(result);
		String msg="",loc="";
		if(result>0) {
			msg="클래스 거절처리에 성공하였습니다.";
			request.setAttribute("msg", msg);
		}else {
			msg="클래스 거절처리에 실패하였습니다.";
			request.setAttribute("msg", msg);
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
