


package com.smallus.host.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smallus.classes.model.service.ClassService;
import com.smallus.classes.model.vo.Classes;
import com.smallus.host.model.vo.Host;
import com.smallus.payment.model.vo.PaymentCalc;
import com.smallus.payment.service.PaymentService;

@WebServlet("/hostMain.do")
public class ViewHostMainpageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ViewHostMainpageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// move host main page
		HttpSession session=request.getSession();
		Host loginHost = (Host) session.getAttribute("loginHost");
		String hostId=loginHost.getHostId();
		
		List<PaymentCalc> newList=new PaymentService().selectNewPaymentByhostId(hostId);
		List<Classes> calendarList=new ClassService().selectClassByCalendar(hostId);
		if(newList.isEmpty()||newList==null||calendarList.isEmpty()||calendarList==null) {
			System.out.println("newList 없음없");
		}else {
			System.out.println("newList 있음있"+newList.size());
			session.setAttribute("newList",newList);	
			session.setAttribute("calendarList", calendarList);
		}
		
		request.getRequestDispatcher("/views/host/hostMain.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
