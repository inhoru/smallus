	function drawVisualization() {
	// Some raw data (not necessarily accurate)
    let data = google.visualization.arrayToDataTable([
        ['Month', '정산 신청 금액','정산 금액'],
        ['2023/04', 235000,188000  ],
        ['2023/05', 235000, 188000],
    ]);

    let options = {
        seriesType: 'bars',
        series: {
            0: { color: '#5D8CAE' },
            1: { color: '#F7B0AD' },
        },
        backgroundColor: '#FFFCF5'
    };
    
    let chart = new google.visualization.ComboChart(document.getElementById('h-main-chart'));
    chart.draw(data, options);
} 