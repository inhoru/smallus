<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "com.smallus.member.model.vo.Member" %>
<%
	String email=request.getParameter("email");
	String name=request.getParameter("name");
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
		padding-top:50px;		
	}
	div#m-checkidcontainer input[type=submit]{
		width:80px;
		height:25px;
		font-weight: bold;
		background-color: #E8D6C3;
		border:0px;
		border-radius: 1rem;
		text-align:center;
		font-size: 0.6rem;
		cursor:pointer;
	}
</style>
</head>
<body class="m-msgbd">
	<div id="m-checkidcontainer">
		<!-- 아이디 재입력창 구성 -->
			<input type="hidden" name="memberEmail" value=<%=email%>>
			<input type="hidden" name="memberName" value=<%=name%>>
			휴대폰 번호 <input type="tel" placeholder="(-없이)01012345678" name="memberPhone" id="memberPhone" maxlength="11" required>
			<button id="m-kakaosubmit">핸드폰번호 등록하기</button>
	</div>
	<script>
	$("#m-kakaosubmit").click(e=>{
		let memberPhone=$("#memberPhone").val();
		$.ajax({
			url:'<%=request.getContextPath()%>/member/KakaoenrollMember.do',
			type:"get",
			data:{memberEmail:'<%=email%>',memberName:'<%=name%>',memberPhone:memberPhone,memberNickname:'<%=memberNickname%>'},
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