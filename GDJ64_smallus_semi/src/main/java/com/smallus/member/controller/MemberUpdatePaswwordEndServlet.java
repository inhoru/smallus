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
 * Servlet implementation class UpdatePaswwordEndServlet
 */
@WebServlet("/updatePasswordEnd")
public class MemberUpdatePaswwordEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberUpdatePaswwordEndServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = request.getParameter("i-userId");
		String oriPw = request.getParameter("password");
		String newPw = request.getParameter("password_new");
		String newPw2 = request.getParameter("password_chk");
		Member m = null;
		if (newPw.equals(newPw2) ) {
			m = new MemberService().memberLogin(userId, oriPw);
			System.out.println(m);
		}

		String msg = "";
		String loc = "/member/updatePassword.do?userId=" + userId;
		if (m == null) {
			// 비밀번호가 일치하지않음
			msg = "비밀번호가 일치하지않습니다.";

		} else {
			// 비밀번호가 일치함
			int result = new MemberService().updatePassword(userId, newPw);
			if (result > 0) {

				msg = "비밀번호가 수정완료";
				loc = "/";
				request.setAttribute("script",
						"opener.location.replace('" + request.getContextPath() + "/logout.do');close();");

			} else {
				msg = "비밀번호 수정실패";

			}

		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
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
