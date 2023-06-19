package com.smallus.classes.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smallus.classes.model.service.ClassService;
import com.smallus.classes.model.vo.Classes;

/**
 * Servlet implementation class SortingClassByPassServlet
 */
@WebServlet("/class/sortingClassByPass.do")
public class SortingClassByPassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SortingClassByPassServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String passStatus=request.getParameter("passStatus");
		String hostId=request.getParameter("hostId");
		System.out.println(passStatus);
		List<Classes> classListPass = new ClassService().selectClassListByPassStatus(hostId, passStatus);
		request.setAttribute("classListPass", classListPass);
		if(classListPass!=null&&!classListPass.isEmpty()) {
			
			System.out.println("classListPass있음 ");
		}else {
			System.out.println("classListPass 없 음 ");
		}
		request.getRequestDispatcher("/views/host/hostClassList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
