<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/views/common/mainHeader.jsp" %>
<style>
div#m-bodycontainer{ 
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
}
</style>
<body>
<div id="m-bodycontainer">
	<h1>로그인</h1>
	<div id="m-loginFrm">
		
		<form id="loginFrm" action="<%=request.getContextPath()%>/login/member.do" method="post" onsubmit="">
			<table id="loginTable">
			<tr>
				<td>
					아이디
				</td>
				<td>
					<input type="text" name="memberId" id="memberId">
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
			<tr>
				<td>
					<input type="checkbox" name="saveId" id="saveId">아이디 저장
				</td>
				<td class="searchId">
					<a href="">아이디찾기 |</a><a href="">비밀번호찾기</a>
				</td>
			</tr>
			<tr>
				<td>
					<button>일반회원가입</button> 
				</td>
				<td>
					<button>호스트회원가입</button>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인">
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<img src="">
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<img src="">
				</td>
			</tr>
			</table>
		</form>
	</div>
</div>	
</body>
<%@ include file="/views/common/footer.jsp" %>