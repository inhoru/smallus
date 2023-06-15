<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/mainHeader.jsp" %>   
<body>
<div id="m-bodycontainer">
	<h1>로그인</h1>
	<div id="m-loginFrm">
		
		<form id="loginFrm" action="<%=request.getContextPath()%>/member/memberlogin.do" method="post" onsubmit="">
			<table id="loginTable">
			<tr>
				<td>
					아이디
				</td>
				<td>
					<input type="text" name="memberId" id="memberId" value="<%=saveId!=null?saveId:""%>">
				</td>
			</tr>
			<tr>
				<td>
					비밀번호
				</td>
				<td>
					<input type="password" name="password" id="password">
				</td>
			</tr>
			<tr id="m-checkboxline">
				<td>
					<input type="checkbox" name="saveId" id="saveId" <%=saveId!=null?"checked":"" %>>아이디 저장
				</td>
				<td class="searchId">
					<a href="">아이디찾기 |</a><a href="">비밀번호찾기</a>
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" id="m-enrollmemberbtn" value="일반회원가입"> 
				</td>
				<td>
					<input type="button" id="" value="호스트회원가입"> 
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인">
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<img src="<%=request.getContextPath()%>/img/카카오로그인.png" class="m-socialbtn">
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<img src="<%=request.getContextPath()%>/img/네이버로그인.png" class="m-socialbtn">
				</td>
			</tr>
			</table>
		</form>
	</div>
</div>	
</body>
<script>
	$("#m-enrollmemberbtn").click(e=>{
		location.assign("<%=request.getContextPath()%>/views/member/enrollMember.jsp");
	});
</script>
<style>
div#m-bodycontainer{ 
	display: flex;
	justify-content: center;
	flex-direction:column;
	width: 100%;
    text-align: center;
    table-layout: fixed;
   	background-color: #FFFCF5;
   	min-height:600px;
}
div#m-loginFrm{
 	display: flex;
 	justify-content: center;
}
table#loginTable{
	margin-top: 50px; 
	border: 1px solid black;
	width:350px;
	height:30px;
}
table#loginTable tr{
	height:30px;
}
tr#m-checkboxline{
	height: 25px;
}
tr#m-checkboxline>td{
	font-size: 0.4rem;
}
table#loginTable input[type=button]{
	width:12rem;
	font-weight: bold;
	background-color: #E8D6C3;
	border:0px;
	border-radius: 1rem;
	padding: 0.4rem 0.6rem;
	font-size: 0.8rem;
	height:25px;
}
table#loginTable input[type=submit]{
	width:24rem;
	font-weight: bold;
	background-color: #E8D6C3;
	border:0px;
	border-radius: 1rem;
	padding: 0.4rem 0.6rem;
	font-size: 0.8rem;
	height:25px;
}
img.m-socialbtn{
	width:24rem;
	height:32px;
	font-weight: bold;
	border:0px;
	border-radius: 1rem;
}
</style>
<%@ include file="/views/common/footer.jsp" %>