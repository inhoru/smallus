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
			<select id="m-selectInquiry" onchange="selectInquiry();">
				<option value="A">전체내역</option>
				<option value="답변완료" <%=request.getParameter("boardCheck")!=null&&request.getParameter("boardCheck").equals("답변완료")?"selected":""%>>답변완료</option>
				<option value="답변대기" <%=request.getParameter("boardCheck")!=null&&request.getParameter("boardCheck").equals("답변대기")?"selected":""%>>답변대기</option>
			</select>
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
				</tr>
				<tr class="m-inquirydetailcontainer<%=c.getBoardId() %>" style="display:none;">
					<td>1:1문의내용</td>
					<td colspan="4" style="padding-left:10px; text-align:left;">
						<div>
						<%if(c.getSfRename()!=null){ %>
							<img src="<%=request.getContextPath()%>/upload/inquiry/<%=c.getSfRename()%>" alt="" style="height:200px;,width:200px;">
							<%} %>
							<pre><%=c.getBoardContent() %></pre>
						</div>
					</td>
					
				</tr>
					<%if(!c.getBoardCheck().equals("답변완료")){ %>
					<tr class="m-inquirydetailcontainer<%=c.getBoardId() %>" style="display:none;">
						<td>1:1문의답변</td>
						<td colspan="3" style="padding-left:10px; text-align:left;">
							<input type="text" name="commentConent" id="commentConent<%=c.getBoardId()%>" style="width:800px;">
						</td>
						<td><button id="m-InquiryEnrollbtn"
								onclick="InquiryEnroll('<%=c.getBoardId()%>');">답변등록하기</button></td>
					</tr>
					<%} %>
				<%}%>
				<%} else {%>
				<tr>
					<td colspan="5">조회할 데이터가 없습니다.</td>
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
	function InquiryEnroll(boardId){
		console.log(boardId);
		let commentConent=$("#commentConent"+boardId).val();
		console.log(commentConent);
				location.assign("<%=request.getContextPath()%>/admin/InquiryEnrollServlet.do?boardId="+boardId+"&commentConent="+commentConent);
	}
const selectInquiry=()=>{
	let index = $("#m-selectInquiry option").index($("#m-selectInquiry option:selected"));
	let boardCheck=$("#m-selectInquiry").val();
	console.log(index,boardCheck);
	if(index==0){
		location.replace('<%=request.getContextPath()%>/admin/InquiryListServlet.do');
	}else if(index==1){
		location.assign('<%=request.getContextPath()%>/admin/InquirySortListServlet.do?boardCheck='+boardCheck);
	}else if(index==2){
		location.assign('<%=request.getContextPath()%>/admin/InquirySortListServlet.do?boardCheck='+boardCheck);
	}
};
</script>
<%@ include file="/views/common/footer.jsp"%>