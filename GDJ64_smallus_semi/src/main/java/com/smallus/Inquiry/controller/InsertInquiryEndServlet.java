package com.smallus.Inquiry.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smallus.Inquiry.model.service.InquiryService;
import com.smallus.member.model.vo.Member;

/**
 * Servlet implementation class InsertInquiryEndServlet
 */
@WebServlet("/insertInquiryEnd.do")
public class InsertInquiryEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertInquiryEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "잘못된 접근입니다. 관리자에게 문의하세요 :(");
			request.setAttribute("loc","/");
			request.getRequestDispatcher("/views/common/msg.jsp")
			.forward(request, response);
			return;
		}
		
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		String path=getServletContext().getRealPath("/img/inquiry");
		
		MultipartRequest mr=new MultipartRequest(request,path,1024*1024*10,"utf-8",new DefaultFileRenamePolicy());
		String boardTitle=mr.getParameter("boardTitle");
		String boardContent=mr.getParameter("boardContent");
		String boardType=mr.getParameter("boardType");
		  List<String> files=new ArrayList();
			Enumeration<String> names= mr.getFileNames();
	     while(names.hasMoreElements()) {
				String imgs=names.nextElement();
				files.add(mr.getFilesystemName(imgs));		
			}
		int result=new InquiryService().InsertInquiry(loginMember.getMemberId(),boardType,boardTitle,boardContent,files);		
		
	 	String msg="",loc="";
	     if(result>0) {
				msg="게시글이 등록 되었습니다.";
				loc="/memberInquiry.do";
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
			}else {
				//입력 실패
				msg="게시글등록에 실패하였습니다.";
				loc="/memberInquiry.do";
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
