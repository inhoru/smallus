package com.smallus.classes.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smallus.classes.model.service.ClassService;
import com.smallus.classes.model.vo.ClassIndex;

/**
 * Servlet implementation class ViewNewClassListServlet
 */
@WebServlet("/class/newClass.do")
public class ViewNewClassListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewNewClassListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<ClassIndex> list = new ClassService().newClassList();
//		request.setAttribute("newClass", list);
//		request.getRequestDispatcher("/").forward(request, response);
		System.out.println(list);
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html;charset=utf-8");
//		response.getWriter().print(list);
		Gson gson= new Gson();
		response.setContentType("application/json; charset=UTF-8");
		gson.toJson(list,response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
