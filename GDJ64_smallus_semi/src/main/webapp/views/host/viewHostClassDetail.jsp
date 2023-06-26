<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
      .h-modal {
        position: absolute;
        top: 0;
        left: 0;

        width: 100%;
        height: 100%;

        display: none;

        background-color: rgba(0, 0, 0, 0.4);
      }
    </style>
<%@ page import="com.smallus.classes.model.vo.ClassDetail, com.smallus.classes.model.vo.Classes" %>
<%
	List<ClassDetail> classDetailList=(List)request.getAttribute("classDetailList");
	Classes list=(Classes)request.getAttribute("list");
%>
<%@ include file="/views/common/hostHeader.jsp"%>
<!--main-->
<div id="mainOpacity h-host-main">
	 <section class="h-main h-class-sub">
     	<h2>내 클래스 보기</h2>
		<h3>클래스 기본 정보 관리하기</h3>
		<div>
			<button class="h-moveToClassList" onclick="location.assign('<%=request.getContextPath()%>/class/viewHostClassList.do')">클래스 목록으로</button>
		</div>
			<div class="h-class-list">
				<a href="">
					<img src="<%=request.getContextPath()%>/img/<%=list.getClassThumbnail() %>">
				</a>
				<table>
					<tr>
						<%if(list.getClassPassId().equals("Y")){%>
							<th class="h-tbl-align-left">승인 완료</th>
							<th>판매 상태</th>
						<%}else if(list.getClassPassId().equals("W")){%>
							<th class="h-tbl-align-left">승인 대기 중</th>
							<th></th>
						<%}else if(list.getClassPassId().contains("N")){ %>
							<th class="h-tbl-align-left">승인 거절</th>
							<%switch(list.getClassPassId()) {
								case "N1" :%><th>거절 사유 1</th><%break; 
								case "N2" :%><th>거절 사유 2</th><%break; 
								case "N3" :%><th>거절 사유 3</th><%break; 
							}
						}%>
						<th colspan="2"><%=list.getClassId() %></th>
					</tr>
					<tr>
						<th class="h-tbl-align-left"><%=list.getCategoryTitle() %></th>
						<th colspan=3><%=list.getClassAddress() %></th>
					</tr>
					<tr>
						<td class="h-tbl-align-left h-tbl-className" colspan="4" ><%=list.getClassTitle() %></td>
					</tr>
					<tr>
						<td class="h-tbl-align-left">신청 일</td>
						<td><%=list.getClassUpLoadDate() %></td>
						<td>승인 일</td>
						<td><%=list.getClassPassDate() %></td>
					</tr>
					<tr>
						<td class="h-tbl-align-left">금액</td>
						<td><%=list.getClassPrice() %></td>
					</tr>
				</table>
				<div>
					<button>수정</button><br>
					<button>삭제</button>
				</div>				
			</div><!--end .h-class list-->
	</section>
	<!-- section class detile info  -->
	<section class="h-main h-class-sub">
		<div class="h-class-detail">
			<div>
				<h3>클래스 상세 정보 관리하기</h3>
				<div>
					<button id="h-insertClassDetail">추가</button>
				</div>
			</div>
			<table class="h-class-detailTbl">
				<tr>
					<th>NO</th>
					<th>클래스 세부 번호</th>
					<th>시간</th>
					<th>예약 인원</th>
				</tr>
			<%if(classDetailList!=null&&!classDetailList.isEmpty()){
				int count=1;
				for(ClassDetail cd: classDetailList){%>
				<tr>
					<td><%=count %></td>
					<td><%=cd.getClassDetailId() %></td>
					<td><%=cd.getBookingTimeStart()%> - <%=cd.getBookingTimeEnd()%></td>
					<td><%=list.getClassPersonnel()%>명</td>
					<td class="h-class-tbl-btn"><button>삭제</button></td>
				</tr>
			<%count++;} 
			}else{%>
				<tr>
					<td colspan="4">조회할 세부 클래스가 없습니다.</td>
				</tr>
			<%} %>
			</table>
		</div>
	</section>
	<div class="h-modal">
		<div class="h-modal_body">Modal</div>
	</div>
<script>
	$("#h-insertClassDetail").click(e=>{
		window
		location.assign('<%=request.getContextPath()%>/class/insertClassDetail.do?classId=<%=list.getClassId()%>');
	})
	
</script>
<%@ include file="/views/common/hostFooter.jsp"%>
