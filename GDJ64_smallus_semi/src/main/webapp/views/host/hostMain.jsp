<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.smallus.host.model.vo.Host,com.smallus.payment.model.vo.Payment, 
				java.util.*, com.smallus.payment.model.vo.PaymentCalc, com.smallus.classes.model.vo.Classes"%>
<% 
	List<PaymentCalc> newList=(List)session.getAttribute("newList");
	List<Classes> calendarList=(List)session.getAttribute("calendarList");
%>
<%@ include file="/views/common/hostHeader.jsp"%>

<!--main-->
<div id="mainOpacity h-host-main">
	<!-- host-main reservation -->
	<section class="h-main">
		<div class="h-main-title">
			<h2>스케줄 관리</h2>
			<!-- 예약내역 상세 페이지로 이동 -->
			<div class="h-viewList">
				<a href="">+</a>
			</div>
		</div>
		<hr>
		<div class="h-r-callendar" id="h-main-calendar"></div>
	</section>
	<section class="h-main h-main-rsvList">
		<div>
			<div class="h-main-title">
				<h2>새로운 예약 내역</h2>
				<!-- 예약 내역 상세 페이지로 이동 -->
				<div class="h-viewList" id="h-main-moveTo-rsv"><a href="<%=request.getContextPath()%>/host/viewHostRsv.do">+</a></div>
			</div>
			<hr>
			<table id="h-main-rsv-tbl">
                    <tr>
                    	<th>NO</th>
                        <th>결제 번호</th>
                        <th>클래스 이름</th>
                        <th>날짜</th>
                        <th>예약자 아이디</th>
                        <th>예약 인원</th>
                        <th>결제 일</th>
                        <th>결제 상태</th>
                    </tr>
                    <%if(newList!=null && !newList.isEmpty()){
                    	int count=1;
                    	for(PaymentCalc p: newList){
                        %>
		                    <tr>
		                    	<td><%=count %></td>
		                        <td><%=p.getPayment().getPaymentId()%></td>
		                        <td><%=p.getClasses().getClassTitle()%></td>
		                        <td><%=p.getClassDetail().getBookingTimeStart()%> - <%=p.getClassDetail().getBookingTimeEnd()%></td>
		                        <td><%=p.getPayment().getMemberId()%> 님 예약</td>
		                        <td><%=p.getPayment().getClassPersonnel()%> 명</td>
		                        <td><%=p.getPayment().getPaymentDate()%></td>
		                        <td><%=p.getPayment().getPaymentStatus()%></td>
	                   		</tr>
	                    <%count++;
	                    }
                    }else{ %>
                    <tr>
                        <td colspan="8">조회된 예약이 없습니다.</td>
                    </tr>
                    <%} %>
                </table>
		</div>
	</section>
	<!-- host-main-calc -->
	<!-- <section class="h-main">
		<div class="h-main-title">
			<h2>월별 매출 내역</h2>
			매출 내역 상세 페이지로 이동
			<div class="h-viewList">
				<a href="">+</a>
			</div>
		</div>
		<hr>
		<div class="h-r-callendar" id="h-main-chart"></div>
	</section> -->
	<%-- <script src="<%=request.getContextPath() %>/js/host.js"></script> --%>
	<script>
		let hostCalcDate= <%=hostInfo.getCalcReqDate()%>;
		var date= new Date();
		let year=date.getFullYear();
		let month=date.getMonth();
		
		let classTitle;
		let bookingTimeStart;
		let bookingTimeEnd;
		let memberId;
		let classPersonnel;
		
			   let eventDiv=document.getElementsByClassName('fc-event');
			    let calendarEl = document.getElementById('h-main-calendar');
			    
			    let calendar = new FullCalendar.Calendar(calendarEl, {
			    	initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
			        firstDay: 1,
			        headerToolbar : { // 헤더에 표시할 툴 바
			            start : 'today',
			            center : 'prev, title, next',
			            end : 'dayGridMonth,dayGridWeek'
			        },
			        titleFormat : function(date) {
			            return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
			        },
			        nowIndicator: true, // 현재 시간 마크
			        locale: 'ko', // 한국어 설정
			        dayMaxEvents: true, // allow "more" link when too many events
			    	// ajax 처리로 데이터를 로딩 시킨다.
			        events: function(info, successCallback, failureCallback){
				    	$.ajax({
				    	  	type:"get",
				    		url:"<%=request.getContextPath()%>/host/hostlogin.do",
				    		dataType:"json",
				    		success:(data)=>{ 
								// responseText에 저장된 값을 data에 대입한다.
							  	/* JSON.stringify({
									"classTitle":classTitle,
									"bookingTimeStart":bookingTimeStart,
									"bookingTimeEnd":bookingTimeEnd,
									"memberId":memberId,
									"classPersonnel":classPersonnel
								} */
							 	console.log(data);
							    calendar.render();
							 },
							 error: (e,m)=>{
							 	console.log(e); // element
							 	console.log(m);
							 	if(e.status==404) alert("요청한 페이지가 없습니다.");
							 	if(e.status==505) alert("505 error");
							 },
							 complete:()=>{
							 }
				    	}); // ajax end
			        }
			});
			    calendar.render();
		
		document.addEventListener('DOMContentLoaded', function(){
			$.get("<%=request.getContextPath()%>/host/ajaxViewHostCalc.do",function(data){
				//alert("hi")
				console.log(data);
			});
		});
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
		        backgroundColor: '#FFFCF5',
		        chartArea:{left:0,top:'2%',width:'80%',height:'75%'}
		    };
		    
		    //console.log(options.series);

		    let chart = new google.visualization.ComboChart(document.getElementById('h-main-chart'));
		    chart.draw(data, options);
		    console.log(chart);
		    console.dir(chart);
		    console.log(options);
		}
	
	</script>

	<%@ include file="/views/common/hostFooter.jsp"%>