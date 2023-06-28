<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.smallus.member.model.vo.Member, com.smallus.host.model.vo.Host,
com.smallus.classes.model.vo.Classes, com.smallus.notice.model.vo.Notice,com.smallus.notice.model.vo.NoticeImage, java.util.List"%>
<%
	String include;
	//Member infoMember=(Member)request.getAttribute("infoMember");
	Host loginHost=(Host)session.getAttribute("loginHost");
	List<Notice> NoticeLists=(List)request.getAttribute("NoticeList");
	List<NoticeImage> NoticeImages=(List)request.getAttribute("NoticeImage");
	if(loginHost!=null){
		include="/views/common/hostHeader.jsp";
	}else{
		include="/views/common/mainHeader.jsp";
	}
%>
<jsp:include page="<%=include%>"/>
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/common/headrFooter.css">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/common/main.css">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/mypage/mypage.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/host/hostHeader.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/host/hostMainStyle.css">

<style>
	button#deleteNoticebtn {
	width:4rem;
	font-weight: bold;
	background-color: #E8D6C3;
	border:0px;
	border-radius: 1rem;
	text-align:center;
	font-size: 0.5rem;
	height:25px;
	cursor:pointer;
}

</style>
<body>
<div id="mainOpacity h-host-main">
        <section class="h-main">
            <div class="h-main-title">
                <h2>공지사항</h2>
                <!-- 공지사항 추가페이지로 이동 -->
                <%if(loginHost!=null&&loginHost.getHostId().equals("admin")){ %>
                <div class="h-viewList"><a href="<%=request.getContextPath()%>/views/admin/adminNoticeEnroll.jsp">+</a></div>
                <%}else{%>
                	
                <%} %>
            </div>
        </section>
        <section class="h-main h-main-rsvList">
            <div>
                <table id="m-table">
                    <tr>
                    	<th>종류</th>
                        <th>제목</th>
                        <th>작성일</th>
                       	<%if(loginHost!=null&&loginHost.getHostId().equals("admin")){ %>
                        <th></th>
                        <%}else{%>
                        <%} %>
                    </tr>
                    <%if(NoticeLists!=null&&!NoticeLists.isEmpty()) {
						for(Notice n:NoticeLists){%>
	                    <tr style="cursor:pointer;" onclick="noticedetail('<%=n.getNoticeId()%>');">
	                    	<%if(n.getNoticeType().equals("1")){%>
	                    	<td>공지사항</td>
	                    	<%}else if(n.getNoticeType().equals("2")){%>
	                    	<td>이벤트</td>
	                    	<%}else{%>
	                    	<td>기타</td><%}%>
	                    	<td style="text-align:left; padding-left:10px;"><%=n.getNoticeTitle()%></td>
	                    	<td><%=n.getNoticeRdate()%></td>
	                    	<td>
	                    	 <%if(loginHost!=null&&loginHost.getHostId().equals("admin")){ %>
	                    	<button id="deleteNoticebtn" style="cursor:pointer;" onclick="deleteNotice('<%=n.getNoticeId()%>');">삭제</button>
	                    	<%}%>
	                    	</td>
	                    </tr>
	                    <tr class="m-noticedetailcontainer<%=n.getNoticeId()%>" style="display:none;">
	                    	<td colspan="4">
	                    	<div>
	                    	<%if(n.getNoticeFilepath()!=null){ %>
	                    	<img src="<%=request.getContextPath()%>/upload/notice/<%=n.getNoticeFilepath()%>"alt="" style="height: 300px; width: 200px;">
	                    	<%} %>
	                    	<pre style="width: 1350px; "><%=n.getNoticeContent()%></pre>
	                    	</div>
	                    	</td>
	                    </tr>
	                    <%}%>
                    <%}else{ %>
                    <tr>
                        <td colspan="5">등록된 공지사항이 없습니다.</td>
                    </tr>
                    <%} %>
                </table>
            </div>
        </section>
		<div class="pageBar">
			<%if(request.getAttribute("pageBar")!=null){%>
				<%=request.getAttribute("pageBar")%>
			<%}%>
		</div>
</body>
<script>

$(() => {
		$(".m-noticedetailcontainer").hide();
});

function noticedetail(noticeId){
	$(".m-noticedetailcontainer"+noticeId).slideToggle();
}

function deleteNotice(noticeId){
	location.assign("<%=request.getContextPath()%>/notice/DeleteNotice.do?noticeId="+noticeId);
}
//카테고리 숨긴 상태로 시작
$(document).ready(() => {
  $("#categoriesTable").hide();
});

// 카테고리 클릭시 열리고 닫히는 이벤트
$("#categories").click(() => {
  $("#categoriesTable").slideToggle(500);
});

// 카테고리 열었을 때 다른 곳을 클릭해도 닫힘
$(document).click((e) => {
  const categoriesTable = $("#categoriesTable");
  const categories = $("#categories");
  const isCategoriesTableVisible = categoriesTable.is(":visible");
  const isClickedInsideCategories = categories[0].contains(e.target);
  const isClickedInsideTable = categoriesTable[0].contains(e.target);

  if (isCategoriesTableVisible && !isClickedInsideCategories && !isClickedInsideTable) {
    categoriesTable.slideUp(500);
  }
});

// 알람
$(".i-noticon").on("click", () => {
  $(".notification-container").slideToggle(300);
});
</script>

<%@ include file="/views/common/hostFooter.jsp"%>