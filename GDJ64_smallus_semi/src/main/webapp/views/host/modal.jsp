<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

.h-modalNickName, .h-modalPassword, .h-modalPhone, .h-modalEmail, .h-modalDelete {
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
</style>
<div class="h-modalDelete" style="display: none">
	<div class="modal-content h-deleteClass">
		<h4>하위 클래스 세부 일정도 같이 판매 중지 처리됩니다</h4>
		<input type="hidden" value="">
		<button id="h-checkDelete">변경</button>
		<button class="h-close-modal">닫기</button>
	</div>
</div>

<div class="h-modalInsertSchedule" style="display: none">
	<div class="modal-content h-insertSchedule">
		<h4>클래스 세부 일정을 추가합니다.</h4>
		<span><small>날짜가 적힌 칸을 누르면 달력에서 일정을 선택할 수 있습니다.</small></span>
		<div id="h-AddSchedule-calendar">
			<input type="text" name="datetimes">
			<button class="addTime">일정 추가 하기</button>
			<span><small>계속해서 추가하려면 달력을 눌러주세요</small></span>
		</div>
		<div id="h-addScheduleCheck"></div>
		<input type="hidden" value="">
		<button id="h-addScheduleBtn">새로운 일정 등록하기</button>
		<button class="h-close-modal">취소</button>
	</div>
</div>