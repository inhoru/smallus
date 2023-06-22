<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.smallus.classes.model.vo.*" %>
<%
	Classes classInfo=(Classes)request.getAttribute("infoClass");
	List<ClassDetail> classScedule=(List)request.getAttribute("schedule");
%>
<%! public int personnelCount=1; %>

<%@ include file="/views/common/mainHeader.jsp"%>

<div class="d-class-detail">
	<div class="d-detail-header">
		<div class="d-detail-img">
			<img src="<%=request.getContextPath()%>/img/category_main/craft3.jpg" width=400px height=400px>
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
					<img src="<%=request.getContextPath()%>/img/category_main/calendar.png" width="300" height="200">
				</div>
				<div id="d-detail-personnel">
					<p>인원수</p>
					<button>-</button>
					<p><%=personnelCount %>명</p>
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
	<div class="d-detail-menu">
		<nav>
			<ul>
				<li><a href="">상세 정보</a></li>
				<hr>
				<li><a href="<%=request.getContextPath()%>/views/review/reviewList.jsp">후기</a></li>
				<hr>
				<li><h2 id="qnaAjax">Q & A</h2></li>
			</ul>
		</nav>
	</div>
	<div class="d-dtail-ajax">
		
	
	</div>
</div>

<script>
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
</script>

<style>
	.d-class-detail{
		width:70%;
		margin : 0 auto;
	}
	.d-detail-header{
		display:flex;
		margin : 15px;
	}
	.d-detail-header>*{
		padding: 15px;
	}
	.d-detail-header div{
		margin:5px 0;
	}
	#d-detail-top{
		display:flex;
	}
	#d-detail-personnel{
		display:flex;
	}
	#d-detail-personnel button{
		width:30px;
		background-color:#F8D8D8;
		border-radius: 20px;
	}
	#d-payment{
		display:flex;
	}
	#d-payment> button{
		width:100px;
		background-color:#F8D8D8;
		border-radius: 20px;
	}
	.d-class-detail div{
		/* border:1px solid red; */
	}
	.d-detail-menu{
		display:flex;
		justify-content: space-around;
		text-align: center;
	}
	.d-detail-menu li{

		justify-content: space-around;
		text-align: center;
	}
	
</style>







<%@ include file="/views/common/footer.jsp"%>

