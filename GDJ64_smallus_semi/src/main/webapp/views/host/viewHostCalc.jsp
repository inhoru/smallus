<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Calc> calcList =(List)request.getAttribute("calcList");
	List<Calc> cSortList =(List)request.getAttribute("cSortList");
%>
<%@ include file="/views/common/hostHeader.jsp"%>
<%@ page import="java.util.List, com.smallus.host.model.vo.Calc" %>
<!--main-->
<div id="mainOpacity h-host-main">
	<section class="h-main h-calc">
     	<!-- 호스트 테이블의 정산 정보 -->
			<h3>정산 정보 관리</h3><hr>
				<table class="h-calc-tbl">
					<tr>
						<td>은행 명</td>
						<td>계좌 번호</td>
						<td>예금주 명</td>
						<td>정산 일</td>
					</tr>
					<tr>
						<td><%=hostInfo.getHostAccountBank()!=null&&!hostInfo.getHostAccountBank().isEmpty()?hostInfo.getHostAccountBank():"-"%></td>
						<td><%=hostInfo.getHostAccount()!=null&&!hostInfo.getHostAccount().isEmpty()?hostInfo.getHostAccount():"-"%></td>
						<td><%=hostInfo.getHostAccountName()!=null&&!hostInfo.getHostAccountName().isEmpty()?hostInfo.getHostAccountName():"-"%></td>
						<td>매달 <%=hostInfo.getCalcReqDate()%>일</td>
					</tr>
				</table>
				<div><button id="h-UpdateHostAccount">수정</button><hr></div>
				
	</section>
	<!-- main -->
	<section class="h-main h-main-calcList">
		<div class="h-main-title">
			<h3>정산 내역 그래프로 보기</h3>
	    </div>
	    <div class="h-viewList">
			<a href=""id="h-viewChart">+</a>
		</div>
	        <hr>
		<div class="h-r-callendar" id="h-main-chart"></div>
		<div class="h-main-title">
			<h3>전체 정산 내역</h3>
			<select name="h-selecCalcStatus" id="h-selecCalcStatus" onchange="selecCalcStatus()">
               	<option>정산 상태(전체)</option>
               	<option value="W" <%=request.getParameter("calcStatus")!=null&&request.getParameter("calcStatus").equals("W")?"selected":""%>>정산 대기</option>
               	<option value="Y" <%=request.getParameter("calcStatus")!=null&&request.getParameter("calcStatus").equals("Y")?"selected":""%>>정산 완료</option>
               	<option value="N" <%=request.getParameter("calcStatus")!=null&&request.getParameter("calcStatus").equals("N")?"selected":""%>>정산 거절</option>
            </select>
	    </div>
            <table id="h-main-calc-tbl">
            	<tr>
                   	<th>NO</th>
                   	<th>정산 번호</th>
                    <th>정산 신청 일</th>
                    <th>정산 승인 일</th>
                    <th>정산 신청 금액</th>
                    <th>정산 승인 금액</th>
                    <th>정산 상태</th>
                </tr>
       			<%if(calcList!=null && !calcList.isEmpty()){
           			int count=1;
           			for(Calc c: calcList){%>
				        <tr>
				        	<td><%=count %></td>
				            <td><%=c.getCalcId()%></td>
				            <td><%=c.getCalcReqDate()%></td>
				            <td><%=c.getCalcPassDate()%></td>
		                    <td><%=c.getCalcPrice()%> 원</td>
		                    <td><%=c.getCalcFinalPrice()%> 원</td>
				            <td><%=c.getCalcStatus()%></td>
			           </tr>
		           <%count++;}
           			}else if(cSortList!=null&&!cSortList.isEmpty()){
                    	int count=1;
                    	for(Calc c: cSortList){%>
		                    <tr>
		                    	<td><%=count %></td>
		                        <td><%=c.getCalcId()%></td>
		                        <td><%=c.getCalcReqDate()%></td>
		                        <td><%=c.getCalcPassDate()%></td>
                                <td><%=c.getCalcPrice()%> 원</td>
                                <td><%=c.getCalcFinalPrice()%> 원</td>
		                        <td><%=c.getCalcStatus()%></td>
	                   		</tr>
	                    <%count++;
                    } %>
                <%  }else{ %>
	                <tr><td colspan="7">조회된 정산 정보가 없습니다</td></tr>
                <%} %>
               	</table>
	            <div class="pageBar">
	            	<%=request.getAttribute("pageBar") %>
	            </div>
            </div>
        </section>
    <!--Load the AJAX API-->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	// 정산 정보 수정 및 입력 
	$("#h-UpdateHostAccount").click(e=>{
		$.get("<%=request.getContextPath()%>/host/updateHostCalc.do",data=>{
			console.log(data);
			$(".h-calc").html(data);
		});
	});
	
	// + 버튼 누르면 차트 정보 보이는 함수
	
	google.charts.load('current', { 'packages': ['corechart'] });
	google.charts.setOnLoadCallback(drawDashboard); //콜백 함수 실행되면그래프 생김
	$("#h-viewChart").click(e=>{
		 google.charts.load('current');
		  function drawVisualization() {
		    var dataTable = [
		      ["Country", "Population Density"],
		      ["Indonesia", 117],
		      ["China", 137],
		      ["Nigeria", 142],
		      ["Pakistan", 198],
		      ["India", 336],
		      ["Japan", 339],
		      ["Bangladesh", 1045]
		    ];
		    google.visualization.drawChart({
		      "containerId": "visualization_div",
		      "dataTable": dataTable,
		      "refreshInterval": 5,
		      "chartType": "Table",
		      "options": {
		        "alternatingRowStyle": true,
		        "showRowNumber" : true,
		      }
		    });
		  }
		  google.charts.setOnLoadCallback(drawVisualization);
		<%-- $.ajax({
			type:"get",
  		  	url:"<%=request.getContextPath()%>/host/ajaxViewHostCalc.do",
  		  	success:(data)=>{ 
			 	// responseText에 저장된 값을 data에 대입한다.
				console.log(data);
				function drawVisualization() {
					 let data2 = google.visualization.arrayToDataTable(
							 data2.addColumn('string','Country');
								data2.addColumn('number','Population');
								data2.addColumn('number','Area');
								data2.addRows([
								  ['CN', 1324, 9640821],
								  ['IN', 1133, 3287263],
								  ['US', 304, 9629091],
								  ['ID', 232, 1904569],
								  ['BR', 187, 8514877]
				}
				
		 	},
			error: function(xhr, type) {
			      alert('server msg : ' + xhr.status)

		    }
  	   	}); --%>
	})
	
	
	//select 옵션 변경하면 이동
	function selecCalcStatus(){
		let index = $("#h-selecCalcStatus option").index($("#h-selecCalcStatus option:selected"));
		// index =1 -> W / 2:Y/3:N
		//console.log(index);
		 if(index==0){
			location.replace('<%=request.getContextPath()%>/host/viewHostCalc.do');
		}else if(index==1){
			location.assign('<%=request.getContextPath()%>/host/sortingHostCalc.do?calcStatus=W');
		}else if(index==2){
			location.assign('<%=request.getContextPath()%>/host/sortingHostCalc.do?calcStatus=Y');
		}else if(index==3){
			location.assign('<%=request.getContextPath()%>/host/sortingHostCalc.do?calcStatus=N');
		}
	}
	
</script>
<%-- <script src="<%=request.getContextPath() %>/js/host.js"></script> --%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<%@ include file="/views/common/hostFooter.jsp"%>


        