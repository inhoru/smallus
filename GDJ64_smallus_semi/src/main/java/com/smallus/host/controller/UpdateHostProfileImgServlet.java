package com.smallus.host.controller;

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
import com.smallus.host.model.vo.Host;
import com.smallus.host.service.HostService;
import com.smallus.member.model.vo.Member;
import com.smallus.member.service.MemberService;

/**
 * Servlet implementation class UpdateHostProfileImgServlet
 */
@WebServlet("/updateHostImg.do")
public class UpdateHostProfileImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateHostProfileImgServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
//		String path=getServletContext().getRealPath("/upload/hostProfile");
//		
//		MultipartRequest mr=new MultipartRequest(request,path,
//				1024*1024*10,"UTf-8",new DefaultFileRenamePolicy());
//		
//		HttpSession session = request.getSession();
//		Host loginHost = (Host) session.getAttribute("loginHost");
//		String hostId= loginHost.getHostId();
//		String renameFile=mr.getFilesystemName("h-upFile");
//		String msg; String loc = null;
//		System.out.println(loginHost+renameFile);
//		
//		int result= new HostService().updateHostImg(renameFile, hostId);
//		Host host=new HostService().selectByhostId(hostId);
//		if(renameFile!=null&& result>0) {
//			msg="수정 성공 :)";
//			loc="/host/moveHostProfile.do";
//			Host h= new HostService().selectByhostId(hostId);
//			session.setAttribute("loginHost",h);
//		}else {
//			msg="수정 실패 :<";
//		}
//		request.setAttribute("msg", msg);
//		request.setAttribute("loc", loc);
//		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
		
//		List<Map<String,String>> files=new ArrayList();
//		Enumeration names=mr.getFileNames();
//		while(names.hasMoreElements()) {
//			String key=(String)names.nextElement();
//			System.out.println(key);
//			System.out.println(mr.getFilesystemName(key));
//			System.out.println(mr.getOriginalFileName(key));
//			files.add(Map.of("rename",mr.getFilesystemName(key),
//					"oriname",mr.getOriginalFileName(key)));
//		}
//
//		System.out.println(files);
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "잘못된 접근입니다. 관리자에게 문의하세요 :(");
			request.setAttribute("loc","/");
			request.getRequestDispatcher("/views/common/msg.jsp")
			.forward(request, response);
			return;
		}
		String path=getServletContext().getRealPath("/upload/hostProfile");
		int maxSize=1024*1024*100;
		String encode="UTF-8";
		DefaultFileRenamePolicy dfr=new DefaultFileRenamePolicy();
		MultipartRequest mr=new MultipartRequest(request,path,maxSize,encode,dfr);
		HttpSession session = request.getSession();
		Host loginHost = (Host) session.getAttribute("loginHost");
		String hostId=loginHost.getHostId();
		String hostNickname=mr.getParameter("hostNickname");
		String hostPw=mr.getParameter("hostPw");
		//String memberEmail=mr.getParameter("hostEmail");
		//System.out.println(memberEmail);
		String renamefilename=mr.getFilesystemName("h-upFile");
		
		
		if(renamefilename!=null) {
//			Host h=Host.builder().hostNickname(hostNickname).hostImg(renamefilename).hostPw(hostPw).build();
			int result=new HostService().updateHostProfile(hostId, hostNickname, hostPw, hostPw, hostId);
			Host newH=new HostService().selectByhostId(hostId);
					
			String msg="수정이 완료되었습니다.",loc="/memberprofile.do";
			session.setAttribute("loginMember",newH);
		
			if(result==0) {
				msg="수정을 실패하였습니다.";
			}
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}else {			
			int result=new HostService().updateHostProfile(hostId, hostNickname, hostPw, hostPw, hostId);
			Host newH=new HostService().selectByhostId(hostId);
			session.setAttribute("loginMember",newH);
			String msg="수정이 완료되었습니다.",loc="/hostProfile.do";
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
