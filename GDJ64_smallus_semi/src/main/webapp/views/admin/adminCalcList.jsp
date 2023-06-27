<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.smallus.host.model.vo.Calc"%>
<%@ include file="/views/common/hostHeader.jsp"%>
<%
List<Calc> CalcList = (List)request.getAttribute("CalcList");
%>
<style>
#pageBar {
	align-items: center;
}

button#m-classdeletebtn{
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
			<h2>호스트 정산관리</h2>
		</div>
	</section>
	<section class="h-main h-main-rsvList">
		<div>
			<table id="h-main-rsv-tbl">
				<tr>
					<th>정산번호</th>
					<th>호스트아이디</th>
					<th>정산요청일</th>
					<th>정산금액</th>
					<th>최종금액</th>
					<th>정산상태</th>
				</tr>
				<%if (CalcList != null && !CalcList.isEmpty()) {
					for (Calc c : CalcList) {%>
				<tr>
					<td><%=c.getCalcId()%></td>
					<td><%=c.getHostId()%></td>
					<td><%=c.getCalcReqDate()%></td>
					<td><%=c.getCalcPrice()%></td>
					<td><%=c.getCalcFinalPrice()%></td>
					<td>정산대기</td>					
					<td><button id="m-calcConfirm"
							onclick="calcConfirm'<%=c.getCalcId()%>');">정산</button></td>
					<td><button id="m-calcReject"
							onclick="calcReject'<%=c.getCalcId()%>');">거절</button></td>							
				</tr>
				<%}%>
				<%} else {%>
				<tr>
					<td colspan="7">승인할 정산요청이 없습니다.</td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
	</section>
	<div class="pageBar">
		<%if (request.getAttribute("pageBar") != null) {%>
		<%=request.getAttribute("pageBar")%>
		<%}%>
	</div>
</body>
<script>
	function calcConfirm(calcId){
		console.log(calcId);
		location.assign("<%=request.getContextPath()%>/admin/CalcConfirmServlet.do?calcId="+calcId);
	}
</script>
<%@ include file="/views/common/footer.jsp"%>