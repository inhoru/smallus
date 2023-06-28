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
 * Servlet implementation class ViewCategoryActivityServlet
 */
@WebServlet("/categoryActivity.do")
public class ViewCategoryExerciseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewCategoryExerciseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String categoryId=request.getParameter("categoryId");
		List<ClassIndex> newExe= new MainService().selectNewClassByCategory(categoryId);
		if(newExe!=null && !newExe.isEmpty()) {
			System.out.println("newExe O");
		}
		request.setAttribute("newExe", newExe);
		System.out.println(categoryId);
		String categoryTitle="";
		if(categoryId.equals("EXE")) {
			categoryTitle="운동";
		}
		List<ClassIndex> bestExe= new MainService().selectBestClassByCategory(categoryTitle);
		request.setAttribute("bestExe", bestExe);
		if(newExe!=null && !newExe.isEmpty() && bestExe!=null && !bestExe.isEmpty()) {
			System.out.println("성");
		}
		request.getRequestDispatcher("/views/main/viewCategoryExercise.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
