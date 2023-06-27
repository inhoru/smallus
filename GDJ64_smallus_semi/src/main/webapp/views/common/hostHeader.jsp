<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page
   import="com.smallus.host.model.vo.Host,com.smallus.payment.model.vo.Payment, java.util.*,com.smallus.member.model.vo.Notifications"%>
<%
Host loginHost = (Host) session.getAttribute("loginHost");

Cookie[] cookies = request.getCookies();
String savehostId = null;
if (cookies != null) {
   for (Cookie c : cookies) {
      if (c.getName().equals("savehostId")) {
   savehostId = c.getValue();
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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/host/hostHeader.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/host/hostMainStyle.css">
 

<script type="text/javascript"
   src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
<!-- fullcalendar css -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script> -->
<!-- fullcalendar 언어 설정관련 script -->
 
<%-- <script src="<%=request.getContextPath() %>/js/chart.js"></script> --%>
<script type="text/javascript"
   src="https://www.gstatic.com/charts/loader.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>

<!-- 호스트 클래스등록 css 적용(다영) -->
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/class/addClass.css" />
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/class/addClassSchedule.css" />
</head>
<body>
   <header>
      <div id="headerContainer">
         <%
         if (loginHost != null && !loginHost.getHostId().equals("admin")) {
         %>
         <a href="<%=request.getContextPath()%>/hostMain.do"><img
            src="<%=request.getContextPath()%>/img/main.png" alt="호스트 메인페이지로 이동"
            id="logo"></a>
         <%
         } else {
         %>
         <a href="<%=request.getContextPath()%>/admin/AdminMainServlet.do"><img
            src="<%=request.getContextPath()%>/img/main.png"
            alt="admin 메인페이지로 이동" id="logo"></a>
         <%
         }
         %>
         <div class="h-iconContainer">
            <%
            if (loginHost != null) {
            %>
            <a href="<%=request.getContextPath()%>/host/moveHostProfile.do"
               class="h-move-mypage"><img
               src="<%=request.getContextPath()%>/img/mypage/기본프로필.png" alt=""><%=loginHost.getHostNickname()%>님</a>
            <%
            }
            %>
            <a href="<%=request.getContextPath()%>/host/hostLogout.do"
               class="h-logout">로그아웃</a>
            <%
         if (loginHost != null&&!loginHost.getHostId().equals("admin")) {
            List<Notifications> not = (List) session.getAttribute("Notlist");
            int notcount = (int) session.getAttribute("notcount");
         %>

         <div class="notification-icon">
            <div class="icon i-noticon">
               <img src="<%=request.getContextPath()%>/img/알림.png" alt=""
                  width="25px" height="25px"> <span class="num-count"><%=notcount%></span>
            </div>
         </div>
         <div class="notification-container">
            <div class="scroll-snap-card">
               <div class="slide">
                  <p class="tip">
                  <div class="i-notifcationTotal">
                     <%
                     int count = 2;
                     %>
                     <%
                     if (!not.isEmpty()) {
                     %>
                     <%
                     for (Notifications n : not) {
                     %>
                     <input class="checkbox" type="checkbox" id="size_<%=count%>"
                        value="small" checked /> <label class="notification"
                        for="size_<%=count%>"><span><%=n.getCreatedAt()%></span>
                        <br /><a href="<%=request.getContextPath()%>/class/viewHostClassList.do"><span class="i-notType"><%=n.getNotiflType()%><%= n.getNotiflMessage()%></span> 
                      <%=n.getTypeTitle()%>
                     </a><input type="hidden" value="<%=n.getNotiflId()%>" class="i-notId"></label>

                     <%
                     count++;
                     }
                     %>
                     <%
                     } else {
                     %>
                     <div class="i-nocoupon">알림이 없습니다.</div>
                     <%
                     }
                     }
                     %>
                  </div>
               </div>
            </div>
         </div>
            </div>
         </div>

      </div>
   </header>
   <!-- menu-category -->
   <%
   if (loginHost != null && !loginHost.getHostId().equals("admin")) {
   %>
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
               <td><a href="<%=request.getContextPath()%>/hostProfile.do">프로필
                     수정</a></td>
               <td><a
                  href="<%=request.getContextPath()%>/class/viewHostClassList.do"
                  id="h-viewCLassList">내 클래스 보기</a></td>
               <td><a
                  href="<%=request.getContextPath()%>/host/viewHostRsv.do">클래스
                     예약 관리</a></td>
               <td><a
                  href="<%=request.getContextPath()%>/admin/noticeListServlet.do">공지사항</a></td>
            </tr>
            <tr>
               <td><a href="<%=request.getContextPath()%>/host/withdrawal.do">회원
                     탈퇴</a></td>
               <%-- <td><a href="<%=request.getContextPath()%>/host/withdrawalPasswordCheck.do">회원 탈퇴</a></td> --%>
               <td><a href="">클래스 등록하기</a></td>
               <td><a
                  href="<%=request.getContextPath()%>/host/viewHostCalc.do">정산
                     정보 관리</a></td>
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
               <td><a
                  href="<%=request.getContextPath()%>/host/viewHostReview.do">후기
                     관리</a></td>
            </tr>
         </table>
      </div>
   </section>
   <%
   } else {
   %>
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
               <td><a
                  href="<%=request.getContextPath()%>/admin/memberListServlet.do">일반회원관리</a></td>
               <td><a
                  href="<%=request.getContextPath()%>/admin/ClassesListServlet.do">호스트클래스</a></td>
               <td><a
                  href="<%=request.getContextPath()%>/admin/ClassesConfirmListServlet.do">클래스승인</a></td>
               <td><a
                  href="<%=request.getContextPath()%>/admin/noticeListServlet.do">공지사항</a></td>
            </tr>
            <tr>
               <td><a
                  href="<%=request.getContextPath()%>/admin/HostListServlet.do">호스트회원관리</a></td>
               <td><a href="">호스트정산</a></td>
               <td><a
                  href="<%=request.getContextPath()%>/admin/ClacListServlet.do">정산승인</a></td>
               <td><a href="">1:1문의</a></td>
            </tr>
         </table>
      </div>
   </section>
   <%
   }
   %>
   
   <script>
   //알림 클릭시 삭제
     $(".checkbox").change(e=>{
        var notId = $(e.target).next().find('.i-notId').val();
        console.log(notId);
         
            $.ajax({
               type:"get",
               url:"<%=request.getContextPath()%>/notificationsRemove.do",
                data: {notId:notId},
               success:data=>{
                  
               },
               error:(r,m)=>{
                  console.log(r);
                  console.log(m);
                  if(e.status==404) alert("요청한 페이지가 없습니다");
               }
            })
     })

     $(".i-noticon").on("click", () => {
  $(".notification-container").slideToggle(300);
});
   </script>
 
