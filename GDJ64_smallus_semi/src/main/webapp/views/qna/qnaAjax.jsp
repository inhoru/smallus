<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="qna">
	<a href="">Q & A</a>
	</div>
	<button id="btnqna">qna 페이지 받아오기</button>
	<div id="qnacontainer"></div>
	<script>
	$("#btnqna").click(function(e){
		$.ajax({
			url:"<%=request.getContextPath()%>/ajax/qnaTest.do",
			dataType:"html",
			success:function(data){
				$("#qnacontainer").html(data);
			}
		});
	});
	</script>
</body>
</html>