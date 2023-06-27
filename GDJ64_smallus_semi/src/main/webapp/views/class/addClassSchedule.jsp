<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/hostHeader.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/class/addClassSchedule.css"/>

<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<div id="mainOpacity">
	<section id="d-addClass">
		<br> <br>
		<h3>클래스 등록하기 (스케쥴)</h3>
		<hr>
		<div id="inputs">
			<p>스케쥴 등록</p>
			<div id="AddSchedule-calendar">
				<input type="text" name="datetimes"/><button>추가</button><button>삭제</button> <br>
				<input type="text" name="datetimes"/><button>추가</button><button>삭제</button>  <br>
				<input type="text" name="datetimes"/><button>추가</button><button>삭제</button> <br>
				<input type="text" name="datetimes"/><button>추가</button><button>삭제</button> <br>
			
			</div>
			<br> <br> <br> <br>
			<p>
				등록한 스케쥴 현황      
				<button>전체 삭제</button>
			</p>
				
			<div id="AllSchedule">
				<div class="schedule-table">
					<p class="schedule-date">2023-06-17</p>
					<button class="schedule-button">10:00 ~ 12:00</button>
					<button class="schedule-button">13:00 ~ 15:00</button>
					<button class="schedule-button">16:00 ~ 19:00</button>
				</div>
				<div class="schedule-table">
					<p class="schedule-date">2023-06-20</p>
					<button class="schedule-button">10:00 ~ 12:00</button>
					<button class="schedule-button">16:00 ~ 19:00</button>
				</div>
				<div class="schedule-table">
					<p class="schedule-date">2023-06-22</p>
					<button class="schedule-button">10:00 ~ 12:00</button>
					<button class="schedule-button">13:00 ~ 15:00</button>
					<button class="schedule-button">16:00 ~ 19:00</button>
				</div>
			
			</div>
			
		</div>
		<br> <br><br> <br> <br> <br>
		<button>등록하기 (2/2)</button>
		<br> <br> <br> <br>
		
<style>
div#AddSchedule-calendar{
	width: 1000px;
	height: 500px;
	margin: 10px;
	border: 2px solid #595959;
	border-radius: 20px;
	padding:10px;
}

div#AllSchedule{
	width: 600px;
	height: 400px;
	margin: 10px;
	border: 2px solid #595959;
	border-radius: 20px;
}

div.schedule-table{
	margin:15px;
}

.schedule-table button{
	width:250px;
	margin: 5px;
	/* 너비설정은 기존 css와의 충돌로 적용안됨 */
}

#AddSchedule-calendar>input{
	width:300px;
	height:30px;
	border: 2px solid #595959;
	border-radius: 20px;
	margin: 5px;
	text-align:center;
}


</style>		
		

<script>
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
		