google.charts.load('current', { 'packages': ['corechart'] });
google.charts.setOnLoadCallback(drawVisualization);
// 
function drawVisualization() {
    // Some raw data (not necessarily accurate)
    let data = google.visualization.arrayToDataTable([
        ['Month', '마들렌', '쿠키', '휘낭시에', '스콘', '바나나푸딩', '평균'],
        ['2023/01', 165, 938, 522, 998, 450, 614.6],
        ['2023/02', 135, 1120, 599, 1268, 288, 682],
        ['2023/03', 157, 1167, 587, 807, 397, 623],
        ['2023/04', 139, 1110, 615, 968, 215, 609.4],
        ['2023/05', 136, 691, 629, 1026, 366, 569.6]
    ]);

    let options = {
        //title : '월별 클래스 매출 현황',
        //vAxis: {title: '클래스'},
        //hAxis: {title: '브루어스 커피 월별 매출'},
        seriesType: 'bars',
        series: {
            0: { color: '#5D8CAE' },
            1: { color: '#F7B0AD' },
            2: { color: '#f1ca3a' },
            3: { color: '#72AE89' },
            4: { color: '#e67e22' },
            5: { type: 'line' }
        },
        backgroundColor: '#FFFCF5'
    };

    let chart = new google.visualization.ComboChart(document.getElementById('h-main-chart'));
    chart.draw(data, options);
}

document.addEventListener('DOMContentLoaded', function() {
    let calendarEl = document.getElementById('h-main-calendar');
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

// 알림
$(".h-notification-icon").on("click", e => {
	console.log(e);
    $(".h-notification-container").slideToggle(300);
});
  
