<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 삭제</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/host/hostMainStyle.css">
</head>
<body>
	<div id="h-delete-checkContainer">
		<h4>등록하신 클래스 세부 일정도 함께 삭제됩니다</h4>
		<h4>삭제 하시겠습니까?</h4>
	</div>
	<div class="h-delete-checkBtn">
		<button onclick="fn_close()">되돌아가기</button>
		<button id="h-delClass">삭제하기</button>
	</div>
	<script>
	/* 닫기창 */
	const context="http://localhost:8080/GDJ64_smallus_semi";
	function fn_close(){
		window.close();
	}
	
	$("#h-delClass").click(e=>{
		alert("삭제 되었습니다");
		window.close();
		location.assign(context+'/host/')
		$.get(context+'/host/CheckDeleteClass.do?classId',function(data){
			console.log(data);
			/* console.log(data.userId);
			console.log(data["age"]);
			console.log(data.height+20);
			if(data.flag){
				alert("실행");
			} */
		});
	});

</script>

</body>
</html>