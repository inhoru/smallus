package com.smallus.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smallus.admin.service.AdminService;

/**
 * Servlet implementation class CalcRejectServlet
 */
@WebServlet("/admin/CalcRejectServlet.do")
public class CalcRejectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalcRejectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String calcId=request.getParameter("calcId");
		System.out.println(calcId);
		int result=new AdminService().calcReject(calcId);
		String msg="",loc="";
		if(result>0) {
			msg="호스트 정산요청 거철처리에 성공하였습니다.";
			loc="/admin/ClacConfirmListServlet.do";
		}else {
			msg="호스트 정산요청 거절처리에 실패하였습니다.";
			loc="/admin/ClacConfirmListServlet.do";
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
