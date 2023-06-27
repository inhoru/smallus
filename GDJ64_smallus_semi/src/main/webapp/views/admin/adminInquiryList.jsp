<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.smallus.Inquiry.model.vo.Inquiry"%>
<%@ include file="/views/common/hostHeader.jsp"%>
<%
List<Inquiry> InquiryList = (List)request.getAttribute("InquiryList");
%>
<style>
#pageBar {
	align-items: center;
}

button#m-InquiryEnrollbtn{
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
			<h2>1:1문의 관리</h2>
		</div>
<%-- 			<select id="m-selectCalc" onchange="selectCalc();">
				<option value="A">전체정산내역</option>
				<option value="Y" <%=request.getParameter("calcStatus")!=null&&request.getParameter("calcStatus").equals("Y")?"selected":""%>>정산완료</option>
				<option value="W" <%=request.getParameter("calcStatus")!=null&&request.getParameter("calcStatus").equals("W")?"selected":""%>>정산대기</option>
				<option value="N" <%=request.getParameter("calcStatus")!=null&&request.getParameter("calcStatus").equals("N")?"selected":""%>>정산거절</option>
			</select> --%>
	</section>
	<section class="h-main h-main-rsvList">
		<div>
			<table id="h-main-rsv-tbl">
				<tr>
					<th>1:1문의 유형</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>답변상태</th>
				</tr>
				<%if (InquiryList != null && !InquiryList.isEmpty()) {
					for (Inquiry c : InquiryList) {%>
				<tr style="cursor: pointer"; onclick="inquirydetail('<%=c.getBoardId()%>')">
					<td><%=c.getBoardType() %></td>
					<td><%=c.getBoardTitle() %></td>
					<td><%=c.getMemberId() %></td>
					<td><%=c.getBoardRdate() %></td>
					<td><%=c.getBoardCheck() %></td>
					<td><button id="m-InquiryEnrollbtn"
							onclick="InquiryEnroll('<%=c.getBoardId()%>');">답변등록하기</button></td>
				</tr>
				<tr class="m-inquirydetailcontainer<%=c.getBoardId() %>" style="display:none;">
					<td colspan="6">
						<div>
						<%if(c.getSfRename()!=null){ %>
							<img src="<%=request.getContextPath()%>/upload/inquiry/<%=c.getSfRename()%>" alt="" style="height:;,width:;">
							<%} %>
							<pre><%=c.getBoardContent() %></pre>
						</div>
					</td>
				</tr>
				<%}%>
				<%} else {%>
				<tr>
					<td colspan="7">조회할 데이터가 없습니다.</td>
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
$(() => {
	$(".m-inquirydetailcontainer").hide();
});

function inquirydetail(boardId){
$(".m-inquirydetailcontainer"+boardId).slideToggle();
}
<%-- const selectCalc=()=>{
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
}; --%>
	function InquiryEnroll(boardId){
		console.log(boardId);
		location.assign("<%=request.getContextPath()%>/admin/InquiryEnrollServlet.do?boardId="+boardId);
	}
</script>
<%@ include file="/views/common/footer.jsp"%>