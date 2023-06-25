package com.smallus.payment.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smallus.coupon.model.vo.Coupon;
import com.smallus.coupon.service.CouponService;
import com.smallus.member.model.vo.Member;
import com.smallus.payment.model.vo.ClassPayment;
import com.smallus.payment.service.PaymentService;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/host/payment.do")
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
		
		// login한 멤버 정보 가져오기
		HttpSession session=request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		
		// memberId를 매개변수로 하는 쿠폰 가격 가져오기 
		List<Coupon> coupon=new CouponService().selectCouponByMemberId(loginMember.getMemberId());
		
		//CATEGORY_TITLE, CLASS_TITLE, CLASS_ADDRESS, CLASS_ID, CLASS_DETAIL_ID,
		//BOOKING_TIME_START, BOOKING_TIME_END,  CLASS_PERSONNEL, REMAINING_PERSONNEL, CLASS_PRICE
		//String classId=request.getParameter("classId");
		String classId="CLA1000"; // 현재는 임의로 하나의 클래스아이디를 가져왔음 
		List<ClassPayment> list= new PaymentService().selectClassDetailByClassId(classId);
		System.out.println(coupon+" "+list.size());
		Gson gson = new Gson();
//		response.setContentType("text/html;charset=utf-8"); // html
		if(list!=null&&!list.isEmpty()) {
			System.out.println("classpayment list 있음");
//			gson.toJson(list,response.getWriter()); //html
//			gson.toJson(coupon,response.getWriter()); //html
			
			// GSON을 사용하여 List를 JSON 형식의 문자열로 변환
			String json = gson.toJson(list);
			
			// JSON 데이터를 클라이언트로 전송 (예: HttpServletResponse)
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
			
		}else {
			request.setAttribute("msg", "잘못된 접근입니다.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
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
