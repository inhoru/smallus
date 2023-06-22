package com.smallus.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smallus.admin.service.AdminService;
import com.smallus.host.model.vo.Host;

/**
 * Servlet implementation class HostListServlet
 */
@WebServlet("/admin/HostListServlet.do")
public class HostListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HostListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cPage,numPerpage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		try {
			numPerpage=Integer.parseInt(request.getParameter("numPerpage"));
		}catch(NumberFormatException e) {
			numPerpage=10;
		}
		//3. 페이지바를 구성
		// 1) DB에 저장된 전체 데이터의 수를 가져오기
		int totalData=new AdminService().selectHostCount();
		//System.out.println(totalData);
		// 2) 전체페이지수를 계산하기
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		//(double)로 형변환 해서 소수점 계산 해주고 Math.ceil을 이용해서 올림처리 한 후 (int)로 형변환
		//+1을 하면은 페이지가 더 생기긴하나 소수점이 아닐경우 빈페이지 생성된다.
		int pageBarSize=5;
		// 3) 페이지바 시작번호 계산하기
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		//4. 페이지바를 구성하는 html 저장하기
		String pageBar="";
		if(pageNo==1) {
			pageBar+="<span>[이전]</span>";
		}else {
			pageBar+="<a href='"+request.getRequestURI()+"?numPerpage="+numPerpage+"&cPage="+(pageNo-1)+"'>[이전]</a>";
		}
		//선택할 페이지 번호 출력하기
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getRequestURI()+"?numPerpage="+numPerpage+"&cPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		//다음 출력
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}else {
			pageBar+="<a href='"+request.getRequestURI()+"?numPerpage="+numPerpage+"&cPage="+pageNo+"'>[다음]</a>";
		}
		
		//1. DB에서 member테이블에 있는 데이터 가져오기
		List<Host> list=new AdminService().checkHostAll(cPage,numPerpage);
//		list.forEach(e->System.out.println(e)); //list불러온값 확인
		if(list!=null&&!list.isEmpty()) {
		request.setAttribute("pageBar",pageBar);
		request.setAttribute("HostList", list);
		request.getRequestDispatcher("/views/admin/adminHostList.jsp").forward(request, response);
		}else {
		request.getRequestDispatcher("/views/admin/adminHostList.jsp").forward(request, response);
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
