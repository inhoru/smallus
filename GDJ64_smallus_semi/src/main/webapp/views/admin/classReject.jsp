<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
<title>클래스거절</title>
<style>
	body.m-msgbd{
	background: #FDF8EB;
	}
	div#m-checkidcontainer{
		text-align:center;
		padding-top:50px;		
	}
	span#duplicated{
		color:red;
		font-weight:bolder;
	}
	button#m-duplicatebtn{
		width:80px;
		height:40px;
		font-weight: bold;
		background-color: #E8D6C3;
		border:0px;
		border-radius: 1rem;
		text-align:center;
		font-size: 0.6rem;
	}
	div#m-checkidcontainer button#m-confirmbtn{
		width:80px;
		height:25px;
		font-weight: bold;
		background-color: #E8D6C3;
		border:0px;
		border-radius: 1rem;
		text-align:center;
		font-size: 0.7rem;
		cursor:pointer;
	}
</style>
</head>
<body class="m-msgbd">
	<div id="m-checkidcontainer">
		<span>승인거부 사유를 등록해주세요</span>
		<br><br>	
			<select id="m-selectbox" style="width:400px; height:30px;">
				<option value='N1'>내용부실</option>
				<option value='N2'>내용부적절</option>
				<option value='N3'>중복등록</option>
			</select>
			<button id="m-rejectbtn">등록</button>
	
	</div>
</body>
<script>
$("#m-rejectbtn").click(e=>{
	let classId='<%=request.getParameter("classId")%>'
	let classPassId=$("#m-selectbox").val();
	console.log(classId,classPassId);
	location.assign("<%=request.getContextPath()%>/admin/ClassesReject.do?classId="+classId+"&classPassId="+classPassId);
	alert("클래스 거절처리에 성공하였습니다.");
	opener.location.reload();
	close();
})
</script>
</html>