package com.smallus.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smallus.member.model.vo.Member;
import com.smallus.member.model.vo.Notifications;
import com.smallus.member.service.MemberService;

/**
 * Servlet implementation class MemberNotificationsServlet
 */
@WebServlet("/notificationsRemove.do")
public class MemberNotificationsRemoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberNotificationsRemoveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String notId=request.getParameter("notId");
		
		HttpSession session=request.getSession();
		int result = new MemberService().notifications(notId);
		Member loginMember = (Member) session.getAttribute("loginMember");
		String memberId=loginMember.getMemberId();
		List<Notifications> list =new MemberService().selectAllNotifications(memberId);
		int notcount = new MemberService().notificationsCount(memberId);
		session.setAttribute("notcount",notcount);
		session.setAttribute("Notlist",list);
		
		
		
	}	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
