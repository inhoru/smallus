 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.smallus.member.model.vo.Member"%>
<%
Member m=(Member)request.getAttribute("result"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>

</head>
<style>
/*폰트 */
@font-face {
	font-family: "GmarketSansLight";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff")
		format("woff");
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: "GmarketSansMedium";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff")
		format("woff");
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: "GmarketSansBold";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff")
		format("woff");
	font-weight: normal;
	font-style: normal;
}

div#updatePassword-container {
	margin: 0;
	padding: 0;
	color: #555555;
	list-style-type: none;
	text-decoration: none;
	font-family: 'GmarketSansMedium';
}

div#updatePassword-container table {
	margin: 0 auto;
	border-spacing: 20px;
	font-size: 16px;
	font-weight: 900;
}

div#updatePassword-container table tr:last-of-type td {
	text-align: center;
	font-size: 16px;
	font-weight: 900;
}

#i-password, #i-password_new, #i-password_chk {
	border-radius: 15px;
	width: 250px;
	height: 30px;
}

.re, .cl {
	font-weight: bolder;
	width: 80px;
	height: 40px;
	border-radius: 80px;
	background: #E8D6C3;
	border: none;
	cursor: pointer;
}

p {
	font-size: 12px;
}
</style>

<body>
	<div id="checkId-container">
	<%if(m==null){ %>
		[<span><%=request.getParameter("userId") %></span>]는 사용가능합니다.	
		<br><br>
		<button type="button">닫기</button>
	<%}else{ %>
		[<span id="duplicated"><%=request.getParameter("userId") %></span>]는 사용중입니다.
		<br><br>
		<!-- 아이디 재입력창 구성 -->
		<form action="<%=request.getContextPath() %>/member/idDuplicate.do" method="get">
			<input type="text" name="userId" id="userId">
			<input type="submit" value="중복검사" >
		</form>
	<%} %>
	</div>
	<script>
		const btn=document.querySelector("button[type=button]");
		btn.addEventListener("click",e=>{
			opener.document.querySelector("#userId_").value="<%=request.getParameter("userId")%>";
			close();
		});
	</script>
</body>
</html>