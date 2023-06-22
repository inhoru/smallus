package com.smallus.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smallus.member.model.vo.Member;
import com.smallus.member.service.MemberService;

/**
 * Servlet implementation class MemberFileUploadServlet
 */
@WebServlet("/member/insertMember.do")
public class MemberUpdateprofilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateprofilServlet() {
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
		String path=getServletContext().getRealPath("/upload/mypageprofile");
		int maxSize=1024*1024*100;
		String encode="UTF-8";
		DefaultFileRenamePolicy dfr=new DefaultFileRenamePolicy();
		MultipartRequest mr=new MultipartRequest(request,path,maxSize,encode,dfr);
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		Member infoMember = (Member) request.getAttribute("infoMember");
		String memberId=loginMember.getMemberId();
		String memberNickname=mr.getParameter("memberNickname");
		String renamefilename=mr.getFilesystemName("i-upFile");
		
		
		if(renamefilename!=null) {
			Member m=Member.builder().memberNickname(memberNickname).memberImg(renamefilename).build();
			int result=new MemberService().updateMember(m,memberId);
			String msg="수정이 완료되었습니다.",loc="/memberprofile.do";
			if(result==0) {
				msg="수정을 실패하였습니다.";
			}
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}else {			
			Member m=Member.builder().memberNickname(memberNickname).memberImg(infoMember.getMemberImg()).build();
			int result=new MemberService().updateMember(m,memberId);
			String msg="수정이 완료되었습니다.",loc="/memberprofile.do";
			if(result==0) {
				msg="수정을 실패하였습니다.";
			}
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			
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
