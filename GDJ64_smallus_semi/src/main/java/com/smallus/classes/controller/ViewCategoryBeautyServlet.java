package com.smallus.classes.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smallus.classes.model.vo.ClassIndex;
import com.smallus.main.service.MainService;

/**
 * Servlet implementation class ViewCategoryBeautyServlet
 */
@WebServlet("/categoryBeauty.do")
public class ViewCategoryBeautyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewCategoryBeautyServlet() {
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
		
		List<ClassIndex> allBeauty= new MainService().selectAllclassByCategory(categoryId, cPage, numPerpage);
		List<ClassIndex> newBeauty= new MainService().selectNewClassByCategory(categoryId);
		
		String categoryTitle="뷰티";
		List<ClassIndex> bestBeauty= new MainService().selectBestClassByCategory(categoryTitle);
		System.out.println("new : "+newBeauty+"best : "+bestBeauty+"all : "+allBeauty);
		if(newBeauty!=null && !newBeauty.isEmpty() && bestBeauty!=null && !bestBeauty.isEmpty()) {
			request.setAttribute("newBeauty", newBeauty);
			request.setAttribute("bestBeauty", bestBeauty);
			request.setAttribute("allBeauty", allBeauty);
			request.getRequestDispatcher("/views/main/viewCategoryBeauty.jsp").forward(request, response);
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
