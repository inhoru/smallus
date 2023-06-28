package com.smallus.classes.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smallus.classes.model.service.ClassService;
import com.smallus.classes.model.service.ClassService2;
import com.smallus.classes.model.vo.ClassDetail;
import com.smallus.classes.model.vo.Classes;

/**
 * Servlet implementation class ViewClassPageServlet
 */
@WebServlet("/class/viewClassPage.do")
public class ViewClassPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewClassPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String classId=request.getParameter("classId");
		
		
		Classes classInfo= new ClassService2().selectClassByClassId(classId);
		List<ClassDetail> classSchedule=new ClassService().selectClassDetailByClassId(classId);
		
		request.setAttribute("classinfo",classInfo);
		request.setAttribute("classSchedule", classSchedule);
		
		request.getRequestDispatcher("/views/class/classDetail.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
