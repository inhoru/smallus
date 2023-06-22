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
 * Servlet implementation class KakaoLoginCheckServlet
 */
@WebServlet("/member/KakaoLoginCheck.do")
public class KakaoLoginCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoLoginCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberEmail=request.getParameter("memberEmail");
		String memberName=request.getParameter("memberName");
		String[] memberIds=memberEmail.split("@");
		String memberId=memberIds[0];
		System.out.println(memberId);
		Member m=new MemberService().selectByMemberId(memberId);
		System.out.println(m);
//		if(m==null) {
//			request.getRequestDispatcher("/views/member/kakaoenroll.jsp?email="+memberEmail+"&name="+memberName+"&memberNickname="+memberName).forward(request, response);
//		}else {
//			request.getRequestDispatcher("/member/KakaoLogin.do").forward(request, response);
//		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.print(m);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
