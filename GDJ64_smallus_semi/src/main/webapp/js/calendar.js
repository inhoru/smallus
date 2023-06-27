document.addEventListener('DOMContentLoaded', function() {

   let eventDiv=document.getElementsByClassName('fc-event');
  //  console.log(eventDiv);

   
    let calendarEl = document.getElementById('h-main-calendar');
    let calendar = new FullCalendar.Calendar(calendarEl, {
        initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
        firstDay: 1,
        headerToolbar : { // 헤더에 표시할 툴 바
            start : 'today',
            center : 'prev, title, next',
            end : 'dayGridMonth,dayGridWeek'
            /*end : 'dayGridMonth,dayGridWeek,dayGridDay'*/
        },
        titleFormat : function(date) {
            return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
        },
        //initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
        selectable : true, // 달력 일자 드래그 설정가능
        //droppable : true,
        //editable : true,
        nowIndicator: true, // 현재 시간 마크
        locale: 'ko', // 한국어 설정
        // 이벤트명 : function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용..
      select: function(arg) {
    	  console.log(arg);

        var title = prompt('입력할 일정:');
    // title 값이 있을때, 화면에 calendar.addEvent() json형식으로 일정을 추가
        if (title) {
          	calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay,
            backgroundColor:"yellow",
            textColor:"blue"
          })
        }
        calendar.unselect()
      },
      eventClick: function(arg) {
    	  // 있는 일정 클릭시,
    	  console.log("#등록된 일정 클릭#");
    	  console.log(arg.event);
    	  
        if (confirm('Are you sure you want to delete this event?')) {
          arg.event.remove()
        }
      },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
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
            },{
                title: '정산 신청 일', // a property!
                start: '2023-06-01', // a property!
                color: '#c6e0c1',
            },
            {
                title: 'Meeting',
                start: '2023-06-12T10:30:00',
                end: '2023-06-12T12:30:00'
            },
        ],
    });
    calendar.render();
    
});