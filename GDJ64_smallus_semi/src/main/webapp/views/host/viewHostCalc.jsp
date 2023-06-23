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
				<div><button id="asdgsdgs">수정</button><hr></div>
				
	</section>
	<!-- main -->
	<section class="h-main h-main-calcList">
		<div class="h-main-title">
			<h3>정산 내역</h3>
	    </div>
	        <hr>
		<div class="h-r-callendar" id="h-main-chart"></div>
		<div class="h-main-title">
			<h3>전체 정산 내역</h3>
			<select name="h-selecCalcStatus" id="h-selecCalcStatus" onchange="selectOption()">
               	<option>정산 상태(전체)</option>
               	<option value="Y" <%=request.getParameter("calcStatus")!=null&&request.getParameter("calcStatus").equals("Y")?"selected":""%>>정산 완료</option>
               	<option value="W" <%=request.getParameter("calcStatus")!=null&&request.getParameter("calcStatus").equals("W")?"selected":""%>>정산 대기</option>
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
                    <!-- P.PAYMENT_ID, C.CLASS_TITLE, CD.BOOKING_TIME_START, CD.BOOKING_TIME_END, P.MEMBER_ID5 -->
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
	                    <%count++;
	                    }%>
                    <%}else{ %>
                 	<tr>
                        <td colspan="7">조회된 정산 정보가 없습니다.</td>
                    </tr>
                    <%} if(cSortList!=null && !cSortList.isEmpty()){
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
	                    <%count++;
                    		}
	                }%>
                </table>
	            <div class="pageBar">
					<%=request.getAttribute("pageBar") %>
				</div>
            </div>
        </section>
    <!--Load the AJAX API-->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	$("#asdgsdgs").click(e=>{
		$.get("<%=request.getContextPath()%>/host/updateHostCalc.do",data=>{
			console.log(data);
			$(".h-calc").html(data);
		});
	})
	//select 옵션 변경하면 이동하는 함
	function selectOption(){
		let index = $("#h-selecCalcStatus option").index($("#h-selecCalcStatus option:selected"));
		// index =1 -> W / 2:Y/3:N
		//console.log(index);
		if(index==0){
			location.replace('<%=request.getContextPath()%>/host/viewHostCalc.do');
		}else if(index==1){
			location.assign('<%=request.getContextPath()%>/host/sortingHostCalc.do?calcStatus=Y');
		}else if(index==2){
			location.assign('<%=request.getContextPath()%>/host/sortingHostCalc.do?calcStatus=W');
		}else if(index==3){
			location.assign('<%=request.getContextPath()%>/host/sortingHostCalc.do?calcStatus=N');
		}
	}
</script>
<script src="<%=request.getContextPath() %>/js/host.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<%@ include file="/views/common/hostFooter.jsp"%>


        