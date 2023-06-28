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
 * Servlet implementation class ViewClassListServlet
 */
@WebServlet("/class/viewHostClassList.do")
public class ViewHostClassListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewHostClassListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session= request.getSession();
		Host host=(Host)session.getAttribute("loginHost");
		String hostId=host.getHostId();
		
		// 페이징 처리
		int cPage, numPerpage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		try {
			numPerpage=Integer.parseInt(request.getParameter("numPerpage"));
		}catch(NumberFormatException e) {
			numPerpage=6;
		}
		
		String pageBar="";
		int totalData=new ClassService().selectClassCount(hostId);
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		
		if(pageNo==1) {
			pageBar+="<span class='h-pageBar-txt'> 이전 </span>";
		}else {
			pageBar+="<a href='"+request.getRequestURI()+"?hostId="+hostId+"&cPage="+(pageNo-1)+"&numPerpage="+numPerpage+"' class='h-pageBar-txt'> 이전 </a>";
		}
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span class='h-pageBar-now'> "+pageNo+" </span>";
			}else {
				pageBar+="<a href='"+request.getRequestURI()+"?hostId="+hostId+"&cPage="+pageNo+"&numPerpage="+numPerpage+"'> "+pageNo+" </a>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<span class='h-pageBar-txt'> 다음 </span>";
		}else {
			pageBar+="<a href='"+request.getRequestURI()+"?hostId="+hostId+"&cPage="+pageNo+"&numPerpage="+numPerpage+"' class='h-pageBar-txt'> 다음 </a>";
		}
		
		request.setAttribute("pageBar", pageBar);
		
		// 호스트 아이디를 기준으로 클래스 리스트를 db에서 가져옴 
		List<Classes> classList=new ClassService().selectAllClassesByHostId(hostId,cPage,numPerpage);
		// 분기처리해서 hostClassList페이지로 전달
		if(classList!=null&&!classList.isEmpty()) {
			request.setAttribute("classList", classList);
			request.getRequestDispatcher("/views/host/viewHostClassList.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "조회할 클래스가 없습니다.");
			request.setAttribute("loc", "/views/host/hostMain.jsp");
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
