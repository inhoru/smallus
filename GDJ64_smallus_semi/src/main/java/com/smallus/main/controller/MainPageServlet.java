package com.smallus.main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smallus.classes.model.vo.ClassIndex;
import com.smallus.main.model.vo.Wish;
import com.smallus.main.service.MainService;
import com.smallus.member.model.vo.Member;

/**
 * Servlet implementation class MainPageServlet
 */
@WebServlet("/mainPage.do")
public class MainPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//List<Classes> list=new MainService().mainPage();
		//System.out.println(list);
		


		List<ClassIndex> newClass = new MainService().NewClassList();
		List<ClassIndex> wishClass= new MainService().wishClassList();
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		request.setAttribute("wishClass", wishClass);
		request.setAttribute("newClass", newClass);
		
		request.getRequestDispatcher("/views/host/expClass.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
