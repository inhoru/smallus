<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.smallus.member.model.vo.Member, com.smallus.host.model.vo.Host,
com.smallus.classes.model.vo.Classes, com.smallus.notice.model.vo.Notice, java.util.List"%>
<%
	String include;
	Member infoMember=(Member)request.getAttribute("infoMember");
	Host hostInfo=(Host)request.getAttribute("hostInfo");
	List<Notice> NoticeLists=(List)request.getAttribute("NoticeList");
	if(hostInfo!=null){
		include="/views/common/hostHeader.jsp";
	}else{
		include="/views/common/mainHeader.jsp";
	}
%>
<jsp:include page="<%=include%>"/>
<style>
</style>
<body>
<div id="mainOpacity h-host-main">
        <section class="h-main">
            <div class="h-main-title">
                <h2>공지사항</h2>
                <!-- 공지사항 추가페이지로 이동 -->
                <%if(hostInfo.getHostId().equals("admin")){ %>
                <div class="h-viewList"><a href="<%=request.getContextPath()%>/views/admin/adminNoticeEnroll.jsp">+</a></div>
                <%}%>
            </div>
        </section>
        <section class="h-main h-main-rsvList">
            <div>
                <table id="m-table">
                    <tr>
                    	<th>종류</th>
                        <th>제목</th>
                        <th>작성일</th>
                        <th>작성자</th>
                       	<%if(hostInfo.getHostId().equals("admin")){ %>
                        <th></th>
                        <%}%>
                    </tr>
                    <%if(NoticeLists!=null&&!NoticeLists.isEmpty()) {
						for(Notice n:NoticeLists){%>
	                    <tr id="m-noticedetail" style="cursor:pointer;">
	                    	<%if(n.getNoticeType().equals("1")){%>
	                    	<td>공지사항</td>
	                    	<%}else if(n.getNoticeType().equals("2")){%>
	                    	<td>이벤트</td>
	                    	<%}else{%>
	                    	<td>기타</td><%}%>
	                    	<td><%=n.getNoticeTitle()%></td>
	                    	<td><%=n.getNoticeRdate()%></td>
	                    	<td><%=n.getHostId()%></td>
	                    	<td>
	                    	 <%if(hostInfo.getHostId().equals("admin")){ %>
	                    	<button id="deleteNoticebtn" style="cursor:pointer;">삭제</button>
	                    	<%}%>
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
$("#m-noticedetail").click(e=>{
	location.assign("<%=request.getContextPath()%>/")
	
	})
$("#deleteNoticebtn").click(e=>{
	location.assign("<%=request.getContextPath()%>/")
})
</script>
<%@ include file="/views/common/hostFooter.jsp"%>