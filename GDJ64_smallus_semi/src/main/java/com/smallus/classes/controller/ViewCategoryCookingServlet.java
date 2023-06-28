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
 * Servlet implementation class ViewCategoryCookingServlet
 */
@WebServlet("/categoryCooking.do")
public class ViewCategoryCookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewCategoryCookingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String categoryId=request.getParameter("categoryId");
		//List<ClassIndex> allCooking= new MainService().selectAllclassByCategory(categoryId, cPage, numPerpage);
		List<ClassIndex> newCooking= new MainService().selectNewClassByCategory(categoryId);
		if(newCooking!=null && !newCooking.isEmpty()) {
			System.out.println("newCooking O");
		}
		request.setAttribute("newCooking", newCooking);
		System.out.println(categoryId);
		String categoryTitle="";
		if(categoryId.equals("COO")) {
			categoryTitle="요리";
		}
		System.out.println(categoryTitle);
//		CRA 공예
//		BEA 뷰티
//		EXE 운동
//		COO 요리
		List<ClassIndex> bestCooking= new MainService().selectBestClassByCategory(categoryTitle);
		request.setAttribute("bestCooking", bestCooking);
		if(newCooking!=null && !newCooking.isEmpty() && bestCooking!=null && !bestCooking.isEmpty()) {
			System.out.println("성");
		}
		request.getRequestDispatcher("/views/main/viewCategoryCooking.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
