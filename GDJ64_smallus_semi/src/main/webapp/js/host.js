google.charts.load('current', { 'packages': ['corechart'] });
google.charts.setOnLoadCallback(drawVisualization);
// 
function drawVisualization() {
    // Some raw data (not necessarily accurate)
    let data = google.visualization.arrayToDataTable([
        /*['Month', 'amount', '마들렌', '쿠키', '휘낭시에', '스콘', '바나나푸딩', '평균'],
        ['2023/01', 500 ,165, 938, 522, 998, 450, 614.6],
        ['2023/02', 500 ,135, 1120, 599, 1268, 288, 682],
        ['2023/03', 500 ,157, 1167, 587, 807, 397, 623],
        ['2023/04', 500 ,139, 1110, 615, 968, 215, 609.4],
        ['2023/05', 500 ,136, 691, 629, 1026, 366, 569.6]*/
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
    
    //console.log(options.series);

    let chart = new google.visualization.ComboChart(document.getElementById('h-main-chart'));
    chart.draw(data, options);
    console.log(chart);
    console.dir(chart);
    console.log(options);
}



  //   let count = 0;
	// let data;
	//   let chart;
  //     let options;
	  
  //     function drawChart() {
	//   data = new google.visualization.DataTable();
	//   data.addColumn('string', 'Dialogue');
	//   data.addColumn('number', 'Send');
	//   data.addColumn('number', 'Resoponse');
	//   data.addRow(['Dialogue 1', 1, 1]);
	  
  //       options = {
  //         chart: {
  //           title: 'Analysis of Dialogue System',
  //           subtitle: '',
  //         }
  //       };

  //       chart = new google.charts.Bar(document.getElementById('columnchart_material'));

  //       chart.draw(data, google.charts.Bar.convertOptions(options));
  //     }
      
  //     function addData(){
	//     count++;
	// 	data.addRow(['Dialogue ' + count, Number(document.getElementById('sendInput').value), Number(document.getElementById('responseInput').value)]);
	// 	chart.draw(data, options)
  //     }
  //     function removeData(){
	// 	data.removeRow(0);
	// 	chart.draw(data, opstions)
  //     }
      










// 알림
$(".h-notification-icon").on("click", e => {
    $(".h-notification-container").slideToggle(300);
});








































