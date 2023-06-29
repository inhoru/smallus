<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*, com.smallus.classes.model.vo.*, java.text.SimpleDateFormat"%>
<%
Classes info = (Classes) request.getAttribute("classinfo");
%>
<style>
/* 기본상세정보 CSS : 상세페이지 접근때부터 있어야해서 여기도 있음 */
nav.detail_info {
	font-size: 16px;
	font-weight: bolder;
	/* margin-left: 20%; */
}
hr {
    margin-top: 3px;
    margin-bottom: 3px;
	margin-right: 20%;
}
/* 상세페이지 전체 */
.d-class-detail {
	width: 70%;
	margin: 0 auto;
	margin-bottom: 20px;
	font-size:16px;
}
.d-detail-header {
	display: flex;
	/* margin: 15px; */
}
.d-detail-header>* {
	padding: 15px;
}
.d-detail-header div {
	margin: 5px 0;
}
button#m-backbtn  {
	width:200px;
	font-weight: bold;
	background-color: #E8D6C3;
	border:0px;
	border-radius: 1rem;
	text-align:center;
	font-size:20px;
	height:70px;
	cursor:pointer;
}
div#m-backbtncontainer{
	text-align:center;
}
h2{
	margin-bottom:10px;
}
</style>
<%@ include file="/views/common/hostHeader.jsp"%>
<div class="d-class-detail">
	<div class="d-detail-header">
		<div class="d-detail-img">
			<img
				src="<%=request.getContextPath()%>/upload/class/<%=info.getClassThumbnail()%>"
				width=400px height=400px>
			<!-- 이미지 등록한것 있으면 수정예정 -->
		</div>
		<div class="d-detail-main">
			<div id="d-detail-top">
				<p><%=info.getCategoryTitle()%></p>
			</div>
			<h2><%=info.getClassTitle()%></h2>
			<p><%=info.getClassId()%></p>
			<h2>
				1인
				<%=info.getClassPrice()%>원
			</h2>
			<div class="d-detail-schedule">
				<p>최대인원 수</p>
				<p><%=info.getClassPersonnel()%>명
				</p>
			</div>
		</div>
	</div>
	<br>
	<div class="d-dtail-ajax">
		<nav class="detail_info">
			<h2>상세 정보</h2>
			<pre><%=info.getClassDetail()%></pre>
			<hr>
			<h2>주소</h2>
			<p><%=info.getClassAddress()%></p>
			<hr>
			<h2>제공 사항</h2>
			<p><%=info.getClassOffer()%></p>
			<hr>
			<h2>유의 사항</h2>
			<p><%=info.getClassNotice()%></p>
			<hr>
			<h2>준비물</h2>
			<p><%=info.getClassSupplies()%></p>
		</nav>
	</div>
</div>
<div id="m-backbtncontainer">
	<button id="m-backbtn" onclick="hBackToclass()">목록으로</button>
</div>
<script>
	function hBackToclass(){
		location.assign("<%=request.getContextPath()%>/class/viewHostClassDetail.do?classId=<%=info.getClassId()%>");
	}
</script>
<%@ include file="/views/common/footer.jsp"%>