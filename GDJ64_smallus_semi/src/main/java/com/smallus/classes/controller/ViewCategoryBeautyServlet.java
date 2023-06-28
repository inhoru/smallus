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
 * Servlet implementation class ViewCategoryBeautyServlet
 */
@WebServlet("/categoryBeauty.do")
public class ViewCategoryBeautyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewCategoryBeautyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String categoryId=request.getParameter("categoryId");
		List<ClassIndex> newBeauty= new MainService().selectNewClassByCategory(categoryId);
		if(newBeauty!=null && !newBeauty.isEmpty()) {
			System.out.println("newBeauty O");
		}
		request.setAttribute("newBeauty", newBeauty);
		System.out.println(categoryId);
		String categoryTitle="";
		if(categoryId.equals("BEA")) {
			categoryTitle="뷰티";
		}
		List<ClassIndex> bestBeauty= new MainService().selectBestClassByCategory(categoryTitle);
		request.setAttribute("bestBeauty", bestBeauty);
		if(newBeauty!=null && !newBeauty.isEmpty() && bestBeauty!=null && !bestBeauty.isEmpty()) {
			System.out.println("성");
		}
		request.getRequestDispatcher("/views/main/viewCategoryBeauty.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
