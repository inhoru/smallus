package com.smallus.host.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smallus.classes.model.service.ClassService;
import com.smallus.classes.model.vo.Classes;
import com.smallus.host.model.vo.Host;

/**
 * Servlet implementation class SortingClassByPassServlet
 */
@WebServlet("/class/sortingHostClassByPass.do")
public class SortingHostClassByPassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SortingHostClassByPassServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 쿼리스트링으로 보낸 passStatus, hostId를 기준으로 패스 상태에 다른 정렬
		HttpSession session= request.getSession();
		Host host=(Host)session.getAttribute("loginHost");
		String hostId=host.getHostId();
		
		String passStatus=request.getParameter("passStatus");
		System.out.println(passStatus);
		// 페이징 처리
		int cPage, numPerpage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1;
		}
		try {
			numPerpage = Integer.parseInt(request.getParameter("numPerpage"));
		} catch (NumberFormatException e) {
			numPerpage = 6;
		}

		String pageBar = "";
		int totalData = new ClassService().selectClassCountByStatus(hostId, passStatus);
		System.out.println(totalData);
		int totalPage = (int) Math.ceil((double) totalData / numPerpage);
		int pageBarSize = 5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		if(pageNo==1) {
			pageBar+="<span class='h-pageBar-txt'> 이전 </span>";
		}else {
			pageBar+="<a href='"+request.getRequestURI()+"?hostId="+hostId+"&passStatus="+passStatus+"&cPage="+(pageNo-1)+"&numPerpage="+numPerpage+"' class='h-pageBar-txt'> 이전 </a>";
		}
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span class='h-pageBar-now'> "+pageNo+" </span>";
			}else {
				pageBar+= "<a href='"+request.getRequestURI()+"?hostId="+hostId+"&passStatus="+passStatus+"&cPage="+pageNo+"&numPerpage="+numPerpage+"'> "+pageNo+" </a>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<span class='h-pageBar-txt'> 다음 </span>";
		}else {
			pageBar+="<a href='"+request.getRequestURI()+"?hostId="+hostId+"&passStatus="+passStatus+"&cPage="+pageNo+"&numPerpage="+numPerpage+"' class='h-pageBar-txt'> 다음 </a>";
		}

		request.setAttribute("pageBar", pageBar);

		List<Classes> classListPass = new ClassService().selectClassListByPassStatus(hostId, passStatus,cPage,numPerpage);
		
		if(classListPass!=null&&!classListPass.isEmpty()) {
			request.setAttribute("classListPass", classListPass);
			request.getRequestDispatcher("/views/host/viewHostClassList.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "조회할 클래스가 없습니다.");
			request.setAttribute("loc", "/views/host/viewHostClassList.jsp");
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
