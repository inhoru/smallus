package com.smallus.host.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class ReservationScheduleServlet
 */
@WebServlet("/host/rsrv.do")
public class ReservationScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationScheduleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<String> rsv= new ArrayList();
		//String a =rsv.get(0);
		rsv.add("2023-06-16");
		rsv.add("2");
		rsv.add("className");
		System.out.println(rsv);
		// Gson 라이브러리 이용해서 json parsing하기
		// 1. Gson 클래스 생성하기
		Gson gson= new Gson();
		// 2. Gson에서 제공하는 parsing하는 메소드 사용하기
		// toJson(json으로 변경할 객체[,OutputStream]); // outputStream으로 변경한 객체 보내고 끝난다
		response.setContentType("application/json; charset=UTF-8");
		//gson.toJson(m,response.getWriter()); // 첫번째 멤버변수를 key값으로 쓴다.
		gson.toJson(rsv,response.getWriter()); // list 보낼 때는 바로 list 보내도 됨 ㅠㅠ
		
		// json 형태로 전송된 데이터를 vo 객체로 만들어준다.
		//gson.fromJson(String, null)
		String data=request.getParameter("data");
		//List requestData=gson.fromJson(data,Member.class); // data를 Member class로 변환해준다
		//System.out.println(requestData);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
