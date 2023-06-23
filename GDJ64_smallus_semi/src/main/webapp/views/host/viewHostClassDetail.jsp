<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smallus.classes.model.vo.ClassDetail, com.smallus.classes.model.vo.Classes" %>
<%
	List<ClassDetail> classDetailList=(List)request.getAttribute("classDetailList");
	List<Classes> classList=(List)request.getAttribute("classList");
	
%>
<%@ include file="/views/common/hostHeader.jsp"%>
<!--main-->
<div id="mainOpacity h-host-main">
	 <section class="h-main h-class-sub">
     	<h2>내 클래스 보기</h2>
        <!-- ajax 통해서 넣을 class 테이블 -->
		<h3>클래스 기본 정보 관리하기</h3>
		<%if(classList!=null&&!classList.isEmpty()){
			for(Classes c:classList){%>
			<div class="h-class-list">
				<a href="">
					<img src="<%=request.getContextPath()%>/img/<%=c.getClassThumbnail() %>.png">
				</a>
				<table>
					<tr>
						<%if(c.getClassPassId().equals("Y")){%>
							<th class="h-tbl-align-left">승인 완료</th>
							<th>판매 상태</th>
						<%}else if(c.getClassPassId().equals("W")){%>
							<th class="h-tbl-align-left">승인 대기 중</th>
							<th></th>
						<%}else if(c.getClassPassId().contains("N")){ %>
							<th class="h-tbl-align-left">승인 거절</th>
							<%switch(c.getClassPassId()) {
								case "N1" :%><th>거절 사유 1</th><%break; 
								case "N2" :%><th>거절 사유 2</th><%break; 
								case "N3" :%><th>거절 사유 3</th><%break; 
							}
						}%>
						<th colspan="2"><%=c.getClassId() %></th>
					</tr>
					<tr>
						<th class="h-tbl-align-left">카테고리</th>
						<th colspan=3>지역</th>
					</tr>
					<tr>
						<td class="h-tbl-align-left h-tbl-className" colspan="4" >클래스 이름</td>
					</tr>
					<tr>
						<td class="h-tbl-align-left">신청 일</td>
						<td>YYYY-MM-DD</td>
						<td>승인 일</td>
						<td>YYYY-MM-DD</td>
					</tr>
					<tr>
						<td class="h-tbl-align-left">금액</td>
						<td>38,000</td>
					</tr>
				</table>
				<div>
					<button>수정</button><button>삭제</button>
				</div>				
			</div><!--end .h-class list-->
			<%}
		} %>
	</section>
	<!-- section class detile info  -->
	<section class="h-main h-class-sub">
		<div class="h-class-detail">
			<div>
				<h3>클래스 상세 정보 관리하기</h3>
				<div>
					<button>추가</button>
				</div>
			</div>
			<table class="h-class-detailTbl">
				<tr>
					<th>NO</th>
					<th>클레스 세부 번호</th>
					<th>날짜</th>
					<th>시간</th>
					<th>예약 인원</th>
					<th></th>
				</tr>
				<tr>
			<%if(classDetailList!=null&&!classDetailList.isEmpty()){
				int count=1;
				for(ClassDetail cd: classDetailList){%>
					<td><%=count %></td>
					<td><%=cd.getClassDetailId() %></td>
					<td><%=cd.getBookingTimeStart()%></td>
					<td><%=cd.getBookingTimeEnd()%></td>
					<td><%= %>명</td>
					<td class="h-class-tbl-btn"><button>삭제</button></td>
				</tr>
				<tr>
					<td>r202306130751</td>
					<td>2023-05-18</td>
					<td>15:00 - 17:00</td>
					<td>1명</td>
					<td class="h-class-tbl-btn"><button>삭제</button></td>
				</tr>
			</table>
			<%count++;} 
			}%>
		</div>
	</section>
<%@ include file="/views/common/hostFooter.jsp"%>
