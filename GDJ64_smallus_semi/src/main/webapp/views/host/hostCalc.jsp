<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%List<Payment> rsvList =(List)session.getAttribute("rsvList"); %>
<%@ include file="/views/host/hostHeader.jsp"%>
<%@ page import="java.util.List, com.smallus.payment.model.vo.Payment" %>
<!--main-->
<div id="mainOpacity h-host-main">
	<section class="h-main h-calc">
     	<!-- 호스트 테이블의 정산 정보 -->
			<h2>정산 정보 관리</h2><hr>
			<table class="h-calc-tbl">
				<tr>
					<%-- <th>은행 명</th>
					<td><!-- <!-- <%=h.getAccountBank()%> --> --></td>
					<th>계좌 번호</th>
					<td><!-- <%=h.getAccount()%> --></td>
					<th>예금주 명</th>
					<td><!-- <%=h.getAccountName()%> --></td>
					<th>정산 일</th>
					<td><!-- <%=c.getCalcReqDate()%> --></td> --%>
					<td>은행 명</td>
					<td>카카오뱅크</td>
					<td>계좌 번호</td>
					<td>3333-11-2222222</td>
					<td>예금주 명</td>
					<td>예금주</td>
					<td>정산 일</td>
					<td>매달 1일</td>
					<td><button name="h-updateAccountBtn" id="h-updateAccountBtn">수정</button></td>
				</tr>
			</table>
<!-- 					<td><input type="text" name="account_bank"></td> -->
     			<!-- 예약 내역 상세 페이지로 이동 -->
                <!-- <div class="h-viewList"><a href="">+</a></div> -->
        <!-- </div> -->
        
	</section>
	<section class="h-main h-main-rsvList">
		<div class="h-main-title">
			<h2>새로운 예약 내역</h2>
	    </div>
	        <hr>
			<div class="h-r-callendar" id="h-main-chart"></div>
                <table id="h-main-rsv-tbl">
                    <tr>
                    	<th>NO</th>
                        <th>결제 번호</th>
                        <th>클래스 이름</th>
                        <th>날짜</th>
                        <th>예약자 아이디</th>
                        <th>예약 인원</th>
                    </tr>
                    <!-- P.PAYMENT_ID, C.CLASS_TITLE, CD.BOOKING_TIME_START, CD.BOOKING_TIME_END, P.MEMBER_ID -->
                    <%if(rsvList!=null && !rsvList.isEmpty()){
                    	int count=1;
                    	for(Payment p: rsvList){
                        %>
		                    <tr>
		                    	<td><%=count %></td>
		                        <td><%=p.getPaymentId()%></td>
		                        <td><%=p.getClassTitle()%></td>
		                        <td><%=p.getBookingTimeStart()%> - <%=p.getBookingTimeEnd()%></td>
		                        <td><%=p.getMemberId()%></td>
                                <td><%=p.getClassPersonnel()%></td>
	                   		</tr>
	                    <%count++;
	                    }
                    
                    }else{ %>
                    <tr>
                        <td colspan="5">조회된 예약이 없습니다.</td>
                    </tr>
                    <%} %>
                </table>
            </div>
        </section>
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <%-- <script type="text/javascript">
    $("#h-updateAccountBtn").click(e=>{
    	$.get("<%=request.getContextPath()%>/host/updateHostCalc.do?hostId=<%=loginHost.getHostId()%>",function(data){
			console.log(data);
		});
    })
    
    document.addEventListener('DOMContentLoaded', function() {
    	
	      // Load the Visualization API and the corechart package.
	      google.charts.load('current', {'packages':['corechart']});
	
	      // Set a callback to run when the Google Visualization API is loaded.
	      google.charts.setOnLoadCallback(drawChart);
	
	      // Callback that creates and populates a data table,
	      // instantiates the pie chart, passes in the data and
	      // draws it.
	      function drawChart() {
	
	        // Create the data table.
	        var data = new google.visualization.DataTable();
	        data.addColumn('string', 'Topping');
	        data.addColumn('number', 'Slices');
	        data.addRows([
	          ['Mushrooms', 3],
	          ['Onions', 1],
	          ['Olives', 1],
	          ['Zucchini', 1],
	          ['Pepperoni', 2]
	        ]);
	
	        // Set chart options
	        var options = {'title':'How Much Pizza I Ate Last Night',
	                       'width':400,
	                       'height':300};
	
	        // Instantiate and draw our chart, passing in some options.
	        var chart = new google.visualization.PieChart(document.getElementById('h-main-chart'));
	        chart.draw(data, options);
	      }
    }
    </script> --%>
    <script src="<%=request.getContextPath() %>/js/host.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<%@ include file="/views/host/hostFooter.jsp"%>


        