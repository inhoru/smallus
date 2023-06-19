<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.smallus.member.model.vo.Member"%>
<%
Member loginMember = (Member) session.getAttribute("loginMember");
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
*{
background-color: #FFFBF5;
}
</style>

<body>

	<div id="updatePassword-container">
		<form name="updatePwdFrm"
			action="<%=request.getContextPath()%>/updatePasswordEnd"
			method="post">
			<table>
				<tr>
					<th>현재 비밀번호</th>
					<td><input type="password" name="password" id="i-password"
						required></td>
				</tr>
				<tr>
					<th>신규 비밀번호</th>
					<td><input type="password" name="password_new"
						id="i-password_new" required></td>
				</tr>
				<tr>
					<th>비밀번호 재입력</th>
					<td><input type="password" name="password_chk" id="i-password_chk" required><br>
					</td>
				</tr>
				<tr>
					<th></th>
					<td></td>
				</tr>
				<tr>
					<td colspan="2"><input type="hidden" name="i-userId"
						value="<%=request.getParameter("userId")%>" /> <input
						type="submit" value="변경" class="re">&nbsp; <input
						type="button" value="닫기" class="cl" onclick="fn_close();" /></td>
				</tr>
			</table>

		</form>
	</div>
</body>
<script>
/* 닫기창 */
function fn_close(){
window.close();

}


/* 비밀번호 확인 */
$("#i-password_chk").keyup(e=>{
	const password=$("#i-password_new").val();
	const passwordCheck=$(e.target).val();
	let color,msg;
	if(password==passwordCheck){
		color="#996F51";msg="*비밀번호가 일치합니다.";
	}else{
		color="#996F51";msg="*비밀번호가 일치하지 않습니다.";
	}
	const td=$(e.target).parents("tr").next().find("td").html("");
	
	$("<p>").css("color",color).text(msg).appendTo(td);
});
</script>
</html>