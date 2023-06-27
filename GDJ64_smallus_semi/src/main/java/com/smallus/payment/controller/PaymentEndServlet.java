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
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smallus.classes.model.service.ClassService;
import com.smallus.classes.model.vo.Classes;
import com.smallus.host.service.HostService;
import com.smallus.member.model.vo.Member;
import com.smallus.member.model.vo.Notifications;
//github.com/you-so-good/smallus.git
import com.smallus.payment.service.PaymentService;

/**
 * Servlet implementation class PaymentEndServlet
 */
@WebServlet("/payments/callback_receive.do")
public class PaymentEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		
		// 결제 후 보낸 데이터를 json으로 받는 서블릿
		request.setCharacterEncoding("UTF-8");
		Gson gson= new Gson();
		
		// front에서 보낸 데이터를 data로 가져옴 
		String data=request.getParameter("data");
		
		Map<String, String> dataMap = new HashMap<>();
		dataMap = gson.fromJson(data, dataMap.getClass());
		
		// callback으로 받은 함수 중 빠진 데이터를 ajax로 가져와서 map에 넣어줌 
		String classDetailId=request.getParameter("classDetailId");
		String couponId=request.getParameter("couponId");
		String classPersonnel=request.getParameter("classPersonnel");
		String price=request.getParameter("price");
		String totalPrice=request.getParameter("totalPrice");
		
		dataMap.put("memberId", loginMember.getMemberId());
		dataMap.put("classDetailId", classDetailId);
		dataMap.put("classPersonnel", classPersonnel);
		dataMap.put("price", price);
		dataMap.put("totalPrice", totalPrice);
		
		if(!couponId.isEmpty()||couponId!=null) {
			dataMap.put("couponId", couponId);
		}else dataMap.put("couponId", "NONE");
		
		if((boolean)dataMap.get("status").equals("paid")) {
			dataMap.put("status", "결제완료");
		}
		
		
		int personnel=Integer.parseInt(classPersonnel);
		int remainingPersonnel= new PaymentService().selectRemainPer(classDetailId);
		int delResult=new PaymentService().deleteCouponByMemberId(loginMember.getMemberId());
//		System.out.println("personnel :"+personnel);
//		System.out.println("remainingPersonnel :"+remainingPersonnel);
//		System.out.println("remainingPersonnel : "+(remainingPersonnel-personnel));
		
		remainingPersonnel=remainingPersonnel-personnel;
		
		int perResult= new ClassService().updateRemainPersonnel(remainingPersonnel,classDetailId);
		int result=new PaymentService().insertPayment(dataMap);
		

		Classes n=new PaymentService().classDetailId(classDetailId);
		int insertNot=new PaymentService().insertNot(classDetailId,n);		
		List<Notifications> list =new HostService().selectAllNotifications(n.getHostId());
		int notcount = new HostService().notificationsCount(n.getHostId());
		session.setAttribute("notcount",notcount);
		session.setAttribute("Notlist",list);
		
		if(result>0 && result>0 && delResult>0) System.out.println("입력 완료");

		else System.out.println("error T_T");
		
		
	}

}










