//package com.smallus.host.controller;
//
//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
//
//import com.oreilly.servlet.MultipartRequest;
//import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
//import com.smallus.host.model.vo.Host;
//import com.smallus.host.service.HostService;
//import com.smallus.member.model.vo.Member;
//import com.smallus.member.service.MemberService;
//
///**
// * Servlet implementation class UpdateHostProfileServlet
// */
//@WebServlet("/host/updateProfile.do")
//public class UpdateHostProfileServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public UpdateHostProfileServlet() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
////		HttpSession session = request.getSession();
////		Host loginHost = (Host) session.getAttribute("loginHost");
////		String hostId=(loginHost.getHostId());
//		
//		
//		if(!ServletFileUpload.isMultipartContent(request)) {
//			request.setAttribute("msg", "잘못된 접근입니다. 관리자에게 문의하세요 :(");
//			request.setAttribute("loc","/");
//			request.getRequestDispatcher("/views/common/msg.jsp")
//			.forward(request, response);
//			return;
//		}
//		String path=getServletContext().getRealPath("/upload/hostProfile");
//		int maxSize=1024*1024*100;
//		String encode="UTF-8";
//		DefaultFileRenamePolicy dfr=new DefaultFileRenamePolicy();
//		MultipartRequest mr=new MultipartRequest(request,path,maxSize,encode,dfr);
//		
//		HttpSession session = request.getSession();
//		Host loginHost = (Host) session.getAttribute("loginHost");
//		String hostId=(loginHost.getHostId());
//		
//		String renamefilename=mr.getFilesystemName("h-upFile");
//		
//		
//		String hostNickname=mr.getParameter("hostNickname");
//		String hostPw=mr.getParameter("hostPw");
//		String hostHomePhone=mr.getParameter("hostHomePhone");
//		String hostEmail=mr.getParameter("hostEmail");
//		
//		System.out.println(hostId+" "+hostNickname+" "+hostPw+" "+hostHomePhone+" "+hostEmail);
//		
//		
//		if(renamefilename!=null) {
//			Host host=Host.builder()
//						.hostPw(hostPw)
//						.hostHomephone(hostHomePhone)
//						.hostImg(renamefilename)
//						.hostNickname(hostNickname)
//						.hostEmail(hostEmail).build();
//			
//			int result=new HostService().updateHostProfile(host,hostId);
//			Host updateHost=new HostService().selectByhostId(hostId);
//			String msg="수정이 완료되었습니다.",loc="/hostProfile.do";
//			session.setAttribute("loginHost",updateHost);
//		
//			if(result==0) {
//				msg="수정을 실패하였습니다.";
//			}
//			request.setAttribute("msg", msg);
//			request.setAttribute("loc", loc);
//			
//			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
//		}else {			
//			Host host=Host.builder()
//					.hostPw(hostPw)
//					.hostHomephone(hostHomePhone)
//					.hostImg(renamefilename)
//					.hostNickname(hostNickname)
//					.hostEmail(hostEmail).build();
//		
//		int result=new HostService().updateHostProfile(host,hostId);
//		Host updateHost=new HostService().selectByhostId(hostId);
//		String msg="수정이 완료되었습니다.",loc="/hostProfile.do";
//		session.setAttribute("loginHost",updateHost);
//	
//		if(result==0) {
//			msg="수정을 실패하였습니다.";
//		}
//		request.setAttribute("msg", msg);
//		request.setAttribute("loc", loc);
//		
//		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
//		}
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}
//
//}
