<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%List<Payment> rsvList =(List)session.getAttribute("rsvList"); %>
<%@ include file="/views/host/hostHeader.jsp"%>
<%@ page import="java.util.List, com.smallus.payment.model.vo.Payment" %>
<!--main-->
<%-- <%
	List<Payment> rsvList=(List)request.getAttribute("rsvList");
%> --%>
<div id="mainOpacity h-host-main">
	<section class="h-main h-rsv">
     	<div class="h-main-title">
			<h2>5월 예약 내역</h2><hr>
     			<!-- 예약 내역 상세 페이지로 이동 -->
                <!-- <div class="h-viewList"><a href="">+</a></div> -->
        </div><hr>
		<div class="h-r-callendar" id="h-main-calendar"></div>
        
	</section>
	<section class="h-main h-main-rsvList">
            <div>
                <div class="h-main-title"> 
                    <h2>새로운 예약 내역</h2>
                    <!-- 예약 내역 상세 페이지로 이동 -->
                    <!-- <div class="h-viewList"><a href="">+</a></div> -->
                </div>
                <!-- ajax 통해서 넣을 예약 테이블 -->
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
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);
	  
	  var count = 0;
	  var data;
	  var chart;
      var options;
	  
	  var today = new Date();

		var year = today.getFullYear();
		var month = ('0' + (today.getMonth() + 1)).slice(-2);
		var day = ('0' + today.getDate()).slice(-2);

		var dateString = year + '-' + month;

		console.log(dateString);

      function drawChart() {
	  data = new google.visualization.DataTable();
	  data.addColumn('string', 'host-name');
	  data.addColumn('number', 'class-name');
	  data.addColumn('number', 'class-name2');
	  data.addRow([dateString, 1, 1]);
	  
        options = {
          chart: {
            title: 'Analysis of Dialogue System',
            subtitle: '',
          }
        };

        chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
      
      function addData(){
	    count++;
		data.addRow([year+'-'+(month + count), Number(document.getElementById('sendInput').value), Number(document.getElementById('responseInput').value)]);
		chart.draw(data, options)
      }
      function removeData(){
		data.removeRow(0);
		chart.draw(data, opstions)
      }
    </script>        
<%@ include file="/views/host/hostFooter.jsp"%>


        