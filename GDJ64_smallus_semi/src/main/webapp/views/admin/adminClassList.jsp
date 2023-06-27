<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.smallus.classes.model.vo.Classes"%>
<%@ include file="/views/common/hostHeader.jsp"%>
<%
List<Classes> ClassesList = (List)request.getAttribute("ClassesList");
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
			<h2>호스트 클래스관리</h2>
		</div>
			<select id="m-selectClass" onchange="selectClass();">
				<option value="A">전체클래스</option>
				<option value="CRA" <%=request.getParameter("categoryId")!=null&&request.getParameter("categoryId").equals("CRA")?"selected":""%>>공예</option>
				<option value="BEA" <%=request.getParameter("categoryId")!=null&&request.getParameter("categoryId").equals("BEA")?"selected":""%>>뷰티</option>
				<option value="EXE" <%=request.getParameter("categoryId")!=null&&request.getParameter("categoryId").equals("EXE")?"selected":""%>>운동</option>
				<option value="COO" <%=request.getParameter("categoryId")!=null&&request.getParameter("categoryId").equals("COO")?"selected":""%>>요리</option>
			</select>
	</section>
	<section class="h-main h-main-rsvList">
		<div>
			<table id="h-main-rsv-tbl">
				<tr>
					<th>카테고리</th>
					<th>클래스이름</th>
					<th>호스트아이디</th>
					<th>등록일자</th>
					<th>승인일자</th>
					<th>게시상태</th>
				</tr>
				<%if (ClassesList != null && !ClassesList.isEmpty()) {
					for (Classes c : ClassesList) {%>
				<tr>
					<td style="cursor: pointer;"
					onclick="classdetail('<%=c.getClassId()%>');"><%=c.getCategoryTitle()%></td>
					<td style="cursor: pointer;"
					onclick="classdetail('<%=c.getClassId()%>');"><%=c.getClassTitle()%></td>
					<td style="cursor: pointer;"
					onclick="classdetail('<%=c.getClassId()%>');"><%=c.getHostId()%></td>
					<td style="cursor: pointer;"
					onclick="classdetail('<%=c.getClassId()%>');"><%=c.getClassUpLoadDate()%></td>
					<td style="cursor: pointer;"
					onclick="classdetail('<%=c.getClassId()%>');"><%=c.getClassPassDate()%></td>
					<%if(c.getClassStatus().equals("Y")){ %>
					<td>게시중</td>
					<%}else{ %>
					<td>게시중단</td>
					<%} %>
					<%if(c.getClassStatus().equals("Y")){ %>
					<td><button id="m-classdeletebtn"
							onclick="classdelete('<%=c.getClassId()%>');">게시중단</button></td>
					<%}else{ %>
					<td></td>
					<%} %>
				</tr>
				<%}%>
				<%} else {%>
				<tr>
					<td colspan="5">조회할 클래스가 없습니다.</td>
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
const selectClass=()=>{
	let index = $("#m-selectClass option").index($("#m-selectClass option:selected"));
	let categoryId=$("#m-selectClass").val();
	console.log(index,categoryId);
	if(index==0){
		location.replace('<%=request.getContextPath()%>/admin/ClassesListServlet.do');
	}else if(index==1){
		location.assign('<%=request.getContextPath()%>/admin/ClassesListSortServlet.do?categoryId='+categoryId);
	}else if(index==2){
		location.assign('<%=request.getContextPath()%>/admin/ClassesListSortServlet.do?categoryId='+categoryId);
	}else if(index==3){
		location.assign('<%=request.getContextPath()%>/admin/ClassesListSortServlet.do?categoryId='+categoryId);
	}else if(index==4){
		location.assign('<%=request.getContextPath()%>/admin/ClassesListSortServlet.do?categoryId='+categoryId);
	}
};
	function classdetail(classId){
		location.assign("<%=request.getContextPath()%>/maintoclass.do");
	}
	function classdelete(classId){
		location.assign("<%=request.getContextPath()%>/admin/ClassesDeleteServlet.do?classId="+classId);
	}
</script>
<%@ include file="/views/common/footer.jsp"%>