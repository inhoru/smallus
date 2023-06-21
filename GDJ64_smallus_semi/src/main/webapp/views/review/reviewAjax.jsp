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
	<a href="">후기</a>
	<button id="rebut">후기 받아오기</button>
	<div id="recontainer"></div>
	<script>
	$("#rebut").click(e=>{		
	$.ajax({
		url:"<%=request.getContextPath()%>/ajax/reviewTest.do",
		//dataType:"html",
		success:function(data){
			console.log(data);
			$("#recontainer").html(data);
			},
			error:(e,m)=>{
				console.log(e)
			}
		});
	});
	</script>
</body>
</html>