package com.smallus.payment.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.smallus.payment.model.vo.Payment;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/payment.do")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		
		// login한 멤버 정보 가져오기
		//Member m=request.getAttribute("loginMember");
		//String memberId=m.getMemberId();
		String memberId="test"; // 임의로 test아이디를 사용
		
		// 결제할 내역 가져오기
		// Classes classList= new service().blahblah(memberId);
		
		// memberId를 매개변수로 하는 쿠폰 가격 가져오기 
		// int couponPrice = new CouponService().selectCouponPrice(memberId); 
		
		int couponPrice=0;// 위에서 memberId를 이용해서 가져온다
		int price=0;// 1인당 가격
		int personnel=0; // 인원수 (갯수)
		int totalPrice=0; // 총 가격 
		totalPrice= (price*personnel)-couponPrice;
		
		
		// 반복문 순회하면서 쿠폰 가격, 총 결제 가격 정리하기 
		// for(Classes c : classesList){
		//		price= c.getClassPrice();
		//		personnel=c.getClassPersonnel();
		//		totalPrice=(price*personnel)-couponPrice;
		// }	
		
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
		Date date = new Date(System.currentTimeMillis());
		System.out.println(date);
		
		//paymentId생성 
		// Payment 객체 생성 
		//Payment p=new Payment().builder().paymentId("PYM"+date).classDetailId("a").memberId(memberId).
		Payment p=new Payment();
		session.setAttribute("paymentInfo", p);
		response.sendRedirect(request.getContextPath()+"/views/host/test.jsp"); // 결제하는 페이지로 이동
		
				
				
	}
	
	
//	public String getToken(HttpServletRequest request ,HttpServletResponse response ,JSONObject json ,String requestURL) throws Exception{
//
//			// requestURL 아임퐅크 고유키, 시크릿 키 정보를 포함하는 url 정보 
//
//			String _token = "";
//
//			try{
//
//				String requestString = "";
//
//				URL url = new URL(requestURL);
//
//				HttpURLConnection connection = (HttpURLConnection) url.openConnection();
//
//				connection.setDoOutput(true);
//
//				connection.setInstanceFollowRedirects(false);  
//
//				connection.setRequestMethod("POST");
//
//				connection.setRequestProperty("Content-Type", "application/json");			
//
//				OutputStream os= connection.getOutputStream();
//
//				os.write(json.toString().getBytes());
//
//				connection.connect();
//
//				StringBuilder sb = new StringBuilder(); 
//
//			if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
//
//			BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
//
//			String line = null;  
//
//			while ((line = br.readLine()) != null) {  
//
//			sb.append(line + "\n");  
//
//			}
//
//			br.close();
//
//			requestString = sb.toString();
//
//			}
//
//			os.flush();
//
//			connection.disconnect();
//
//			JSONParser jsonParser = new JSONParser();
//
//			JSONObject jsonObj = (JSONObject) jsonParser.parse(requestString);
//
//			if((Long)jsonObj.get("code")  == 0){
//
//			JSONObject getToken = (JSONObject) jsonObj.get("response");
//
//			System.out.println("getToken==>>"+getToken.get("access_token") );
//
//			_token = (String)getToken.get("access_token");
//
//			}
//
//			}catch(Exception e){
//
//			e.printStackTrace();
//
//			_token = "";
//
//			}
//
//			return _token;
//
//			}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
