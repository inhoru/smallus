package com.smallus.classes.controller;

import static com.smallus.common.JDBCTemplate.close;
import static com.smallus.common.JDBCTemplate.commit;
import static com.smallus.common.JDBCTemplate.getConnection;
import static com.smallus.common.JDBCTemplate.rollback;

import java.io.IOException;
import java.sql.Connection;
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
		
		
		int insertResult=0;
		String[] classTime = request.getParameterValues("classTime");
		if (per != null) {
		  for (String time : classTime) {
		    //System.out.println("time : "+time);
		    try {
		    	for(int i=0;i<size;i++) {
		    		ClassDetail c=new ClassDetail();
		    		ClassDetail.builder().classId(cID)
		    		.bookingTimeStart(new java.sql.Date(dateFormet.parse(time.substring(0, time.indexOf("~")-1)).getTime()))
		    		.bookingTimeEnd(new java.sql.Date(dateFormet.parse(time.substring(time.indexOf("~")+1)).getTime()))
		    		.remainingPersonnel(Integer.parseInt(re)).build();
		    		insertResult=new ClassService().InsertClassDetailByClassDetailPage(c);
		    	}if(insertResult>0) System.out.println("성공");
				else System.out.println("실패");
			} catch (ParseException e) {
				e.printStackTrace();
			}
		  }
		}
		
		
//		for(ClassDetail c: list) {
//			ClassDetail one=new ClassDetail();
//			one.setClassId(c.getClassId());
//			one.setBookingTimeStart(c.getBookingTimeStart());
//			one.setBookingTimeEnd(c.getBookingTimeEnd());
//			one.setRemainingPersonnel(c.getRemainingPersonnel());
//			insertResult=new ClassService().InsertClassDetailByClassDetailPage(one);
//			
//		}if(insertResult>0) System.out.println("성공");
//		else System.out.println("실패");
		
//		int result=new ClassService().InsertClassDetailByClassDetailPage(list,list.size());
		
		
		
		
//		다영님 코드
//		String[] schedule=request.getParameterValues("datetimes");
//	      List<ClassDetail> scheduleList=new ArrayList();
//	      SimpleDateFormat dateFormet=new SimpleDateFormat("yyyy-MM-dd HH:mm");
//	      try {
//	         for(String s:schedule) {
//	            ClassDetail cd=ClassDetail.builder()
//	                  .bookingTimeStart(new java.sql.Date(dateFormet.parse(s.substring(1, 16)).getTime()))
//	                  .bookingTimeEnd(new java.sql.Date(dateFormet.parse(s.substring(20, 35)).getTime()))
//	                  .build();
//	            scheduleList.add(cd);
//	         }
//	      }catch(Exception e) {
//	         e.printStackTrace();
		
//	      }
//	      int result2=0;
//	      if(!scheduleList.isEmpty()) { //생략가능?
//	         result2=new ClassService2().addClassSchedule(scheduleList);
//	      }
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
