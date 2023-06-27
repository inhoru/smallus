<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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