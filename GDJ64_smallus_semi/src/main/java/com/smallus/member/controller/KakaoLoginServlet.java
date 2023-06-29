package com.smallus.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smallus.member.model.vo.Member;
import com.smallus.member.model.vo.Notifications;
import com.smallus.member.service.MemberService;
import com.smallus.payment.service.PaymentService;

/**
 * Servlet implementation class KakaoLoginServlet
 */
@WebServlet("/member/KakaoLogin.do")
public class KakaoLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberEmail=request.getParameter("memberEmail");
		System.out.println(memberEmail);
		
		// DB접속해서 memberEmail과 일치하는 회원이 있는지 확인 후 데이터 가져오기
		Member loginMember=new MemberService().kakaoLogin(memberEmail);
		System.out.println(loginMember);
		//loginMember가 null을 기준으로 로그인 처리여부를 결정할 수 있음.
		if(loginMember!=null) {
			//로그인 성공 -> 인증받음
			HttpSession session=request.getSession();
			session.setAttribute("loginMember",loginMember);
			//화면전환시킬방법 2가지중 sendRedirect로 보낸다 이유는 데이터를  session 저장시켰고, url주소에 정보를 남기지 않기 위해서
			String memberId=loginMember.getMemberId();
			List<Notifications> list =new MemberService().selectAllNotifications(memberId);
			int notcount = new MemberService().notificationsCount(memberId);
			//수강일이 지나면 결제완료 -> 수강완료로 업데이트되는 구문 
			int updateReservatation = new PaymentService().updatePaymentStatus();
			session.setAttribute("notcount1",notcount);
			session.setAttribute("Notlist1",list);
			response.sendRedirect(request.getContextPath());
		}else {
			//로그인 실패 -> 인증못받음
			//실패 메세지 출력
			request.setAttribute("msg","다시 시도하세요");
			request.setAttribute("loc","/views/member/memberLogin.jsp");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
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
