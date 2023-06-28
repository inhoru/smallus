<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.smallus.classes.model.vo.Classes,com.smallus.member.model.vo.Member, com.smallus.host.model.vo.Host,
	com.smallus.classes.model.vo.Classes, com.smallus.notice.model.vo.Notice,com.smallus.notice.model.vo.NoticeImage, java.util.List,
	com.smallus.host.model.vo.Calc"%>
<%
List<Classes> ClassesList = (List) request.getAttribute("ClassesList");
List<Calc> CalcList = (List) request.getAttribute("CalcList");
%>
<%@ include file="/views/common/hostHeader.jsp"%>
<style>
button#deleteNoticebtn, #m-classdeletebtn {
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
	<div style="cursor:pointer;" onclick="moveConfirmClasses();">
		<section class="h-main">
			<div class="h-main-title">
				<h2>최근 클래스 승인요청 건</h2>
				<%
				if (loginHost.getHostId().equals("admin")) {
				%>
				<div class="h-viewList">
					<a href=""></a>
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
				<table id="h-main-rsv-tbl">
					<tr>
						<th>카테고리</th>
						<th>클래스이름</th>
						<th>호스트아이디</th>
						<th>등록일</th>
						<th>승인상태</th>
					</tr>
					<%
					if (ClassesList != null && !ClassesList.isEmpty()) {
						for (Classes c : ClassesList) {
					%>
					<tr>
						<td><%=c.getCategoryTitle()%></td>
						<td><%=c.getClassTitle()%></td>
						<td><%=c.getHostId()%></td>
						<td><%=c.getClassUpLoadDate()%></td>
						<td>승인대기</td>
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
	</div>
	<div style="cursor:pointer;" onclick="moveConfirmCalc()">
		<section class="h-main">
			<div class="h-main-title">
				<h2>최근 호스트 정산승인요청 건</h2>
				<%
				if (loginHost.getHostId().equals("admin")) {
				%>
				<div class="h-viewList">
					<a href=""></a>
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
				<table id="h-main-rsv-tbl">
					<tr>
						<th>정산번호</th>
						<th>호스트아이디</th>
						<th>정산요청일</th>
						<th>정산요청금액</th>
						<th>정산최종금액</th>
						<th>정산상태</th>
					</tr>
					<%
					if (CalcList != null && !CalcList.isEmpty()) {
						for (Calc c : CalcList) {
					%>
					<tr>
						<td><%=c.getCalcId()%></td>
						<td><%=c.getHostId()%></td>
						<td><%=c.getCalcReqDate()%></td>
						<td><%=c.getCalcPrice()%>원</td>
						<td><%=(int) Math.round(c.getCalcPrice() * 0.8)%>원</td>
						<td>정산대기</td>
					</tr>
					<%
					}
					%>
					<%
					} else {
					%>
					<tr>
						<td colspan="7">승인할 정산요청이 없습니다.</td>
					</tr>
					<%
					}
					%>
				</table>
			</div>
		</section>
	</div>
</body>
<script>
	function moveConfirmClasses(){
		location.assign("<%=request.getContextPath()%>/admin/ClassesConfirmListServlet.do");
	}
	function moveConfirmCalc(){
		location.assign("<%=request.getContextPath()%>/admin/ClacConfirmListServlet.do");
	}
</script>
<%@ include file="/views/common/hostFooter.jsp"%>