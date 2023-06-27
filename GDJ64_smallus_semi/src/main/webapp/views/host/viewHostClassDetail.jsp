
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
:root { -
	--btn-radius: 2rem; 
	--img-radius: 1rem; 
	--be-color: #F5E7D2; /* 연한 베이지 버튼 */ 
	--ye-color: #FBEFD3; /* 연한 노란색 버튼 */ 
	--dk-color: #E8D6C3; /*진한베이지 버튼 */ 
	--main-col-lt: #FFFCF5; /* main primary */ 
	--border-color: #F6E9DF; /*border  연한 컬러*/ 
	--font-small: 0.8rem; /* button 폰트 사이즈 */ 
	--btn-padding: 0.4rem 0.6rem; /* button padding 값 */ 
	--btn-bold: bolder;
}

.h-modalNickName, .h-modalPassword, .h-modalPhone, .h-modalEmail, .h-modalDelete, .h-modalInsertSchedule {
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
	display: none;
	text-align:center;
}

 .modal-content{
	background-color: var(--main-col-lt);
	margin: 15% auto;
	width: 40%;
	text-align:center;
	padding: 2rem;
}

.modal-content button, .h-updateEmail button, .h-modalDelete button{
	background-color:var(--be-color);
	padding: var(--btn-padding);
	font-size: var(--font-small);
	border-radius: var(--btn-radius);
	border: 0;
	margin-left:1rem;
	margin-top:2rem;
}
.modal-content table{
	width: 100%;
	display:flex;
	justify-content: space-between;
}

.modal-content button:hover, .modal-content button:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
div#h-AddSchedule-calendar{
	width: 100%;
	margin: 2rem auto;
}
div#h-AddSchedule-calendar input{
width: 20rem; 

    </style>
<%@ page import="com.smallus.classes.model.vo.ClassDetail, com.smallus.classes.model.vo.Classes" %>
<%
	List<ClassDetail> classDetailList=(List)request.getAttribute("classDetailList");
	Classes list=(Classes)request.getAttribute("list");
%>
<%@ include file="/views/common/hostHeader.jsp"%>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<div id="mainOpacity h-host-main">
	 <section class="h-main h-class-sub">
     	<h2>내 클래스 보기</h2>
		<h3>클래스 기본 정보 관리하기</h3>
		<div>
			<button class="h-moveToClassList" onclick="location.assign('<%=request.getContextPath()%>/class/viewHostClassList.do')">클래스 목록으로</button>
		</div>
			<div class="h-class-list">
				<a href="">
					<img src="<%=request.getContextPath()%>/upload/class/<%=list.getClassThumbnail() %>">
				</a>
				<table class="h-classDetailTblInfo">
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
								case "N1" :%><th>내용 부실</th><%break; 
								case "N2" :%><th>내용 부적절</th><%break; 
								case "N3" :%><th>중복 등록</th><%break; 
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
					<button id="h-updateClassStaus" value="<%=list.getClassId()%>">판매 중지</button>
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
	<div class="h-modalDelete" style="display: hidden">
		<div class="modal-content h-deleteClass">
			<h4>하위 클래스 세부 일정도 같이 판매 중지 처리됩니다</h4>
			<input type="hidden" value="">
			<button id="h-checkDelete">변경</button>
			<button class="h-close-modal">닫기</button>
		</div>
	</div>
	<div class="h-modalInsertSchedule" style="display: hidden">
		<div class="modal-content h-insertSchedule">
			<h4>클래스 세부 일정을 추가합니다.</h4>
			<div id="h-AddSchedule-calendar">
				<input type="text" name="datetimes"><button class="addTime">추가</button>
			</div>
			<div id="h-addScheduleCheck"></div>
			<input type="hidden" value="">
			<!-- <button id="h-insertSch">추가</button>-->
			<button class="h-close-modal">닫기</button> 
		</div>
	</div>
<script>
	// 일정 추가함수
	$(function() {
	  $('input[name="datetimes"]').daterangepicker({
//		  singleDatePicker: true,
		  showDropdowns: true,
		    timePicker: true,
		    startDate: moment().startOf('hour'),
		    endDate: moment().startOf('hour').add(32, 'hour'),
		    locale: {
		      format: 'YYYY-MM-DD HH:mm',
		      "separator": " ~ ",                     // 시작일시와 종료일시 구분자
			    "applyLabel": "확인",                    // 확인 버튼 텍스트
			    "cancelLabel": "취소",                   // 취소 버튼 텍스트
			    "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
			    "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
	    }
	  });
	});
	
	
	//삭제 모달창 열기
	$("#h-updateClassStaus").click(e => {
		$(".h-modalDelete").css('display', 'block');
		$("document").css('overflow', 'hidden');
	});
	
	// 삭제 버튼 클릭 
	$("#h-checkDelete").click(e => {
		location.assign('<%=request.getContextPath()%>/updateClassStatus.do?classId=?<%=list.getClassId()%>')
		$(".h-modalDelete").css('display', 'none');
		$("document").css('overflow', 'auto');
	})

	// 삭제 변경모달창 닫기
	$(".h-close-modal").click(e => {
		$(".h-modalDelete").css('display', 'none');
		$("document").css('overflow', 'auto');
	})
	
	$("#h-insertClassDetail").click(e=>{
		$(".h-modalInsertSchedule").css('display', 'block');
		$("document").css('overflow', 'hidden');
	})
	
	let delBtn;
	$(".addTime").click(e=>{
		let add=$('input[name="datetimes"]').val();
		let newClass=$("<input type='text' disabled>").val(add);
		delBtn=$("<button class='h-delBtnSch' name='delbtn'>").text("삭제");
		let f=$("<form>").append(newClass).append(delBtn);
		$("#h-addScheduleCheck").append(f);
	})
	
	// 삭제 변경모달창 닫기
	$(".h-close-modal").click(e => {
		$(".h-modalInsertSchedule").css('display', 'none');
		$("document").css('overflow', 'auto');
	})
	
	
</script>
<%@ include file="/views/common/hostFooter.jsp"%>
