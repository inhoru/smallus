package com.smallus.payment.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smallus.classes.model.service.ClassService;
import com.smallus.member.model.vo.Member;
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
		//data : {"success":true,"imp_uid":"imp_182519379256","pay_method":"point","merchant_uid":"RSV1004",
		//"name":"[베이킹] [베이킹] 휘낭시에 굽기","paid_amount":50000,"currency":"KRW","pg_provider":"kakaopay","pg_type":"payment",
		//"pg_tid":"T4926c0f62ea0baecb0a","apply_num":"","buyer_name":"김세미","buyer_email":"test@naver.com",
		//"buyer_tel":"01057111106","buyer_addr":"","buyer_postcode":"","custom_data":null,"status":"paid","paid_at":1687317530,
		//"receipt_url":"https://mockup-pg-web.kakao.com/v1/confirmation/p/T4926c0f62ea0baecb0a/3930989aadf75ac385d920f5f158cb649d11b26ceed1571a2fcd93d2dfc74b0c",
		//"card_name":null,"bank_name":null,"card_quota":0,"card_number":""}
		
		//String jsonData = request.getParameter("jsonData");
		Map<String, String> dataMap = new HashMap<>();
		//Map<String, String> newPayment= new HashMap<String,String>();
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
		
//		System.out.println("payment_id : "+(String)dataMap.get("merchant_uid"));
//		System.out.println("classDetail_id : "+(String)dataMap.get("classDetailId"));
//		System.out.println("member_id : "+(String)dataMap.get("memberId"));
//		System.out.println("coupon_id : "+(String)dataMap.get("couponId"));
//		System.out.println("price : "+ Integer.parseInt(dataMap.get("price")));
//		System.out.println("personnel : "+ Integer.parseInt(String.valueOf(dataMap.get("classPersonnel"))));
//		System.out.println("totalPrice : "+ Integer.parseInt(String.valueOf(dataMap.get("totalPrice"))));
//		System.out.println("pg_provider : "+(String)dataMap.get("pg_provider"));
//		System.out.println("status : "+(String)dataMap.get("status"));
		int personnel=Integer.parseInt(classPersonnel);
		int remainingPersonnel= Integer.parseInt(request.getParameter("classPersonnel"));
		remainingPersonnel=remainingPersonnel-personnel;
		int perResult= new ClassService().updateRemainPersonnel(remainingPersonnel,classDetailId);
		int result=new PaymentService().insertPayment(dataMap);
		if(result>0) System.out.println("입력 완료");
		else System.out.println("error T_T");
		
		
	}

}










