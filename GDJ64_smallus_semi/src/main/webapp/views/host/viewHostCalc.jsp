<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%List<Payment> rsvList =(List)session.getAttribute("rsvList"); %>
<style>
	section.h-calc>div.h-updateAccInfo{
		width: 100%;
		border: 1px solid red;
		display: flex;
	}
	section.h-calc>div.h-updateAccInfo *{
		display:flex;
		border: 1px solid red;
		margin: 1rem;
	}
</style>
<%@ include file="/views/common/hostHeader.jsp"%>
<%@ page import="java.util.List, com.smallus.payment.model.vo.Payment" %>
<!--main-->
<div id="mainOpacity h-host-main">
	<section class="h-main h-calc">
     	<!-- 호스트 테이블의 정산 정보 -->
			<h2>정산 정보 관리</h2><hr>
			<%if(hostInfo.getHostAccountBank()!=null&&!hostInfo.getHostAccountBank().isEmpty()){%>
				<table class="h-calc-tbl">
					<tr>
						<td>은행 명</td>
						<td><%=hostInfo.getHostAccountBank() %></td>
						<td>계좌 번호</td>
						<td><%=hostInfo.getHostAccount() %></td>
						<td>예금주 명</td>
						<td><%=hostInfo.getHostAccountName() %></td>
						<td>정산 일</td>
						<td>매달 <%=hostInfo.getCalcReqDate()%> 일</td>
						<td><button id="asdgsdgs">수정</button></td>
						<%-- <td><button id="asdgsdgs"onclick="location.assign('<%=request.getContextPath()%>/host/updateHostCalc.do')">수정</button></td> --%>
						
					</tr>
				</table>
    		<%} else{%>
			<div id="h-updateAccInfo">
				<h4>은행 명</h4>
				<select id="h-selectAccountBank">
					<option selected disabled>은행 선택
					<option value="카카오뱅크" name="hostAccountBank">카카오뱅크
					<option value="국민은행" name="hostAccountBank">국민은행
					<option value="기업은행" name="hostAccountBank">기업은행
					<option value="농협은행" name="hostAccountBank">농협은행
					<option value="신한은행" name="hostAccountBank">신한은행
					<option value="산업은행" name="hostAccountBank">산업은행
					<option value="우리은행" name="hostAccountBank">우리은행
					<option value="한국씨티은행" name="hostAccountBank">한국씨티은행
					<option value="하나은행" name="hostAccountBank">하나은행
					<option value="SC제일은행" name="hostAccountBank">SC제일은행
				</select>
				<h4>계좌 번호</h4>
				<input type="text" placeholder="계좌번호" name="hostAccount">
				<h4>예금주 명</h4>
				<input type="text" placeholder="정산 받을 예금 주 이름을 입력하세요" name="hostAccountName">
				<h4>정산 일자</h4>
				<input type="number" placeholder="정산은 신청 후 24시간 이내에 승인됩니다." name="calcReqDate">
				<button id="h-hostAccountUpdateBtn">수정</button>
			</div>
			<%} %>
	</section>
	<!-- main -->
	<section class="h-main h-main-calcList">
		<div class="h-main-title">
			<h2>정산 내역</h2>
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
<script type="text/javascript">
	$("#asdgsdgs").click(e=>{
		$.get("<%=request.getContextPath()%>/host/updateHostCalc.do",data=>{
			console.log(data);
			$(".h-calc").html(data);
		});
	})
  	$("#h-hostAccountUpdateBtn").click(e=>{
	    let accountbank=$("#h-selectAccountBank option:selected").val();
	    let account=$("#h-updateAccInfo input[name='hostAccount']").val();
	    let accountName=$("#h-updateAccInfo input[name='hostAccountName']").val();
	    let calcReq=$("#h-updateAccInfo input[name='calcReqDate']").val();
	    
   		$.get("<%=request.getContextPath()%>/host/updateHostAccount.do?hostId=<%=hostInfo.getHostId()%>",function(data){
				console.log(data);
			});
    		$.ajax({
				url:"<%=request.getContextPath()%>/host/updateHostAccount.do",
				//type:"get",
				type:"post",
				data:{
					hostId:'<%=hostInfo.getHostId()%>',
					hostAccountBank:accountbank,
					hostAccount:account,
					hostAccountName:accountName,
					calcReqDate:calcReq
				}, 
				success:(data)=>{ 
					console.log(data);
					alert("정산 정보가 저장 되었습니다 :)"); 
				},
				error: (e,m)=>{
					console.log(e); 
					console.log(m);
					if(e.status==404) alert("요청한 페이지가 없습니다.");
				},
				complete:()=>{
					alert("변경 되었습니다."); 
				}
			}); 
    	})
    	$("#updateAccountBtn").click(e=>{
    		// 수정 버튼 누르면 아래 div 사라지고 정산 정보 수정하기
    		$(".h-calc-tbl").css('display','none');
    		$(".h-main-rsvList").css('display','none');
    		$("div.h-updateAccInfo").css('display','flex');
    	});
    </script>
    <script src="<%=request.getContextPath() %>/js/host.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<%@ include file="/views/common/hostFooter.jsp"%>


        