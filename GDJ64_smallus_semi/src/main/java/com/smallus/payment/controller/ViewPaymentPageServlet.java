package com.smallus.payment.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.smallus.classes.model.vo.Classes;
import com.smallus.coupon.model.vo.Coupon;
import com.smallus.coupon.service.CouponService;

/**
 * Servlet implementation class ViewPaymentPageServlet
 */
@WebServlet("/payment.do")
public class ViewPaymentPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewPaymentPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String memberId= request.getParameter("memberId");
		
		Classes c=new Classes();
		List<Coupon> couponList= new CouponService().searchByMemberCoupon(memberId,1,100);
		Gson gson= new GsonBuilder().create();
		
		Map<String, String> data= new HashMap<String, String>();
		data.put("bookingTimeStart", "2023-06-20 15:00");
		data.put("bookingTimeEnd", "2023-06-20 17:00");
		data.put("classTitle", "휘낭시에 굽기");
		data.put("classAddress", "충청남도 천안시");
		data.put("classCategoryTitle", "베이킹");
		data.put("classPersonnel", "2");
		data.put("classPrice", "30000");
		data.put("classThumbnail", "main-img1.jpg");
		
		
		response.setContentType("application/json; charset=UTF-8");
		
		//gson.toJson(couponList,response.getWriter());
		//gson.toJson(data,response.getWriter()); // list 보낼 때는 바로 list 보내도 됨 ㅠㅠ
		//System.out.println(gson.toJson(data));
		request.setAttribute("data", data);
		request.setAttribute("couponList", couponList);
		request.getRequestDispatcher("/views/payment/paymentClass.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
