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

button#m-calcdeletebtn{
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
			<select id="m-selectCalc" onchange="selectCalc();">
				<option value="A">전체정산내역</option>
				<option value="Y" <%=request.getParameter("calcStatus")!=null&&request.getParameter("calcStatus").equals("Y")?"selected":""%>>정산완료</option>
				<option value="W" <%=request.getParameter("calcStatus")!=null&&request.getParameter("calcStatus").equals("W")?"selected":""%>>정산대기</option>
				<option value="N" <%=request.getParameter("calcStatus")!=null&&request.getParameter("calcStatus").equals("N")?"selected":""%>>정산거절</option>
			</select>
	</section>
	<section class="h-main h-main-rsvList">
		<div>
			<table id="h-main-rsv-tbl">
				<tr>
					<th>정산번호</th>
					<th>호스트아이디</th>
					<th>정산요청일</th>
					<th>정산승인일</th>
					<th>정산요청금액</th>
					<th>정산최종금액</th>
					<th>정산상태</th>
				</tr>
				<%if (CalcList != null && !CalcList.isEmpty()) {
					for (Calc c : CalcList) {%>
				<tr>
					<td><%=c.getCalcId()%></td>
					<td><%=c.getHostId()%></td>
					<td><%=c.getCalcReqDate()%></td>
					<td><%=c.getCalcPassDate()%></td>
					<td><%=c.getCalcPrice()%></td>
					<td><%=c.getCalcFinalPrice()%></td>
					<%if(c.getCalcStatus().equals("Y")){ %>
					<td>정산완료</td>
					<%}else if(c.getCalcStatus().equals("W")){ %>
					<td>정산대기</td>
					<%}else{ %>
					<td>정산거절</td>
					<%} %>
				</tr>
				<%}%>
				<%} else {%>
				<tr>
					<td colspan="7">조회할 정산내역이 없습니다.</td>
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
const selectCalc=()=>{
	let index = $("#m-selectCalc option").index($("#m-selectCalc option:selected"));
	let calcStatus=$("#m-selectCalc").val();
	console.log(index,calcStatus);
	if(index==0){
		location.replace('<%=request.getContextPath()%>/admin/ClacListServlet.do');
	}else if(index==1){
		location.assign('<%=request.getContextPath()%>/admin/ClacSortListServlet.do?calcStatus='+calcStatus);
	}else if(index==2){
		location.assign('<%=request.getContextPath()%>/admin/ClacSortListServlet.do?calcStatus='+calcStatus);
	}else if(index==3){
		location.assign('<%=request.getContextPath()%>/admin/ClacSortListServlet.do?calcStatus='+calcStatus);
	}
};
</script>
<%@ include file="/views/common/footer.jsp"%>