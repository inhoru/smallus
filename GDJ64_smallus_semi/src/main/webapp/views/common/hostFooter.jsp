<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer>
	<div class="footer">
		<div class="usInfo">
			<div class="copyright">
				상호명 : ㈜SEMICOLON ㅣ 대표자 : 이다영 ㅣ 주소 : 서울특별시 금천구 가산디지털2로 95 KM타워 3층
				305호 ㅣ<br> 사업자등록번호 : 211-88-19183 ㅣ 통신판매업신고 :
				제2009호-서울금천-00847호 <br /> COPYRIGHT ⓒ ㈜SEMICOLON ALL RIGHTS
				RESERVED
			</div>
			<div class="aside">
				<h3>Contact Us</h3>
				<h2>1567-1234</h2>
				<p>영업시간 09:00 ~ 17:00</p>
				<span>문의하기</span>
			</div>
		</div>
	</div>
	<script>
	// 월 이름을 숫자로 매핑하기 위한 맵
	var monthMap = {
		'1월': '01',
		'2월': '02',
		'3월': '03',
		'4월': '04',
		'5월': '05',
		'6월': '06',
		'7월': '07',
		'8월': '08',
		'9월': '09',
		'10월': '10',
		'11월': '11',
		'12월': '12'
	};

	// 날짜 형식을 변경할 때 사용할 함수
	function formatDate(originalDateString) {
		// 날짜 문자열에서 월, 일, 연도 추출
		var monthIndex = originalDateString.indexOf('월');
		var monthName = originalDateString.slice(0, monthIndex + 1);
		var month = monthMap[monthName];
		var day = originalDateString.match(/\d+/)[0];
		day = day.padStart(2, '0');
		var year = originalDateString.match(/\d+$/)[0];

		// 변경된 형식의 날짜 문자열 반환
		return year + '-' + month + '-' + day;
	}



	document.addEventListener('DOMContentLoaded', function() {
		let calendarEl = document.getElementById('h-main-calendar');
		let calendar = new FullCalendar.Calendar(calendarEl, {
			initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
			firstDay: 1,
			headerToolbar: { // 헤더에 표시할 툴 바
				start: 'today',
				center: 'prev, title, next',
				end: 'dayGridMonth,dayGridWeek'
				/*end : 'dayGridMonth,dayGridWeek,dayGridDay'*/
			},
			titleFormat: function(date) {
				return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
			},
			events: {
				url: context + "/host/viewRsvByCalendar.do", // 서블릿의 URL 주소
				method: 'GET', // HTTP 메소드 (GET, POST 등)
				success: function(response) {
					var events = []; // FullCalendar에 추가할 이벤트 배열
					var startDate;
					var endDate;
					// 서블릿에서 가져온 JSON 데이터를 이벤트로 변환
					for (var i = 0; i < response.length; i++) {
						startDate = formatDate(response[i].classDetail.bookingTimeStart);
						endDate = formatDate(response[i].classDetail.bookingTimeEnd);
						console.log("start : " + startDate + "end : " + endDate)
						var event = {
							title: response[i].classes.classTitle,
							start: startDate,
							end: endDate,
							color: "#FBEFD3"
						}
						events.push(event);
					}

					calendar.addEventSource(events); // 이벤트를 FullCalendar에 추가
				},
				error: function() {
					// 에러 처리 로직
				}
			}
	  });

		calendar.render();
	});
	</script>
</footer>
</div>
</body>
</html>