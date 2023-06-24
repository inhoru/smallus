package com.smallus.payment.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smallus.member.model.vo.Member;

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

		// 결제 후 보낸 데이터를 json으로 받는 서블릿
		request.setCharacterEncoding("UTF-8");
		Gson gson= new Gson();
		
		// front에서 보낸 데이터를 data로 가져옴 
		String data=request.getParameter("data");
		System.out.println("data : "+data);
		//data : {"success":true,"imp_uid":"imp_182519379256","pay_method":"point","merchant_uid":"RSV1004",
		//"name":"[베이킹] [베이킹] 휘낭시에 굽기","paid_amount":50000,"currency":"KRW","pg_provider":"kakaopay","pg_type":"payment",
		//"pg_tid":"T4926c0f62ea0baecb0a","apply_num":"","buyer_name":"김세미","buyer_email":"test@naver.com",
		//"buyer_tel":"01057111106","buyer_addr":"","buyer_postcode":"","custom_data":null,"status":"paid","paid_at":1687317530,
		//"receipt_url":"https://mockup-pg-web.kakao.com/v1/confirmation/p/T4926c0f62ea0baecb0a/3930989aadf75ac385d920f5f158cb649d11b26ceed1571a2fcd93d2dfc74b0c",
		//"card_name":null,"bank_name":null,"card_quota":0,"card_number":""}
		
//		PAYMENT_ID	VARCHAR2(30) PRIMARY KEY,	
//		CLASS_DETAIL_ID	VARCHAR2(20)	NOT NULL	REFERENCES CLASS_DETAIL(CLASS_DETAIL_ID),
//	  MEMBER_ID VARCHAR2(16) REFERENCES MEMBER(MEMBER_ID),
//		COUPON_ID	VARCHAR2(100) REFERENCES COUPON_TYPE(COUPON_ID),
//		PRICE	NUMBER	NOT NULL,
//	  CLASS_PERSONNEL NUMBER,
//		TOTAL_PRICE	NUMBER	NOT NULL,    
//		IMP_UID VARCHAR2(30), -- api 결제 번호
//		--HOST_ID VARCHAR2(100) REFERENCES HOST(HOST_ID), 
//	  REQUEST VARCHAR2(2000),    
//	  PAYMENT_TYPE	VARCHAR2(20) REFERENCES PAYMENT_TYPE(PAYMENT_TYPE),
//	  PAYMENT_DATE DATE DEFAULT SYSDATE,
//		PAYMENT_STATUS	VARCHAR2(20) NOT NULL
		
		
		Member requestData=gson.fromJson(data,Member.class);
		System.out.println("post 방식으로 요청");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.print(data);
		
	}

}










