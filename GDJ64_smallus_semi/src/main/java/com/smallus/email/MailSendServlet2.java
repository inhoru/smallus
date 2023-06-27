package com.smallus.email;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MailSendServlet
 */
@WebServlet("/MailSendServlet2.do")
public class MailSendServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MailSendServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hostEmail=request.getParameter("hostEmail");
		MailSend ms = new MailSend();
		System.out.println(hostEmail);
		if(hostEmail!=null) {
			String epw=ms.MailSend(hostEmail);
			System.out.println("이메일보내기성공");
			HttpSession session=request.getSession();
			session.setAttribute("epw",epw);
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out=response.getWriter();
			out.print(epw);
		}else {
			System.out.println("잘못된 이메일입니다.");
			request.setAttribute("msg","잘못된 이메일 입니다. 다시 입력해주세요.");
			request.setAttribute("loc","/views/member/memberLogin.jsp");
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
