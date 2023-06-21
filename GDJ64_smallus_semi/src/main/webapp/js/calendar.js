document.addEventListener('DOMContentLoaded', function() {
   //let classNmae='클래스 이름';
   //let classTime='클래스 시간';
   //let memberName='회원 이름';
   //let memberNum='2';


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
      /*events:[    
        {
          title: payments[1], // a property!
          start: payments[2], // a property!
          color: '#f2c19d',
        },
        {
          title: payments[7], // a property!
          start: payments[9], // a property!
          color: '#f2c19d',
        }
      
      ]*/

        // events: function(info, successCallback, failureCallback){
    	  // // ajax 처리로 데이터를 로딩 시킨다.
    	  // $.ajax({
    		//  type:"get",
    		//  url:"<%=request.getContextPath()%>/host/viewCalendar.do",
    		//  dataType:"json",
    		//  success:(data)=>{ 
				// 	// responseText에 저장된 값을 data에 대입한다.
				// 	console.log(data);
				// 	//$("<h3>").text(data).css("color","magenta").appendTo($("#container"));
				// },
				// error: (e,m)=>{
				// 	// console.log(e); // element
				// 	// console.log(m);
				// 	if(e.status==404) alert("요청한 페이지가 없습니다.");
				// },
				// complete:()=>{
				// 	alert("서버와 통신 끝"); // success나 error가 끝난 뒤에 무조건 complete가 실행 된다
				// }
    		
    	  // 	});
    	  // },
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
        
        /*eventClick: function(info) {

            // 일정 클릭 시 발생할 이벤트
            //클릭한 일정 Id
            let id = info.event._def.defId;
            alert(id+'hi');
          */
        
        
    });
    calendar.render();
    
});