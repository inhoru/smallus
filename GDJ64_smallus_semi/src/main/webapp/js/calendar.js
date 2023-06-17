let className='name';
let classTime='20230616';
let memberNum=2;

document.addEventListener('DOMContentLoaded', function() {
	
   $(function () {
        let request = $.ajax({
                    url: "/full-calendar/calendar-admin", // 변경하기
                    method: "GET",
                    dataType: "json"
        });

    request.done(function(data){
        let calendarEl = document.getElementById('h-main-calendar');
        let calendar = new FullCalendar.Calendar(calendarEl, {
            initialView : 'timeGridWeek', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
            firstDay: 1,
            headerToolbar : { // 헤더에 표시할 툴 바
                start : 'today',
                center : 'prev, title, next',
                end : 'dayGridMonth,dayGridWeek'
                /*end : 'dayGridMonth,dayGridWeek,dayGridDay'*/
            },
            titleFormat : function(data) {
                return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
            },
            //initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
            selectable : true, // 달력 일자 드래그 설정가능
            droppable : true,
            editable : true,
            nowIndicator: true, // 현재 시간 마크
            locale: 'ko', // 한국어 설정
            // events: [
            //       { // this object will be "parsed" into an Event Object
            //         title: '휘낭시에 15:00 김*영님 2명', // a property!
            //         start: '2023-06-11', // a property!
            //          color: '#f2c19d',
            //         //end: '2023-05-14' // a property! ** see important note below about 'end' **
            //       },
            //         { 
            //         title: '휘낭시에 15:00 2명', // a property!
            //         start: '2023-06-18', // a property!
            //         color: '#f2c19d',
            //       },
            //     //   {
            //     //     groupId: 999,
            //     //     title: 'Repeating Event',
            //     //     start: '2023-06-09 T16:00:00'
            //     //   },
            //     //   {
            //     //     groupId: 999,
            //     //     title: 'Repeating Event',
            //     //     start: '2023-06-16 T16:00:00'
            //     //   },
            //       {
            //         title: 'Meeting',
            //         start: '2023-06-12T10:30:00',
            //         end: '2023-06-12T12:30:00'
            //       },
            //        {
            //         title: '휘낭시에 15:00 2명', // a property!
            //         start: '2023-06-25', // a property!
            //         color: '#f2c19d',
            //     },
            // ]
            events: data
            });
            calendar.render();
        });
        request.fail(function(e,m){
            alert("Request failed: "+m);
        });
    });
});
