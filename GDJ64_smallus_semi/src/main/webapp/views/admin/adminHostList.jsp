<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.smallus.host.model.vo.Host"%>
<%@ include file="/views/common/hostHeader.jsp"%>
<%
List<Host> HostList=(List)request.getAttribute("HostList"); 
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
				<h2>호스트회원관리</h2>
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
				<%if(HostList!=null&&!HostList.isEmpty()) {
					for(Host h:HostList){%>
					<tr>
						<td><%=h.getHostId()%></td>
						<td><%=h.getHostName()%></td>
						<th><%=h.getHostNickname()%></th>
						<td><%=h.getHostPhone()%></td>
						<td><%=h.getHostEmail()%></td>
						<td><%=h.getHostConsent()%></td>
						<td><%=h.getHostSt()%></td>
						<td><button id=m-deletememberbtn>삭제</button></td>
					</tr>
					<%} %>
				<%}else{ %>
			        <tr>
                        <td colspan="8">조회된 호스트가 없습니다.</td>
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
	$("#m-deletememberbtn").click(e=>{
		
	})
</script>
<%@ include file="/views/common/footer.jsp"%>