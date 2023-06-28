package com.smallus.classes.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smallus.classes.model.vo.ClassDetail;

/**
 * Servlet implementation class InsertClassDetailByClassDetailPageServlet
 */
@WebServlet(name = "InsertClassDetailByClassDetailPageServlet", urlPatterns = { "/class/insertClassDetailByPage.do" })
public class InsertClassDetailByClassDetailPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertClassDetailByClassDetailPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<ClassDetail> list=new ArrayList<ClassDetail>();
		ClassDetail c=new ClassDetail();
		
		String[] classId = request.getParameterValues("classId");
		if (classId != null) {
		  for (String value : classId) {
		    System.out.println("value : "+value);
		    c.setClassId(value);
		    list.add(c);
		  }
		}
		String[] per = request.getParameterValues("remainingPersonnel");
		if (per != null) {
		  for (String remainingPersonnel : per) {
		    System.out.println("remainingPersonnel : "+remainingPersonnel);
		    c.setRemainingPersonnel(Integer.parseInt(remainingPersonnel));
		    list.add(c);
		  }
		}
		String[] classTime = request.getParameterValues("classTime");
		if (per != null) {
		  for (String time : classTime) {
		    System.out.println("time : "+time);
		    //2023-07-08 13:00 ~ 2023-07-08 15:00
		    //c.setBookingTimeStart(time.substring(0,15));
		    //str.substring(3, 6); 
		  }
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
