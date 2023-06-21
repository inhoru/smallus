<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.smallus.member.model.vo.Member"%>
<%@ include file="/views/admin/adminHeader.jsp"%>
<%
List<Member> memberList=(List)request.getAttribute("MemberList"); 
%>
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
					<tr>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<td><button>삭제</button></td>
					</tr>
				</table>
			</div>
		</section>
		<div id="pageBar">
			<%=request.getAttribute("pageBar")%>
		</div>
</div>
</body>
<%@ include file="/views/common/footer.jsp"%>