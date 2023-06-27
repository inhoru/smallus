package com.smallus.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smallus.admin.service.AdminService;

/**
 * Servlet implementation class InquiryEnrollServlet
 */
@WebServlet("/admin/InquiryEnrollServlet.do")
public class InquiryEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryEnrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardId=request.getParameter("boardId");
		String commentConent=request.getParameter("commentConent");
		int result=new AdminService().inquiryAnswerEnroll(boardId,commentConent);
		String boardCheck="답변완료";
		int result2=new AdminService().inquiryUpdate(boardId,boardCheck);
		String msg,loc;
		if(result>0) {
			msg="1:1문의 답변완료 했습니다.";
			loc="/admin/InquiryListServlet.do";
		}else {
			msg="1:1문의 답변실패 했습니다.";
			loc="/admin/InquiryListServlet.do";
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
