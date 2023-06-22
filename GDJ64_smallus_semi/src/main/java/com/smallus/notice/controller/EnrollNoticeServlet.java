package com.smallus.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smallus.notice.model.vo.Notice;
import com.smallus.notice.service.NoticeService;

/**
 * Servlet implementation class EnrollNoticeServlet
 */
@WebServlet("/notice/enrollNotice.do")
public class EnrollNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hostId=request.getParameter("hostId");
		String noticeType=request.getParameter("noticeType");
		String noticeTitle=request.getParameter("noticeTitle");
		String noticeContent=request.getParameter("noticeContent");
		System.out.println(hostId+noticeType+noticeTitle+noticeContent);
		Notice n=Notice.builder().hostId(hostId).noticeType(noticeType).noticeTitle(noticeTitle).noticeContent(noticeContent).build();
		int result=new NoticeService().enrollNotice(n);
		String msg="",loc="";
		if(result>0) {
			//입력 성공
			msg="공지사항을 등록했습니다.";
			loc="/views/admin/NoticeList.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
//			request.getRequestDispatcher("/views/host/hostLogin.jsp").forward(request, response);
		}else {
			//입력 실패
			msg="공지사항등록 실패하였습니다. :( \n다시시도하세요";
			loc="/views/admin/adminNoticeEnroll.jsp";
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
