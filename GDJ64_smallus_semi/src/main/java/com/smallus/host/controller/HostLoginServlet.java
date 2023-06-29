package com.smallus.host.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smallus.classes.model.service.ClassService;
import com.smallus.classes.model.vo.Classes;
import com.smallus.host.model.vo.Host;
import com.smallus.host.service.HostService;
import com.smallus.member.model.vo.Notifications;
import com.smallus.member.service.MemberService;
import com.smallus.payment.model.vo.PaymentCalc;
import com.smallus.payment.service.PaymentService;

/**
 * Servlet implementation class HostLoginServlet
 */
@WebServlet("/host/hostlogin.do")
public class HostLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public HostLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.클라이언트가 보낸 데이터를 가져옴(userId,password)
		String hostId=request.getParameter("hostId");
		String password=request.getParameter("password");
		//System.out.println(hostId+" : "+password);

		//아이디 저장 로직처리 (*로직처리 순서 페이지 전환하는 response가 응답하기전에 쿠기를 먼저 저장시켜줘야한다!)
		String savehostId=request.getParameter("savehostId");
		//System.out.println(savehostId);
		//checkbox에 check가 되면 on
		//checkbox에 check가 안되면 null
		if(savehostId!=null) {
			Cookie c=new Cookie("savehostId",hostId);
			c.setMaxAge(60*60*24*7);
			c.setPath("/");
			response.addCookie(c);
		}else {
			Cookie c=new Cookie("savehostId","");
			c.setMaxAge(0);
			response.addCookie(c);
		}

		//2. DB접속해서 id와 password와 일치하는 회원이 있는지 확인 후 데이터 가져오기
		Host loginHost=new HostService().hostLogin(hostId, password);
		//System.out.println(loginHost+"너니?");
		//loginMember가 null을 기준으로 로그인 처리여부를 결정할 수 있음.
		if(loginHost!=null&&!loginHost.getHostId().equals("admin")) {
			//로그인 성공 -> 인증받음
			HttpSession session=request.getSession();
			session.setAttribute("loginHost",loginHost);
			List<Notifications> list =new HostService().selectAllNotifications(hostId);
			int notcount = new HostService().notificationsCount(hostId);
		
			session.setAttribute("notcount",notcount);
			session.setAttribute("Notlist",list);
			//수강일이 지나면 결제완료 -> 수강완료로 업데이트되는 구문 
			int updateReservatation = new PaymentService().updatePaymentStatus();
			//화면전환시킬방법 2가지중 sendRedirect로 보낸다 이유는 데이터를  session 저장시켰고, url주소에 정보를 남기지 않기 위해서
			response.sendRedirect(request.getContextPath()+"/hostMain.do");
			
		}else if(loginHost!=null&&loginHost.getHostId().equals("admin")){
			HttpSession session=request.getSession();
			session.setAttribute("loginHost",loginHost);
			List<Notifications> list =new HostService().selectAllNotifications(hostId);
			int notcount = new HostService().notificationsCount(hostId);
			//수강일이 지나면 결제완료 -> 수강완료로 업데이트되는 구문 
			int updateReservatation = new PaymentService().updatePaymentStatus();
			session.setAttribute("notcount",notcount);
			session.setAttribute("Notlist",list);
			
			response.sendRedirect(request.getContextPath()+"/admin/AdminMainServlet.do");
		}else {
			//로그인 실패 -> 인증못받음
			//실패 메세지 출력
			request.setAttribute("msg","아이디,패스워드가 일치하지 않습니다");
			request.setAttribute("loc","/");
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