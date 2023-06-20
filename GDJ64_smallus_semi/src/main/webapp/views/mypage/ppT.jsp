<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypage/test.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/payment.js"></script>
<%@ page import="com.smallus.classes.model.vo.ClassDetail, com.smallus.coupon.model.vo.Coupon" %>

<%@ include file="/views/common/mainHeader.jsp"%>

<div id="mainOpacity">
			<div class="h-payment-title" id="h-hide">
		    	<button id="h-p">다음</button>
		    </div>
</div>
<script>
	//let loginMember='<%=(Member) session.getAttribute("loginMember")%>';
	// let mName='<%=memberName%>'
	// let mEmail='<%=memberEmail%>'
	// let mPhone='<%=memberPhone%>'
	
	let memberArr=['<%=memberName%>'.split(" "),'<%=memberEmail%>'.split(" "),'<%=memberPhone%>'.split(" ")];
	
	
	//let memberArr= loginMember.split(",");
	let mainUrl='<%=request.getContextPath()%>';
	let $section =$("<section class='h-payment-container'>");
	let $hPaymentDiv=$("<div class='h-payment'>");
	let $hPaymentTitle=$("<div class='h-payment-title'>");
	let $h3=$("<h3>");
	let $hPayClassList =$("<div class='h-payClass-list'>");
	let $img=$("<img>");
	let $imgContainer=$("<a class='h-class-list-img'>").append($img);
	let $table=$("<table>")
	let $tr=$("<tr>")
	let $th=$("<th>")
	let $td=$("<td>")
	let $a = $("<a>")
	$("#h-p").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/payment.do?memberId=<%=loginMember.getMemberId()%>",
			dataType:"html",
			success:function(data){
				console.log(data);
				$("#mainOpacity").html(data);
			}
		})
		<%-- $.ajax({
			url:"<%=request.getContextPath()%>/payment.do?memberId=<%=loginMember.getMemberId()%>",
			type:"get",
			dataType:"text",
			success:(data)=>{ 
				console.log(memberArr[0])
				
				console.log(data);
				let classThumbnail= data.classThumbnail;
				$("#mainOpacity").append($section);
				$section.append($hPaymentDiv);
				$hPaymentDiv.append($hPaymentTitle)
				$hPaymentTitle.append($h3.text("결제 클래스 정보"));
				$hPaymentDiv.append("<hr>");
				$img.attr('src','./img/main-img1.jpg');
				let $div=$("<div class='h-payClass-list'>");
				$div.append($a.append($img));
				$div.appendTo($section);
				let mArr=["이름","이메일","전화번호"]
				let $tableA=$("<table>");
				for(let i=0;i<memberArr.length;i++){
					const trr=$("<tr>");
					trr.append($th.text(mArr[i])).append($td.text(memberArr[i]));
				}
				$tableA.append($tr);
				
				
				//$tr.append($td.text(memberArr[0].val()));

				//$tableA.append($tr).append($th).text('이메일').append(td).text(loginMember.memberEmail);
				//$tableA.append($tr).append($th).text('전화번호').append(td).text(loginMember.memberPhone);
				$tableA.appendTo($section);
				
				

			},
			error: (e,m)=>{
				// console.log(e); // element
				// console.log(m);
				if(e.status==404) alert("요청한 페이지가 없습니다.");
				else if(e.status!=200) console.log(e); console.log(m);
			},
			complete:()=>{
				alert("서버와 통신 끝"); // success나 error가 끝난 뒤에 무조건 complete가 실행 된다
			}
		});  --%>
	});
</script>
<%@ include file="/views/common/footer.jsp"%>