package com.smallus.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smallus.member.model.vo.Member;
import com.smallus.member.service.MemberService;

/**
 * Servlet implementation class MemberwithdrawalEndSerlvet
 */
@WebServlet("/withdrawalEnd.do")
public class MemberwithdrawalEndSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberwithdrawalEndSerlvet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(false);
		Member loginMember = (Member) session.getAttribute("loginMember");
		String password=request.getParameter("password");
		System.out.println(loginMember);
		System.out.println(password);
	int result=new MemberService().deleteByMember(loginMember.getMemberId(),password);
	String msg="탈퇴가 완료되었습니다.",loc="/";
	if(result==0) {
		msg="비밀번호가 일치하지않습니다.";
		loc="/withdrawalPassword.do";
	}else {		
		if(session!=null)
			session.invalidate();
	}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
