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
 * Servlet implementation class MainToClassDetailServlet
 */
@WebServlet("/maintoclass.do")
public class MainToClassDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainToClassDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 메인(카테고리별, 검색결과 등) 에서 상세페이지로 이동하는 서블릿
		// '단일 클래스'의 정보와 스케쥴을 같이 가져옴
		
		/* String classId=request.getParameter("classId"); */
		String classId="CLS20230622-2"; //임시 클래스아이디 정보
		
		Classes classInfo= new ClassService2().selectClassByClassId(classId);
		List<ClassDetail> classSchedule=new ClassService().selectClassDetailByClassId(classId);
		
		request.setAttribute("classinfo",classInfo);
		request.setAttribute("classSchedult", classSchedule);
		
		request.getRequestDispatcher("/views/class/ClassDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
