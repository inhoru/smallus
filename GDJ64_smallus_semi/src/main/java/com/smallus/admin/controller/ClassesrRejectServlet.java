package com.smallus.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smallus.admin.service.AdminService;
import com.smallus.classes.model.vo.Classes;
import com.smallus.host.service.HostService;
import com.smallus.member.model.vo.Notifications;

/**
 * Servlet implementation class ClassesConfirmServlet
 */
@WebServlet("/admin/ClassesReject.do")
public class ClassesrRejectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassesrRejectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String classPassId=request.getParameter("classPassId");
		String classId=request.getParameter("classId");
		System.out.println(classPassId);
		System.out.println(classId);
		int result=new AdminService().classReject(classPassId,classId);
		Classes c=new AdminService().classHostId(classId);
		System.out.println(result);
		String msg="",loc="";
		if(result>0) {
			HttpSession session=request.getSession();
			Classes n=new AdminService().classHostId(classId);
			String d=n.getClassTitle();
			int insertNot=new HostService().insertNot2(c.getHostId(),d);
			List<Notifications> list =new HostService().selectAllNotifications(c.getHostId());
			int notcount = new HostService().notificationsCount(c.getHostId());
			
			session.setAttribute("notcount",notcount);
			session.setAttribute("Notlist",list);
			msg="클래스 거절처리에 성공하였습니다.";
			request.setAttribute("msg", msg);
		}else {
			msg="클래스 거절처리에 실패하였습니다.";
			request.setAttribute("msg", msg);
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
