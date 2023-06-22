package com.smallus.classes.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smallus.classes.model.vo.Classes;

/**
 * Servlet implementation class DetailList
 */
@WebServlet("/ajax/detailTest.do")
public class DetailList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date today=null;
		try {
			today=sdf.parse("2023-06-20");
		}catch(ParseException e) {
			//e.printStackTrace()
			today=new Date();
			
		}
		List<Classes> cs = List.of(
				Classes.builder().classId("test-class-num").
				hostId("c1234").
				categoryId("COO").
				classTitle("TEST-CLASS-TITLE").
				classPersonnel(2).
				classPrice(30000).
				classAddress("충청남도 천안시 동남구 먹거리9길 20").
				classOffer("앞치마").
				classSupplies("준비물").
				classNotice("공지").
				classDetail("세부사항").
				classStatus("Y").
				classUpLoadDate(today).
				classPassDate(today).
				classPassId("W").
				classThumbnail("main-img1.jpg").
				build()
				);
request.setAttribute("cs", cs);
		
		request.getRequestDispatcher("/views/class/detailList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
