<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
div#h-AddSchedule-calendar{
	width: 100%;
	margin: 2rem auto;
}
div#h-AddSchedule-calendar input, .h-modalInsertSchedule input {
width: 20rem; 
}
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
		<div>
			<button class="h-moveToClassList" onclick="location.assign('<%=request.getContextPath()%>/class/viewHostClassList.do')">클래스 목록으로</button>
		</div>
		<div class="hcaTitleC">
			<h3>클래스 기본 정보 관리하기</h3>
					<div class="hCbtnContainer">
						<%-- <button id="h-updateClassInfomation" value="<%=list.getClassId()%>">기본 정보 수정</button> --%>
						<button id="h-updateClassStaus" value="<%=list.getClassId()%>">클래스 삭제</button>
					</div>				
		</div>
			<div class="h-class-list">
				<a href="<%=request.getContextPath()%>/host/viewClasseByHost.do?classId=<%=list.getClassId()%>">
					<img src="<%=request.getContextPath()%>/upload/class/<%=list.getClassThumbnail() %>">
				</a>
				<table class="h-classDetailTblInfo">
					<tr>
						<%if(list.getClassPassId().equals("Y")&&list.getClassStatus().equals("Y")){ %>
								<th class="h-tbl-align-left" class="h-class-pass-Y">클래스 승인 완료<th>
								<th class="h-classStatus-Y">판매 중지</th>
							<%}else if(list.getClassPassId().equals("Y")&&list.getClassStatus().equals("N")){ %>
								<th class="h-tbl-align-left h-classStatus-Y" colspan="2">판매 중지</th>
							<%}else if(list.getClassPassId().equals("W")&&list.getClassStatus().equals("Y")) {%>
								<th class="h-tbl-align-left" class="h-class-pass-W" colspan="2">승인 대기</th>
							<%}else if((list.getClassPassId().equals("N1") || list.getClassPassId().equals("N2") || list.getClassPassId().equals("N3")) &&list.getClassStatus().equals("Y")){
								if(list.getClassPassId().equals("N1")){%>
									<th class="h-tbl-align-left" class="h-class-pass-N">승인 거절</th><th>내용 부실</th>
								<%}else if(list.getClassPassId().equals("N2")){%>
									<th class="h-tbl-align-left" class="h-class-pass-N">승인 거절</th><th>내용 부적절</th>
								<%}else if(list.getClassPassId().equals("N3")){%>
									<th class="h-tbl-align-left" class="h-class-pass-N">승인 거절</th><th>중복 등록</th>
								<%} 
							}else{%>
								<th class="h-tbl-align-left" class="h-class-pass-N">판매 중지</th><th></th>
							<%} %>
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
						<td> <%if(list.getClassPassId().equals("Y")){ %>
								<%= list.getClassPassDate()%>
								<%} else{%>승인 대기 중<%} %>	</td>
					</tr>
					<tr>
						<td class="h-tbl-align-left">금액</td>
						<td><%=list.getClassPrice() %></td>
					</tr>
				</table>
			</div><!--end .h-class list-->
	</section>
	<!-- section class detile info  -->
	<section class="h-main h-class-sub">
		<div class="h-class-detail">
			<div>
				<h3>클래스 상세 정보 관리하기</h3>
				<div>
					<button id="h-insertClassDetail">클래스 스케줄 추가</button>
				</div>
			</div>
				<%@ include file="/views/host/modal.jsp"%>
			<table class="h-class-detailTbl">
				<tr>
					<th>NO</th>
					<th>클래스 세부 번호</th>
					<th>시간</th>
					<th>예약 인원</th>
					<th></th>
				</tr>
			<%if(classDetailList!=null&&!classDetailList.isEmpty()&&list.getClassStatus().equals("Y")){
				int count=1;
				for(ClassDetail cd: classDetailList){%>
				<tr>
					<td><%=count %></td>
					<td class="h-cd-classDetailId"><%=cd.getClassDetailId() %></td>
					<td class="h-cd-classDetailTime"><%=cd.getBookingTimeStart()%> - <%=cd.getBookingTimeEnd()%></td>
					<td class="h-cd-classDetailPer"><%=list.getClassPersonnel()%>명</td>
					<td class="h-class-tbl-btn"><button class="hDeleteClassDetail">삭제</button></td>
				</tr>
				<%count++;}
			}else if(classDetailList!=null&&!classDetailList.isEmpty()&&list.getClassStatus().equals("N")){
				int count=1;
				for(ClassDetail cd: classDetailList){%>
				<tr>
					<td><%=count %></td>
					<td><%=cd.getClassDetailId() %></td>
					<td><%=cd.getBookingTimeStart()%> - <%=cd.getBookingTimeEnd()%></td>
					<td><%=list.getClassPersonnel()%>명</td>
					<td class="h-class-tbl-btn"></td>
				</tr>
				
			<%count++;} }else{%>
				<tr>
					<td colspan="4">조회할 세부 클래스가 없습니다.</td>
				</tr>
			<%} %>
			</table>
		</div>
	</section>	
<script>
	let remainingPersonnel='<%=list.getClassPersonnel()%>';
	let classId='<%=list.getClassId()%>';
	
	// 새로운 일정 등록 버튼 누르면 등록하기
	$("#h-addScheduleBtn").click(e=>{
		let inputTime = $("input[name='hselectedSchedule']"); // 이전 input의 값 가져오기
		let form=$(".hInsertClassDetailForm").children("input");
		form.each(function(index, element) {
			// 요소에서 값을 추출
			const time = $(this).val();
			console.log(time);
			$.ajax({
				url: "<%=request.getContextPath()%>/class/insertClassDetailByPage.do",
				method: "POST",
		    	data: {
			    	"classId":classId,
			    	"classTime":time,
			    	"remainingPersonnel": remainingPersonnel
			    	},
		            success: function (data) {
		                console.log(data, typeof data);
		                alert("일정 등록 성공 :)");
		                document.location.href = document.location.href;
		            },
		            error: function (xhr, textStatus, errorThrown) {
		            	alert("일정 등록 실패 :|");
		                console.log(xhr);
		                console.log(textStatus);
		                console.log(errorThrown);
		           }
		           
		 	});
			
		})
	});
	
	// 세부 내용 수정 버튼클릭 
	$("#h-updateClassInfomation").click(e=>{
		// alert("연결하기");
		<%-- location.assign('<%=request.getContextPath()%>/updateClassStatus.do?classId=<%=list.getClassId()%>'); --%>
		<%-- location.assign('<%=request.getContextPath()%>/updateClass.do?classId=<%=list.getClassId()%>'); --%>
	})
	// 삭제 버튼 클릭 
	$(".hDeleteClassDetail").click(e=>{
		 let thisBtn = $(e.target);
		 let detailArr= thisBtn.parent().siblings();
		 let detailId=detailArr.eq(1).text();
		 alert("삭제됩니다");
		 $.ajax({
		     	url: "<%=request.getContextPath()%>/classDetail/deleteClassdetail.do",
		            data: { 
		            	"classDetailId":detailId
		            	},
		            success: function (data) {
		                console.log(data, typeof data);
		                if(data>0) alert("삭제 성공 :)");
		 				else alert("삭제 실패 :<"); 
		                document.location.href = document.location.href;
		            },
		            error: function (xhr, textStatus, errorThrown) {
		                console.log(xhr);
		                console.log(textStatus);
		                console.log(errorThrown);
		            }
		 });
		
	})
	function bodyClose(){
		$("document").css('overflow', 'hidden');
	}
	
	// 판매중단 모달창 열기
	$("#h-updateClassStaus").click(e => {
		$(".h-modalDelete").css('display', 'block');
		bodyClose();
	});
	
	// 판매 중단 변경 버튼 클릭 
	$("#h-checkDelete").click(e => {
		location.assign('<%=request.getContextPath()%>/updateClassStatus.do?classId=<%=list.getClassId()%>')
		$(".h-modalDelete").css('display', 'none');
		$("document").css('overflow', 'auto');
	})

	// 판매 중단 변경모달창 닫기
	$(".h-close-modal").click(e => {
		$(".h-modalDelete").css('display', 'none');
		$("document").css('overflow', 'auto');
	})
	
	// 일정 추가 모달 열기
	$("#h-insertClassDetail").click(e => {
	  $(".h-modalInsertSchedule").css('display', 'block');
	  //$("body").css('overflow', 'hidden');
	  //$("body").css('overflow', 'hidden');
	  bodyClose();
	});
	
	let delBtn;
	let newClass;

	$(".addTime").click(e => {
	  let add = $('input[name="datetimes"]').val();
	  let div=$("<div>");
	  newClass = $("<input type='text' name='hselectedSchedule' disabled>").val(add);
	  delBtn = $("<button class='hBtnDelSchedule'>").text("삭제"); // 삭제 버튼에 고유한 클래스를 추가
	  let f = $("<form class='hInsertClassDetailForm'>").append(newClass).append(delBtn);
	  $("#h-addScheduleCheck").append(f);
	});

	// 삭제하기 버튼 클릭 핸들러를 document 수준에서 등록
	$(document).on("click", ".hBtnDelSchedule", function() {
	  let inputVal = $(this).prev("input[name='hselectedSchedule']").val(); // 이전 input의 값 가져오기
	  $(this).prev("input[name='hselectedSchedule']").remove(); // 이전 input 제거
	  $(this).remove(); // 삭제 버튼 제거
	  //console.log(inputVal);
	});
	
	
	
	// 삭제 변경모달창 닫기
	$(".h-close-modal").click(e => {
		$(".h-modalInsertSchedule").css('display', 'none');
		$("document").css('overflow', 'auto');

	})
	
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
	
	
	
	
</script>
<%@ include file="/views/common/hostFooter.jsp"%>
