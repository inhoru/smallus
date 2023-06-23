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
				<h2>일반회원관리</h2>
			</div>
		</section>
		<section class="h-main h-main-rsvList">
			<div>
				<table id="h-main-rsv-tbl">
					<tr>
						<th>아이디 </th>
						<th>이름</th>
						<th>닉네임</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>마케팅수신동의</th>
						<th>회원상태</th>
						<th></th>
					</tr>
				<%if(memberList!=null&&!memberList.isEmpty()) {
					for(Member m:memberList){%>
					<tr>
						<td><%=m.getMemberId()%></td>
						<td><%=m.getMemberName()%></td>
						<td><%=m.getMemberNickname()%></td>
						<td><%=m.getMemberPhone()%></td>
						<td><%=m.getMemberEmail()%></td>
						<td><%=m.getMemberConsent()%></td>
						<td><%=m.getMemberSt()%></td>
						<td><button onclick="deletemember('<%=m.getMemberId()%>');">삭제</button></td>
					</tr>
					<%} %>
				<%}else{ %>
			        <tr>
                        <td colspan="8">조회된 회원이 없습니다.</td>
                    </tr>
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
	const deletemember=(memberId)=>{
		location.assign("<%=request.getContextPath()%>/admin/MemberDelete.do?memberId="memberId);
	} 
</script>
<%@ include file="/views/common/footer.jsp"%>