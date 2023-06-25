package com.smallus.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smallus.notice.model.vo.Notice;
import com.smallus.notice.model.vo.NoticeImage;
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
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg","잘못된 접근입니다. 관리자에게 문의하세요 :(");
			request.setAttribute("loc","/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		String path=getServletContext().getRealPath("/upload/notice");
		System.out.println(path);
		int maxSize=1024*1024*100;
		String encode="UTF-8";
		DefaultFileRenamePolicy dfr=new DefaultFileRenamePolicy();
		MultipartRequest mr=new MultipartRequest(request,path,maxSize,encode,dfr);
		
		String hostId=mr.getParameter("hostId");
		String noticeType=mr.getParameter("noticeType");
		String noticeTitle=mr.getParameter("noticeTitle");
		String noticeContent=mr.getParameter("noticeContent");
		String noticeImageOrignal=mr.getOriginalFileName("m-upFile");
		String noticeImageRename=mr.getFilesystemName("m-upFile");
		System.out.println(hostId+noticeType+noticeTitle+noticeContent+noticeImageOrignal);
		Notice n=Notice.builder().hostId(hostId).noticeType(noticeType).noticeTitle(noticeTitle).noticeContent(noticeContent).build();
		int result=new NoticeService().enrollNotice(n);
		Notice notice=new NoticeService().selectNotice(n);
		String noticeId=notice.getNoticeId();
		System.out.println(noticeId);
		String msg,loc;
		if(noticeId==null) {
			msg="공지사항 등록을 실패하였습니다. :( \n다시시도하세요";
			loc="/admin/noticeListServlet.do";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		NoticeImage ni=NoticeImage.builder().noticeId(noticeId).noticeImageOrignal(noticeImageOrignal).noticeImageRename(noticeImageRename).build();
		int result2=new NoticeService().enrollNoticeImg(ni);
		
		if(result>0&&result2>0) {
			//입력 성공
			msg="새 공지사항을 등록했습니다.";
			loc="/views/admin/adminMain.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
//			request.getRequestDispatcher("/views/host/hostLogin.jsp").forward(request, response);
		}else {
			//입력 실패
			msg="공지사항 등록을 실패하였습니다. :( \n다시시도하세요";
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
