package com.smallus.classes.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smallus.classes.model.service.ClassService2;
import com.smallus.classes.model.vo.Classes;

/**
 * Servlet implementation class AddClassServlet
 */
@WebServlet("/host/addClass.do")
public class AddClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddClassServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클래스등록페이지 이후 자료를 DB에 반영하는 서블릿
		
		// String hostId=request.getParameter("hostId");
		String hostId="c1234"; // 임시 클래스아이디
		
		Classes newClass=Classes.builder()
				.hostId(hostId)
				.categoryId(request.getParameter("category"))
				.classTitle(request.getParameter("classTitle"))
				.classPersonnel(Integer.parseInt(request.getParameter("classPersonnel")))
				.classPrice(Integer.parseInt(request.getParameter("classPrice")))
				.classAddress(request.getParameter("classAdress"))
				.classSupplies(request.getParameter("classSupplies"))
				.classNotice(request.getParameter("classNotice"))
				.classDetail(request.getParameter("classDetail"))
				.classThumbnail(request.getParameter("classThumbnail"))
				.build();
		int result=new ClassService2().addClass(newClass);
		
		
		if(result>0) {
			// 성공
		}else {
			// 실패
			request.setAttribute("msg", "클래스 등록에 실패하였습니다.");
			// 성공메세지 띄우는거 공용으로 있는지 찾아봐야함
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
