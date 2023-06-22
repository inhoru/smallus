package com.smallus.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smallus.member.model.vo.Member;
import com.smallus.member.service.MemberService;


/**
 * Servlet implementation class EnrollMember
 */
@WebServlet("/member/enrollMember.do")
public class EnrollMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId=request.getParameter("memberId");
		String memberPw=request.getParameter("password");
		String memberName=request.getParameter("memberName");
		String memberNickname=request.getParameter("membernickName");
		String memberEmail=request.getParameter("memberEmail");
		String memberConsent=request.getParameter("memberConsent");
		if(memberConsent.equals("on")) {
			memberConsent="Y";
		}else {
			memberConsent="N";
		}
		//checkbox에 check가 되면 on
		//checkbox에 check가 안되면 null
		String memberPhone=request.getParameter("memberPhone");
		Member m=Member.builder().
				memberId(memberId).
				memberPw(memberPw).
				memberName(memberName).
				memberNickname(memberNickname).
				memberEmail(memberEmail).
				memberConsent(memberConsent).
				memberPhone(memberPhone).
				build();
//		System.out.println(m);
	int result=new MemberService().enrollMember(m);
	String msg="",loc="";
	if(result>0) {
		//입력 성공
		msg="회원가입을 축하드립니다!";
		loc="/";
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
//		request.getRequestDispatcher("/views/member/memberLogin.jsp").forward(request, response);
	}else {
		//입력 실패
		msg="회원가입에 실패하였습니다. :( \n다시시도하세요";
		loc="/member/enrollMember.do";
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