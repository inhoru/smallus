<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<body>
	<a href="">상세 정보</a>
	<button id="debut">상세 정보 받아오기</button>
	<div id="decontainer"></div>
	<script>
	$("#debut").click(e=>{		
	$.ajax({
		url:"<%=request.getContextPath()%>/ajax/detailTest.do",
		//dataType:"html",
		success:function(data){
			console.log(data);
			$("#decontainer").html(data);
			},
			error:(e,m)=>{
				console.log(e)
			}
		});
	});
	</script>
</body>
</html>