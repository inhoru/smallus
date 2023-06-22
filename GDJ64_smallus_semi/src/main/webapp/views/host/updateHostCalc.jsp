<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smallus.host.model.vo.Host"%>
<%
	Host loginHost=(Host)session.getAttribute("loginHost");
	Host hostInfo=(Host) request.getAttribute("hostInfo");
%>
<section class="h-updateAccInfo">
	<h2>정산 정보 입력</h2><hr>
	<div>
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
		<input type="text" placeholder="계좌번호" id="h-UDT-hostAccount">
		<h4>예금주 명</h4>
		<input type="text" placeholder="정산 받을 예금 주 입력" id="h-UDT-hostAccountName">
		<h4>정산 일자</h4>
		<select id="h-selectCalcDate">
			<option selected disabled>정산일 선택</option>
			<%for(int i=1;i<32;i++){ %>
				<option value="<%=i%>" name="calcReqDate"><%=i %>일</option>
			<%} %>
		</select>
	</div>
	<div>
		<span>* 입력 하신 정산 일에 자동으로 매달 정산 신청됩니다</span>
		<button id="h-hostAccountUpdateBtn">수정</button>
	</div>
</section>
<script>
	$("#h-hostAccountUpdateBtn").click(e=>{
    let accountbank=$("#h-selectAccountBank option:selected").val();
    let account=$("#h-UDT-hostAccount").val();
    let accountName=$("#h-UDT-hostAccountName").val();
    let calcReq=$("#h-selectCalcDate option:selected").val();
    console.log(accountbank, account, accountName, calcReq)
    
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
				location.assign('<%=request.getContextPath()%>/host/viewHostCalc.do?hostId=<%=hostInfo.getHostId() %>')
			}
		});
	})
</script>
