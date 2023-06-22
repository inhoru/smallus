document.addEventListener('DOMContentLoaded', function() {
	//let classNmae='클래스 이름';
	//let classTime='클래스 시간';
	//let memberName='회원 이름';
	//let memberNum='2';
	
    let calendarEl = document.getElementById('AddSchedule-calendar');
    let calendar = new FullCalendar.Calendar(calendarEl, {
        initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
        firstDay: 1,
        headerToolbar : { // 헤더에 표시할 툴 바
            start : 'prev next today',
            center : 'title',
            end : 'dayGridMonth,dayGridWeek,dayGridDay'
        },
        titleFormat : function(date) {
            return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
        },
        //initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
        selectable : true, // 달력 일자 드래그 설정가능
        droppable : true,
        editable : true,
        nowIndicator: true, // 현재 시간 마크
        locale: 'ko', // 한국어 설정
        events: [
              { // this object will be "parsed" into an Event Object
                title: '휘낭시에 15:00 김*영님 2명', // a property!
                start: '2023-06-11', // a property!
                 color: '#f2c19d',
                //end: '2023-05-14' // a property! ** see important note below about 'end' **
              },
                { 
                title: '휘낭시에 15:00 2명', // a property!
                start: '2023-06-18', // a property!
                color: '#f2c19d',
              },
               {
                title: '휘낭시에 15:00 2명', // a property!
                start: '2023-06-25', // a property!
                color: '#f2c19d',
            }
            ]
    });
    calendar.render();
});