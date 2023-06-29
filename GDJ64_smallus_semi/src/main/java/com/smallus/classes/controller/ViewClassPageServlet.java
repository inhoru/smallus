package com.smallus.classes.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smallus.classes.model.service.ClassService;
import com.smallus.classes.model.service.ClassService2;
import com.smallus.classes.model.vo.ClassDetail;
import com.smallus.classes.model.vo.ClassIndex;
import com.smallus.classes.model.vo.Classes;
import com.smallus.main.model.vo.Wish;
import com.smallus.main.service.MainService;
import com.smallus.member.model.vo.Member;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String classId = request.getParameter("classId");
		
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		Classes classInfo = new ClassService2().selectClassByClassId(classId);
		List<ClassDetail> classSchedule = new ClassService().selectClassDetailByClassId(classId);
		if(loginMember!=null) {
			String memberId=loginMember.getMemberId();
			List<Wish> wishMember= new MainService().wishMember(memberId);
			session.setAttribute("wishMember", wishMember);
			
		}
		request.setAttribute("classinfo", classInfo);
		request.setAttribute("classSchedule", classSchedule);
		request.setAttribute("classId", classId);

		request.getRequestDispatcher("/views/class/classDetail.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
