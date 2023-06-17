<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/host/hostHeader.jsp"%>
<%@ page import="java.util.List, com.smallus.payment.model.vo.Payment" %>
<!--main-->
<%
	List<Payment> payment=(List)request.getAttribute("paymentList");
%>
<div id="mainOpacity h-host-main">
	 <section class="h-main h-rsv">
     	<div class="h-main-title">
     		<h2>클래스 예약 관리</h2>
     			<!-- 예약 내역 상세 페이지로 이동 -->
                <!-- <div class="h-viewList"><a href="">+</a></div> -->
        </div><hr>
		<!-- <div id="columnchart_material" style="width: 100%; height: 500px;"></div>
		send:<br>
		<input id="sendInput" type="text"><br>
		response:<br>
		<input id="responseInput" type="text"><br><br>
		<button onclick="addData();">add</button> <button onclick="removeData();">remove</button> -->
        <seciton class="h-class-list-container">
			<div class="h-class-list-rowContainer">
				<div class="h-class-list">
					<a href="<%=request.getContextPath()%>/views/host/hostClassSub.jsp">
						<img src="<%=request.getContextPath()%>/img/img-slide2-1.png">
					</a>
					
				</div>
			</div>
		</section>
	</section>
	<section class="h-main h-main-rsvList">
            <div>
                <div class="h-main-title"> 
                    <h2>새로운 예약 내역</h2>
                    <!-- 예약 내역 상세 페이지로 이동 -->
                    <div class="h-viewList"><a href="">+</a></div>
                </div>
                <hr>
                <!-- ajax 통해서 넣을 예약 테이블 -->
                <table id="h-rsvlist-tbl">
                    <tr>
                        <th>NO</th>
                        <th>클래스 이름</th>
                        <th>날짜</th>
                        <th>시간</th>
                        <th>예약 인원</th>
                        <th>잔여 인원</th>
                        <th>예약자 이름</th>
                    </tr>
                    <%if(!payment.isEmpty()) {
                    	for(Payment p:payment){%>
	                    <tr>
	                        <td><%=p.getPaymentId() %></td>
	                        <td><%=p.getClassTitle()%></td>
	                        <td>날짜</td>
	                        <td>15:00 - 17:00</td>
	                        <td>1명</td>
	                        <td>1명</td>
	                        <td>최*호</td>
	                    </tr>
                    	<%}
                    }else{ %>
                    <tr>
                        <td colspan="7">조회할 예약이 없습니다.</td>
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


        