<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smallus.host.model.vo.Host"%>
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
    <!-- fullcalendar css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
    <!-- fullcalendar 언어 설정관련 script -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
    <!-- 호스트 클래스등록 css 적용(다영) -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/class/addClass.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/class/addClassSchedule.css"/>
    
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminHeader.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminMainStyle.css"/>
</head>
<body>
    <header>
        <div id="headerContainer">
            <a href="<%=request.getContextPath()%>/host/moveHostMainpage.do"><img src="<%=request.getContextPath() %>/img/main.png" alt="호스트 메인페이지로 이동" id="logo"></a>
            <div class="h-iconContainer">
                <a href="<%=request.getContextPath()%>/views/admin/adminMain.jsp" class="h-move-mypage"><img src="<%=request.getContextPath() %>/img/mypage/기본프로필.png" alt="" ><%=loginHost.getHostName() %>님</a>
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
	
	<div class="m-navContainer">
	    <table class="m-nav">
			<tr>
				<th><a href="">회원관리</a></th>
				<th><a href="">승인관리</a></th>
				<th><a href="">고객센터</a></th>
			</tr>
			<tr>
				<td><a href="">일반회원관리</a></td>
				<td><a href="">클래스승인</a></td>
				<td><a href="">공지사항</a></td>
			</tr>
			<tr>
				<td><a href="">호스트회원관리</a></td>
				<td><a href="">정산승인</a></td>
				<td><a href="">1:1문의</a></td>
			</tr>
	    </table>
	</div>

</body>
</html>