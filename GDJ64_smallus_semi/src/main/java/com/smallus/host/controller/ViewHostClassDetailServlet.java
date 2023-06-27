package com.smallus.host.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smallus.classes.model.service.ClassService;
import com.smallus.classes.model.vo.ClassDetail;
import com.smallus.classes.model.vo.Classes;
import com.smallus.host.model.vo.Host;

/**
 * Servlet implementation class VewClassDetailServlet
 */
@WebServlet("/class/viewHostClassDetail.do")
public class ViewHostClassDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewHostClassDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 호스트 아이디를 기준으로 클래스 세부 내용을 가져옴
		HttpSession session= request.getSession();
		Host host=(Host)session.getAttribute("loginHost");
		String hostId=host.getHostId();
		
		// 클래스 아이디를 기준으로 클래스리스트를 가져옴
		String classId=request.getParameter("classId");
		System.out.println(hostId+""+classId);
		Classes list =new ClassService().selectClassByClassId(hostId, classId);
		List<ClassDetail> classDetailList = new ClassService().selectClassDetailByClassId(classId);
		// 분기처리 후 클래스 상세 페이지로 전송
		System.out.println(list+""+classDetailList);
		
		if(list!=null||(classDetailList!=null&&!classDetailList.isEmpty())) {
			request.setAttribute("list", list);
			request.setAttribute("classDetailList", classDetailList);
			request.getRequestDispatcher("/views/host/viewHostClassDetail.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "조회할 클래스가 없습니다.");
			request.setAttribute("loc", "/views/host/viewHostClassList.jsp");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
