package com.smallus.classes.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smallus.classes.model.service.ClassService;
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
		Map<String, Object> map=new HashMap<String, Object>();
		
		// 날짜 포맷으로 변경
		SimpleDateFormat dateFormet=new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		String[] classId = request.getParameterValues("classId");
		if (classId != null) {
		  for (String value : classId) {
		    System.out.println("value : "+value);
		    map.put("classId", value);
		  }
		}
		String[] per = request.getParameterValues("remainingPersonnel");
		if (per != null) {
		  for (String remainingPersonnel : per) {
		    System.out.println("remainingPersonnel : "+remainingPersonnel);
		    map.put("remainingPersonnel", remainingPersonnel);
		  }
		}
		int j=0;
		int size= j;
		String cID=(String)map.get("classId");
		String re=(String)map.get("remainingPersonnel");
		
		String[] classTime = request.getParameterValues("classTime");
		    try {
		    		for (String time : classTime) {
		    		ClassDetail c= ClassDetail.builder().classId(cID)
		    		.bookingTimeStart(new java.sql.Date(dateFormet.parse(time.substring(0, time.indexOf("~")-1)).getTime()))
					.bookingTimeEnd(new java.sql.Date(dateFormet.parse(time.substring(time.indexOf("~")+1)).getTime()))
		    		.remainingPersonnel(Integer.parseInt(re)).build();
		    		list.add(c);
		    		}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		    
		if(list!=null|| !list.isEmpty()) {
			for(ClassDetail c:list) {
				System.out.println("c"+c.getClassId()+"ctimestart "+c.getBookingTimeStart()+"ctimeend "+c.getBookingTimeEnd()+" "+c.getRemainingPersonnel());
			}
			System.out.println("list O"+list.size());
			int insertResult=new ClassService().InsertClassDetailByHostPage(list);
			if(insertResult>0) System.out.println("등록 성공 :)");
			else System.out.println("등록 실패 ;<");
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
