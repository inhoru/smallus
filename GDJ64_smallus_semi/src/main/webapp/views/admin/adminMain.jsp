<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.smallus.classes.model.vo.Classes,com.smallus.member.model.vo.Member, com.smallus.host.model.vo.Host,
	com.smallus.classes.model.vo.Classes, com.smallus.notice.model.vo.Notice,com.smallus.notice.model.vo.NoticeImage, java.util.List"%>
<%
List<Classes> ClassesConfirmList = (List) request.getAttribute("ClassesConfirmList");
List<Notice> NoticeLists = (List) request.getAttribute("NoticeList");
%>
<%@ include file="/views/common/hostHeader.jsp"%>
<style>
button#deleteNoticebtn, #m-classconfirmbtn, #m-classrejectbtn {
	width: 4rem;
	font-weight: bold;
	background-color: #E8D6C3;
	border: 0px;
	border-radius: 1rem;
	text-align: center;
	font-size: 0.5rem;
	height: 25px;
	cursor: pointer;
}
</style>
<body>
	<section class="h-main">
		<div class="h-main-title">
			<h2>클래스 승인관리</h2>
		</div>
	</section>
	<section class="h-main h-main-rsvList">
		<div>
			<table id="h-main-rsv-tbl">
				<tr>
					<th>카테고리</th>
					<th>클래스이름</th>
					<th>호스트아이디</th>
					<th>등록일</th>
					<th>승인상태</th>
					<th></th>
					<th></th>
				</tr>
				<%
				if (ClassesConfirmList != null && !ClassesConfirmList.isEmpty()) {
					for (Classes c : ClassesConfirmList) {
				%>
				<tr>
					<td><%=c.getCategoryTitle()%></td>
					<td><%=c.getClassTitle()%></td>
					<td><%=c.getHostId()%></td>
					<td><%=c.getClassUpLoadDate()%></td>
					<td><%=c.getClassPassId()%></td>
					<td><button id="m-classconfirmbtn"
							onclick="classconfirm('<%=c.getClassId()%>');">승인</button></td>
					<td><button id="m-classrejectbtn"
							onclick="classreject('<%=c.getClassId()%>');">거절</button></td>
				</tr>
				<%
				}
				%>
				<%
				} else {
				%>
				<tr>
					<td colspan="7">승인할 클래스가 없습니다.</td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
	</section>
	<div class="pageBar">
		<%
		if (request.getAttribute("pageBar") != null) {
		%>
		<%=request.getAttribute("pageBar")%>
		<%
		}
		%>
	</div>
	<section class="h-main">
		<div class="h-main-title">
			<h2>공지사항</h2>
			<!-- 공지사항 추가페이지로 이동 -->
			<%
			if (hostInfo.getHostId().equals("admin")) {
			%>
			<div class="h-viewList">
				<a
					href="<%=request.getContextPath()%>/views/admin/adminNoticeEnroll.jsp">+</a>
			</div>
			<%
			} else {
			%>

			<%
			}
			%>
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
					<%
					if (hostInfo.getHostId().equals("admin")) {
					%>
					<th></th>
					<%
					}
					%>
				</tr>
				<%
				if (NoticeLists != null && !NoticeLists.isEmpty()) {
					for (Notice n : NoticeLists) {
				%>
				<tr style="cursor: pointer;"
					onclick="noticedetail('<%=n.getNoticeId()%>');">
					<%
					if (n.getNoticeType().equals("1")) {
					%>
					<td>공지사항</td>
					<%
					} else if (n.getNoticeType().equals("2")) {
					%>
					<td>이벤트</td>
					<%
					} else {
					%>
					<td>기타</td>
					<%
					}
					%>
					<td><%=n.getNoticeTitle()%></td>
					<td><%=n.getNoticeRdate()%></td>
					<td><%=n.getHostId()%></td>
					<td>
						<%
						if (hostInfo.getHostId().equals("admin")) {
						%>
						<button id="deleteNoticebtn" style="cursor: pointer;"
							onclick="deleteNotice('<%=n.getNoticeId()%>');">삭제</button> <%
 }
 %>
					</td>
				</tr>
				<tr>
					<td colspan="5" class="m-noticedetailcontainer<%=n.getNoticeId()%>"
						style="display: none;">
						<div>
							<img
								src="<%=request.getContextPath()%>/upload/notice/<%=n.getNoticeImageRename()%>"
								alt="이게왜안떠?" style="height: 500px; width: 400px;">
							<p style="width: 1350px;"><%=n.getNoticeContent()%></p>
						</div>
					</td>
				</tr>
				<%
				}
				%>
				<%
				} else {
				%>
				<tr>
					<td colspan="5">등록된 공지사항이 없습니다.</td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
	</section>
</body>
<script>
	$(() => {
		location.assign("<%=request.getContextPath()%>/admin/ClaasesListServlet.do");
		$(".m-noticedetailcontainer").hide();
	});
</script>

<%@ include file="/views/common/hostFooter.jsp"%>