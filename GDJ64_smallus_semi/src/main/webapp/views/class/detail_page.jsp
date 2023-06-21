<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/mainHeader.jsp"%>
<link rel="stylesheet" type="text/html"
	href="<%=request.getContextPath()%>./css/category/detail.css">

<div class="d-class-detail">
	<div class="d-detail-header">
		<div class="d-detail-img">
			<img src="<%=request.getContextPath()%>/img/category_main/craft3.jpg"
				width=500px height=500px>
		</div>
		<div class="d-detail-main">
			<div id="d-detail-top">
				<p>공예</p>
				<p>♥ 찜 110</p>
				<p>★ 4.5점</p>
			</div>
			<h3>스테인 글라스로 나만의 소품 만들기</h3>
			<h4>1인 37,000원</h4>
			<div class="d-detail-schedule">
				<div id="d-detail-date">
					<img
						src="<%=request.getContextPath()%>/img/category_main/calendar.png"
						width="300" height="200">
				</div>
				<div id="d-detail-personnel">
					<p>인원수</p>
					<button>-</button>
					<p>1명</p>
					<button>+</button>
				</div>
				<div id="d-payment">
					<p>결제금액 37,000원</p>
					<button>결제하기</button>
				</div>
			</div>
		</div>
	</div>
	<br>
	<div class="d-dtail-ajax"></div>
</div>

<%-- <script>
	let personnel=1;
		$("#qnaAjax").click(e=>{
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/qnaTest.do",
				success:function(data){
					console.log(data);
					$(".d-dtail-ajax").html(data);
				},
				error:(e,m)=>{
					console.log(e);
				}
			});
		});
</script> --%>
<div class="menu">
	<nav>
		<ul>
			<li><h4 id="debut">상세 정보</h4></li>
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
			<li><h4 id="rebut">후기</h4></li>
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
			<li><h4 id="qnaAjax">Q & A</h4></li>
			<!-- <button id="btnqna">qna 페이지 받아오기</button> -->
			<div id="qnacontainer"></div>
			<script>
	$("#qnaAjax").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/ajax/qnaTest.do",
			//dataType:"html",
			success:function(data){
				console.log(data);
				$("#qnacontainer").html(data);
			},
			error:(e,m)=>{
				console.log(e);
			}
		});
	});
	</script>
		</ul>
		<hr style="margin: 1% 20%;">
	</nav>
</div>

	<style>
.d-class-detail {
	width: 70%;
	margin: 0 auto;
}

.d-detail-header {
	display: flex;
	margin: 15px;
}

.d-detail-header>* {
	padding: 15px;
}

.d-detail-header div {
	margin: 5px 0;
}

#d-detail-top {
	display: flex;
}

#d-detail-personnel {
	display: flex;
}

#d-detail-personnel button {
	width: 30px;
	background-color: #F8D8D8;
	border-radius: 20px;
}

#d-payment {
	display: flex;
}

#d-payment>button {
	width: 100px;
	background-color: #F8D8D8;
	border-radius: 20px;
}

.d-class-detail div {
	/* border:1px solid red; */
	
}

.d-detail-menu {
	display: flex;
	justify-content: space-around;
	text-align: center;
}

.d-detail-menu li {
	justify-content: space-around;
	text-align: center;
}

#d-review-page {
	width: 70%;
	margin: 0 auto;
	display: flex;
}

.d-review-list>div {
	
}

.d-review-one {
	display: inline-flex;
	margin: 1% 20%
}

.d-review-table h2 {
	color: gold;
}

.d-review-table button {
	justify-content: end;
	/* 삭제버튼을 오른쪽으로 빼고 싶으나.... */
}

.d-review-table table {
	margin-left: 20px;
}
div.menu{
text-align: center;
margin-left: 20%}
</style>
	<%@ include file="/views/common/footer.jsp"%>