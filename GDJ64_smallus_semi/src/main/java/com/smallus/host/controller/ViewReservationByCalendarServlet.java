package com.smallus.host.controller;

import java.io.IOException;
import java.lang.reflect.Type;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import com.smallus.host.model.vo.Host;
import com.smallus.host.service.HostService;
import com.smallus.payment.model.vo.PaymentCal;

/**
 * Servlet implementation class ViewReservationByCalendarServlet
 */
@WebServlet("/host/viewRsvByCalendar.do")
public class ViewReservationByCalendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewReservationByCalendarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

     
     
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		JsonSerializer<Date> json = new JsonSerializer<Date>() {
	        
	        @Override
	        public JsonElement serialize(Date arg0, Type arg1, JsonSerializationContext arg2) {
	           // TODO Auto-generated method stub
	           return new JsonPrimitive(new SimpleDateFormat("yyyy-MM-dd").format(arg0));
	        }
	     };
		
		Gson gson=new Gson().newBuilder().registerTypeAdapter(Date.class, json).create();
		response.setContentType("application/json; charset=UTF-8");
		HttpSession session = request.getSession();
		Host loginHost = (Host) session.getAttribute("loginHost");
		String hostId=(loginHost.getHostId());
		List<PaymentCal> list= new HostService().viewPaymentCalendar(hostId);
		
		gson.toJson(list,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
