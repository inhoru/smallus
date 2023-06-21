<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.smallus.member.model.vo.Member"%>
<%@ include file="/views/common/hostHeader.jsp"%>
<%
List<Member> memberList=(List)request.getAttribute("MemberList"); 
%>
<style>
	#pageBar{
		align-items:center;
	}
</style>
<body>
	<div id="mainOpacity h-host-main">
		<section class="h-main">
			<div class="h-main-title">
				<h2>클래스 승인관리</h2>
			</div>
		</section>
		<section class="h-main h-main-rsvList">
			<div>
				<table id="h-main-rsv-tbl">
					<tr>
						<th>카테고리 </th>
						<th>클래스이름</th>
						<th>호스트아이디</th>
						<th>등록일</th>
						<th>승인상태</th>
						<th></th>
						<th></th>
					</tr>
				<%if(memberList!=null&&!memberList.isEmpty()) {
					for(Member m:memberList){%>
					<tr>
						<th><%=m.getMemberId()%></th>
						<th><%=m.getMemberName()%></th>
						<th><%=m.getMemberNickname()%></th>
						<th><%=m.getMemberPhone()%></th>
						<th><%=m.getMemberEmail()%></th>
						<th><%=m.getMemberConsent()%></th>
						<th><%=m.getMemberSt()%></th>
						<td><button id=m-deletememberbtn>삭제</button></td>
					</tr>
					<%} %>
				<%} %>
				</table>
			</div>
		</section>
		<div class="pageBar">
		<%if(request.getAttribute("pageBar")!=null){%>
				<%=request.getAttribute("pageBar")%>
			<%} %>
		</div>
</div>
</body>
<script>
	$("#m-deletememberbtn").click(e=>{
		
	})
</script>
<%@ include file="/views/common/footer.jsp"%>