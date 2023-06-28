package com.smallus.classes.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smallus.classes.model.vo.ClassIndex;
import com.smallus.main.service.MainService;

/**
 * Servlet implementation class ViewCategoryCraftServlet
 */
@WebServlet("/categoryCraft.do")
public class ViewCategoryCraftServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewCategoryCraftServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String categoryId=request.getParameter("categoryId");
		List<ClassIndex> newCraft= new MainService().selectNewClassByCategory(categoryId);
		if(newCraft!=null && !newCraft.isEmpty()) {
			System.out.println("newCraft O");
		}
		request.setAttribute("newCraft", newCraft);
		System.out.println(categoryId);
		String categoryTitle="";
		if(categoryId.equals("CRA")) {
			categoryTitle="공예";
		}
//		CRA 공예
//		BEA 뷰티
//		EXE 운동
//		COO 요리
		List<ClassIndex> bestCraft= new MainService().selectBestClassByCategory(categoryTitle);
		request.setAttribute("bestCraft", bestCraft);
		if(newCraft!=null && !newCraft.isEmpty() && bestCraft!=null && !bestCraft.isEmpty()) {
			System.out.println("성");
		}
		request.getRequestDispatcher("/views/main/viewCategoryCraft.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
