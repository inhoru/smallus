<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smallus.host.model.vo.Host,com.smallus.payment.model.vo.Payment, java.util.*"%>
<%
	Host loginHost=(Host)session.getAttribute("loginHost");
	
	Cookie[] cookies = request.getCookies();
	String savehostId=null;
	if (cookies != null) {
		for (Cookie c : cookies) {
			if(c.getName().equals("savehostId")){
				savehostId=c.getValue();
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Small us ☺</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/host/hostHeader.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/host/hostMainStyle.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
    <!-- fullcalendar css -->
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script> -->
    <!-- fullcalendar 언어 설정관련 script -->
    <%-- <script src="<%=request.getContextPath() %>/js/calendar.js"></script> --%>
    <%-- <script src="<%=request.getContextPath() %>/js/chart.js"></script> --%>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
    
    <!-- 호스트 클래스등록 css 적용(다영) -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/class/addClass.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/class/addClassSchedule.css"/>
</head>
<body>
    <header>
        <div id="headerContainer">
        	<%if(loginHost!=null&&!loginHost.getHostId().equals("admin")){%>
            <a href="<%=request.getContextPath()%>/hostMainpage.do"><img src="<%=request.getContextPath() %>/img/main.png" alt="호스트 메인페이지로 이동" id="logo"></a>
            <%}else{ %>
            <a href="<%=request.getContextPath()%>/admin/AdminMainServlet.do"><img src="<%=request.getContextPath() %>/img/main.png" alt="admin 메인페이지로 이동" id="logo"></a>
            <%} %>
            <div class="h-iconContainer">
            <%if(loginHost!=null) {%>
                <a href="<%=request.getContextPath()%>/host/moveHostProfile.do" class="h-move-mypage"><img src="<%=request.getContextPath() %>/img/mypage/기본프로필.png" alt="" ><%=loginHost.getHostNickname() %>님</a>
                <%} %>
                <a href="<%=request.getContextPath() %>/host/hostLogout.do" class="h-logout">로그아웃</a>
                <div class="h-notification-icon">
                    <div class="icon"><img src="<%=request.getContextPath() %>/img/알림.png" alt="">
                        <span class="h-num-count">13</span>
                    </div>
                    <div class="h-notification-container">
                        <input class="h-checkbox" type="checkbox" id="size_1" value="small" checked />
                        <label class="h-notification" for="size_1"><a href=""><span>[1:1] </span>1:1문의에대한 답변이등록되었습니다.</a></label>
                        <input class="h-checkbox" type="checkbox" id="size_2" value="small" checked />
                        <label class="h-notification" for="size_2"><a href=""><span>[Q&A] </span>Q&A에대한 답변이 등록되었습니다.</a></label>    
                        <input class="h-checkbox" type="checkbox" id="size_3" value="small" checked/>
                        <label class="h-notification" for="size_3"><a href=""><span>[클래스 승인] </span>이노의안되면된느거하라 클래스 승인되었습니다.</a></label>    
                        <input class="h-checkbox" type="checkbox" id="size_4" value="small" checked/>
                        <label class="h-notification" for="size_4"><a href=""><span>[클래스 승인] </span>이노의성공하는법 클래스 승인이거절당했습니다.</a></label>    
                        <input class="h-checkbox" type="checkbox" id="size_5" value="small" checked/>
                        <label class="h-notification" for="size_5"><a href=""><span>[클래스 문의] </span>이게배송왜안옴 문의글에 답변이달렸습니다.</a></label>
                    </div>
                </div>
            </div>
            
        </div>
    </header>
    <!-- menu-category -->
    <%if(loginHost!=null&&!loginHost.getHostId().equals("admin")){ %>
        <section class="h-menu">
            <div>
                <table>
                    <tr>
                        <th>호스트 관리</th>
                        <th>클래스 관리</th>
                        <th>예약 관리</th>
                        <th>고객 센터</th>
                    </tr>
                    <tr>
                        <td><a href="<%=request.getContextPath()%>/hostProfile.do">프로필 수정</a></td>
                        <td><a href="<%=request.getContextPath()%>/class/viewHostClassList.do" id="h-viewCLassList">내 클래스 보기</a></td>
                        <td><a href="<%=request.getContextPath()%>/host/viewHostRsv.do">클래스 예약 관리</a></td>
                        <td><a href="<%=request.getContextPath()%>/admin/noticeListServlet.do">공지사항</a></td>
                    </tr>
                    <tr>
                        <td><a href="<%=request.getContextPath()%>/host/withdrawal.do">회원 탈퇴</a></td>
                        <%-- <td><a href="<%=request.getContextPath()%>/host/withdrawalPasswordCheck.do">회원 탈퇴</a></td> --%>
                        <td><a href="">클래스 등록하기</a></td>
                        <td><a href="<%=request.getContextPath()%>/host/viewHostCalc.do">정산 정보 관리</a></td>
                        <td><a href="">1:1 문의</a></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><a href="">Q&A 관리</a></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><a href="<%=request.getContextPath()%>/host/viewHostReview.do">후기 관리</a></td>
                    </tr>
                </table>
            </div>            
        </section>
	<%}else {%>
	<section class="h-menu">
		<div>
		    <table>
				<tr>
					<th><b>회원관리</b></th>
					<th><b>호스트관리</b></th>
					<th><b>승인관리</b></th>
					<th><b>고객센터</b></th>
				</tr>
				<tr>
					<td><a href="<%=request.getContextPath()%>/admin/memberListServlet.do">일반회원관리</a></td>
					<td><a href="<%=request.getContextPath()%>/admin/ClassesListServlet.do">호스트클래스</a></td>
					<td><a href="<%=request.getContextPath()%>/admin/ClassesConfirmListServlet.do">클래스승인</a></td>
					<td><a href="<%=request.getContextPath()%>/admin/noticeListServlet.do">공지사항</a></td>
				</tr>
				<tr>
					<td><a href="<%=request.getContextPath()%>/admin/HostListServlet.do">호스트회원관리</a></td>
					<td><a href="">호스트정산</a></td>
					<td><a href="<%=request.getContextPath()%>/admin/ClacListServlet.do">정산승인</a></td>
					<td><a href="">1:1문의</a></td>
				</tr>
		    </table>
		</div>
	</section>
	<%}%>