<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/host/hostHeader.jsp"%>
<!--main-->
<div id="mainOpacity h-host-main">
	 <section class="h-main h-profile">
     	<h2>내 프로필 정보 보기</h2>
        <hr>
        <!--프로필 사진 분기처리-->
        <%if(loginHost.getHostImg().equals("기본프로필.png")){ %>
	        <img src="<%=request.getContextPath()%>/img/profile.png">
	        <a href="" ><img src="<%=request.getContextPath()%>/img/edit.svg" class="h-edit-pf"></a>
        <%} else{%>
        	<img src="<%=request.getContextPath()%>/img/profile1.png">
        	<a href=""><img src="<%=request.getContextPath()%>/img/edit.svg" class="h-edit-pf"></a>
        <%} %>
		<div class="h-profile-info">
			<table>
				<tr>
					<th>아이디</th>
					<td><label for=""><input type="text" placeholder="id" value="<%=loginHost.getHostId()%>" readonly></label</td>
					<td></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><label for=""><input type="text" placeholder="" value="<%=loginHost.getHostNickname()%>"></label></td>
					<td><button>변경</button></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><label for=""><input type="text" placeholder="id" value="<%=loginHost.getHostPw()%>"></label></td>
					<td><button>변경</button></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><label for=""><input type="text" placeholder="id" value="<%=loginHost.getHostEmail()%>"></label></td>
					<td><button>변경</button></td>
				</tr>
				<tr>
					<th>휴대폰번호</th>
					<td><label for=""><input type="text" placeholder="id" value="<%=loginHost.getHostPhone()%>"></label></td>
					<td><button>변경</button></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><label for=""><input type="text" placeholder="id" value="<%=loginHost.getHostHomephone()%>"></label></td>
					<td><button>변경</button></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
			</table>
			<button class="h-submit">등록</button>
		</div>        
	</section>        
<%@ include file="/views/host/hostFooter.jsp"%>
        