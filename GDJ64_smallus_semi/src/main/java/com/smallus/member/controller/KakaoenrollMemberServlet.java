package com.smallus.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smallus.member.model.vo.Member;
import com.smallus.member.service.MemberService;

/**
 * Servlet implementation class KakaoenrollMemberServlet
 */
@WebServlet("/member/KakaoenrollMember.do")
public class KakaoenrollMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoenrollMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberEmail=request.getParameter("memberEmail");
		String memberName=request.getParameter("memberName");
		String memberNickname=request.getParameter("memberNickname");
		String memberPhone=request.getParameter("memberPhone");
		String[] memberIds=memberEmail.split("@");
		String memberId=memberIds[0];
		String memberPw="1234";
//		System.out.println(memberEmail);
//		System.out.println(memberName);
//		System.out.println(memberPhone);
//		System.out.println(memberId);
		Member m=Member.builder().
				memberId(memberId).
				memberPw(memberPw).
				memberName(memberName).
				memberNickname(memberNickname).
				memberEmail(memberEmail).
				memberPhone(memberPhone).
				build();
		int result=new MemberService().KakaoenrollMember(m);
		String msg="",loc="";
		if(result>0) {
			//입력 성공
//			msg="회원가입을 축하드립니다!";
//			loc="/";
//			request.setAttribute("msg", msg);
//			request.setAttribute("loc", loc);
//			request.getRequestDispatcher("/member/KakaoLogin.do").forward(request, response);
			System.out.println(memberEmail);
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out=response.getWriter();
			out.print(memberEmail);
			return;
		}else {
			//입력 실패
			msg="카카오 로그인에 실패하였습니다. :( \n다시시도하세요";
			loc="/views/member/memberLogin.jsp";
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
