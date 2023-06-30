package com.smallus.classes.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smallus.classes.model.vo.ClassIndex;
import com.smallus.main.model.vo.Wish;
import com.smallus.main.service.MainService;
import com.smallus.member.model.vo.Member;

/**
 * Servlet implementation class ViewCategoryCraftServlet
 */
@WebServlet("/categoryCraft.do")
public class ViewCategoryCraftServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewCategoryCraftServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String categoryId=request.getParameter("categoryId");
		
		int cPage, numPerpage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1;
		}
		try {
			numPerpage = Integer.parseInt(request.getParameter("numPerpage"));
		} catch (NumberFormatException e) {
			numPerpage = 8;
		}
		int totalData = new MainService().allClassByCategoryCount(categoryId);
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		String pageBar="";
		if (pageNo == 1) {
			pageBar += "<span class='h-pageBar-txt'> 이전 </span>";
		} else {
			pageBar += "<a href='" + request.getRequestURI() + "?cPage=" + (pageNo - 1) + "&numPerpage=" + numPerpage + "' class='h-pageBar-txt'> 이전 </a>";
		}
		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<span class='h-pageBar-now'> " + pageNo + " </span>";
			} else {
				pageBar += "<a href='" + request.getRequestURI() + "?categoryId="+categoryId+"&cPage=" + pageNo + "&numPerpage=" + numPerpage +"'> " + pageNo + " </a>";
			}
			pageNo++;
		}
		if (pageNo > totalPage) {
			pageBar += "<span class='h-pageBar-txt'> 다음 </span>";
		} else {
			pageBar += "<a href='" + request.getRequestURI() + "?cPage=" + pageNo + "&numPerpage=" + numPerpage +"' class='h-pageBar-txt'> 다음 </a>";
		}
		
		request.setAttribute("pageBar", pageBar);
		
		List<ClassIndex> newCraft= new MainService().selectNewClassByCategory(categoryId);
		List<ClassIndex> allCraft= new MainService().selectAllclassByCategory(categoryId, cPage, numPerpage);
		if(newCraft!=null && !newCraft.isEmpty()) {
		}
		String categoryTitle="공예";
		List<ClassIndex> bestCraft= new MainService().selectBestClassByCategory(categoryTitle);
		if(newCraft!=null && !newCraft.isEmpty() && bestCraft!=null && !bestCraft.isEmpty()) {
			HttpSession session=request.getSession();
			Member loginMember = (Member) session.getAttribute("loginMember");
			if(loginMember!=null) {
				String memberId=loginMember.getMemberId();
				List<Wish> wishMember= new MainService().wishMember(memberId);
				session.setAttribute("wishMember", wishMember);
			}
			request.setAttribute("newCraft", newCraft);
			request.setAttribute("bestCraft", bestCraft);
			request.setAttribute("allCraft", allCraft);
			request.getRequestDispatcher("/views/main/viewCategoryCraft.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "선택한 카테고리 클래스가 없습니다.");
			request.setAttribute("loc","/");
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
