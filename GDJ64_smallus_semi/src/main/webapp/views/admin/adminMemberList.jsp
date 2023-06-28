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
	button#m-deletemember {
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
				<h2>일반 회원관리</h2>
			</div>
			<select id="m-selectMember" onchange="selectMember();">
				<option value="A">전체회원</option>
				<option value="Y" <%=request.getParameter("memberSt")!=null&&request.getParameter("memberSt").equals("Y")?"selected":""%>>일반회원</option>
				<option value="K" <%=request.getParameter("memberSt")!=null&&request.getParameter("memberSt").equals("K")?"selected":""%>>카카오회원</option>
				<option value="N" <%=request.getParameter("memberSt")!=null&&request.getParameter("memberSt").equals("N")?"selected":""%>>탈퇴한회원</option>
			</select>
		</section>
		<section class="h-main h-main-rsvList">
			<div>
				<table id="h-main-rsv-tbl" style="empty-cells:hide;">
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
						<%if(m.getMemberConsent().equals("Y")){ %>
							<td>수신동의</td>
						<%}else{ %>
							<td>수신미동의</td>
						<%} %>
						<%if(m.getMemberSt().equals("Y")){ %>
							<td>일반회원</td>
						<%}else if(m.getMemberSt().equals("K")){ %>
							<td>카카오회원</td>
						<%}else{ %>
							<td>탈퇴한회원</td>
						<%} %>
						<%if(m.getMemberSt().equals("Y")||m.getMemberSt().equals("K")){ %>
						<td><button id="m-deletemember"onclick="deletemember('<%=m.getMemberId()%>');">삭제</button></td>
						<%}else{%>
							<td></td>
						<%}%>
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
	const selectMember=()=>{
		let index = $("#m-selectMember option").index($("#m-selectMember option:selected"));
		let memberSt=$("#m-selectMember").val();
		if(index==0){
			location.replace('<%=request.getContextPath()%>/admin/memberListServlet.do');
		}else if(index==1){
			location.assign('<%=request.getContextPath()%>/admin/memberListSortServlet.do?memberSt='+memberSt);
		}else if(index==2){
			location.assign('<%=request.getContextPath()%>/admin/memberListSortServlet.do?memberSt='+memberSt);
		}else if(index==3){
			location.assign('<%=request.getContextPath()%>/admin/memberListSortServlet.do?memberSt='+memberSt);
		}
	};
	const deletemember=(memberId)=>{
		location.assign("<%=request.getContextPath()%>/admin/MemberDelete.do?memberId="+memberId);
	} 
</script>
<%@ include file="/views/common/footer.jsp"%>