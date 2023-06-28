<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.smallus.classes.model.vo.Classes"%>
<%@ include file="/views/common/hostHeader.jsp"%>
<%
List<Classes> ClassesConfirmList=(List)request.getAttribute("ClassesConfirmList"); 
%>
<style>
	#pageBar{
		align-items:center;
	}
	
	button#m-classconfirmbtn,#m-classrejectbtn  {
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
				<h2>클래스 승인관리</h2>
			</div>
		</section>
		<section class="h-main h-main-rsvList">
			<div>
				<table id="h-main-rsv-tbl">
					<tr>
						<th>카테고리 </th>
						<th>클래스이름</th>
						<th>호스트아이디</th>
						<th>등록일</th>
						<th>승인상태</th>
						<th></th>
						<th></th>
					</tr>
				<%if(ClassesConfirmList!=null&&!ClassesConfirmList.isEmpty()) {
					for(Classes c:ClassesConfirmList){%>
					<tr style="cursor:pointer;" onclick="classConfirmDetail('<%=c.getClassId()%>');">
						<td><%=c.getCategoryTitle()%></td>
						<td><%=c.getClassTitle()%></td>
						<td><%=c.getHostId()%></td>
						<td><%=c.getClassUpLoadDate()%></td>
						<td>승인대기</td>
						<td><button id="m-classconfirmbtn" onclick="classconfirm('<%=c.getClassId()%>');">승인</button></td>
						<td><button id="m-classrejectbtn" onclick="classreject('<%=c.getClassId()%>');">거절</button></td>
					</tr>
					<%} %>
				<%}else{ %>
		        	<tr>
                        <td colspan="7">승인할 클래스가 없습니다.</td>
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
	const classConfirmDetail=(classId)=>{
		location.assign("<%=request.getContextPath()%>/admin/ClassesConfirmDetailServlet.do?classId="+classId);
	}
	const classreject=(classId)=>{
		/* let classId=$("#m-classId").val(); */
		open("<%=request.getContextPath()%>/views/admin/classReject.jsp?classId="+classId
				,"_blank","width=600, height=200, top=300,left=500");
	}

	
	const classconfirm=(classId)=>{
		location.assign("<%=request.getContextPath()%>/admin/ClassesConfirm.do?classId="+classId);
	}
</script>
<%@ include file="/views/common/footer.jsp"%>