package com.smallus.classes.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smallus.classes.model.service.ClassService2;
import com.smallus.classes.model.vo.ClassDetail;
import com.smallus.classes.model.vo.Classes;
import com.smallus.host.model.vo.Host;

/**
 * Servlet implementation class AddClassServlet
 */
@WebServlet("/host/addClassEnd.do")
public class AddClassEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddClassEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 클래스등록페이지 작성후 자료를 DB에 반영하는 서블릿
		
		
		HttpSession session = request.getSession(false);
		Host loginHost = (Host) session.getAttribute("loginHost");
		String hostId=(loginHost.getHostId());
		// 파일 업로드
		String path=getServletContext().getRealPath("/upload/class");
		int maxSize=1024*1024*30;
		String encode="UTF-8";
		DefaultFileRenamePolicy dfr=new DefaultFileRenamePolicy();
		MultipartRequest mr=new MultipartRequest(request,path,maxSize,encode,dfr);
		
		// 멀티파트 사용으로 모든 요청은 multipartRequest로 받아옴
		// 첨부파일은 리네임된걸로 하면 될듯!!!!
		Classes newClass=Classes.builder()
				.hostId(hostId)
				.categoryId(mr.getParameter("category"))
				.classTitle(mr.getParameter("classTitle"))
				.classPersonnel(Integer.parseInt(mr.getParameter("classPersonnel")))
				.classPrice(Integer.parseInt(mr.getParameter("classPrice")))
				.classOffer(mr.getParameter("classOffer"))
				.classAddress(mr.getParameter("classAddress")+" "+mr.getParameter("classAddressDetail"))
				.classSupplies(mr.getParameter("classSupplies"))
				.classNotice(mr.getParameter("classNotice"))
				.classDetail(mr.getParameter("classDetail"))
				.classThumbnail(mr.getFilesystemName("classThumbnail"))
				.build();
		int result=new ClassService2().addClass(newClass);
		
		
		
		// 여기서부터 클래스 스케쥴 등록
		// 입력내용을 배열로 받은 뒤, for문을 돌면서 내용을 자른다
		String[] schedule=mr.getParameterValues("datetimes");
		List<ClassDetail> scheduleList=new ArrayList();
		SimpleDateFormat dateFormet=new SimpleDateFormat("yyyy-MM-dd HH:mm");
		try {
			for(String s:schedule) {
				ClassDetail cd=ClassDetail.builder()
						.bookingTimeStart(new java.sql.Date(dateFormet.parse(s.substring(0, s.indexOf("~")-1)).getTime()))
						.bookingTimeEnd(new java.sql.Date(dateFormet.parse(s.substring(s.indexOf("~")+1)).getTime()))
//						.bookingTimeStart(s.substring(0, s.indexOf("~")-1))
//						.bookingTimeEnd(s.substring(s.indexOf("~")+1))
//						.bookingTimeStart(dateFormet.parse(s.substring(0, s.indexOf("~")-1)))
//						.bookingTimeEnd(dateFormet.parse(s.substring(s.indexOf("~")+1)))
						.build();
				scheduleList.add(cd);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		int result2=0;
		if(!scheduleList.isEmpty()) { //생략가능?
			result2=new ClassService2().addClassSchedule(scheduleList);
		}
//		
//		
		if(result>0&&result2>0) {
			System.out.println("클래스와 스케쥴 모두 등록 성공!");
		}else {
		// request.setAttribute("msg", "클래스 등록에 실패하였습니다.");
			System.out.println("클래스/스케쥴 등록 오류!'");
		}
		// request.setAttribute("msg", "메세지 변수");
		// request.setAttribute("loc", "주소 변수");
		
		// request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
		request.getRequestDispatcher("/class/viewHostClassList.do").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
