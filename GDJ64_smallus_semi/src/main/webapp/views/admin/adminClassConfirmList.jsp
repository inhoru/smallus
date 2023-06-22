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
					<tr>
						<th><%=c.getClassTitle()%></th>
						<th><%=c.getClassTitle()%></th>
						<th><%=c.getHostId()%></th>
						<th><%=c.getClassUpLoadDate()%></th>
						<th><%=c.getClassPassId()%></th>
						<td><button id=m-classconfirmbtn>승인</button></td>
						<td><button id=m-classrejectbtn>거절</button></td>
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
	$("#m-classconfirmbtn").click(e=>{
		
	})
	$("#m-classrejectbtn").click(e=>{
		
	})
</script>
<%@ include file="/views/common/footer.jsp"%>