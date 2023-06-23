<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "com.smallus.member.model.vo.Member" %>
<%
	String email=request.getParameter("email");
	String memberNickname=request.getParameter("memberNickname");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
<title>카카오추가정보확인</title>
<style>
	body.m-msgbd{
	background: #FDF8EB;
	
	}
	div#m-checkidcontainer{
		text-align:center;
		font-size:12px;
		padding-top:50px;		
	}
	div#m-checkidcontainer button#m-kakaosubmit{
		width:80px;
		height:25px;
		font-weight: bold;
		background-color: #E8D6C3;
		border:0px;
		border-radius: 1rem;
		text-align:center;
		font-size: 0.8rem;
		cursor:pointer;
	}
</style>
</head>
<body class="m-msgbd">
	<div id="m-checkidcontainer">
		<!-- 아이디 재입력창 구성 -->
		<table id="m-kakaoinfotbl">
			<tr>
				<td>이름</td>
				<td>
				<input type="hidden" name="memberEmail" value=<%=email%>>
				<input type="text" name="memberName" id="memberName">	
				</td>
				<td rowspan="2">
					<button id="m-kakaosubmit" style="height:50px;"><b>추가정보<br>등록하기</b></button>
				</td>
			</tr>
			<tr>
				<td>휴대폰번호</td>
				<td>
				<input type="tel" placeholder="(-없이)01012345678" name="memberPhone" id="memberPhone" maxlength="11" required>
				</td>
			</tr>
		</table>
	</div>
	<script>
	$("#m-kakaosubmit").click(e=>{
		let memberName=$("#memberName").val();
		let memberPhone=$("#memberPhone").val();
		$.ajax({
			url:'<%=request.getContextPath()%>/member/KakaoenrollMember.do',
			type:"get",
			data:{memberEmail:'<%=email%>',memberName:memberName,memberPhone:memberPhone,memberNickname:'<%=memberNickname%>'},
			dataType:"text",
			success: function(data){
		            window.close();
					window.opener.location.assign("<%=request.getContextPath()%>/member/KakaoLogin.do?memberEmail=<%=email%>");
			},
			error:(r,m,e)=>{
				console.log(r);
				console.log(m);
			}
		});	
	});
	</script>
</body>
</html>