<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/mainHeader.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>./css/category/detail.css"/>
<div class="detail">
<section id="main">
        <div class="detail_page">
			<a style="display: block; padding: 3% 20%; font-size: 8px;">공예</a>
			<h4 style="margin: 1% 20%; font-size: 32px;">스테인 글라스로 나만의 소품 만들기</h4>
			<img src="<%=request.getContextPath()%>/img/category_main/craft3.jpg" width="500" height="500" style="margin: 1px 20%">
			<input type="text" value="결제하기" width="200">
			<div class="detail_page2">
				<img src="<%=request.getContextPath()%>/img/category_main/craft2.jpg" width="245" height="245" style="margin-left:20%">
				<img src="<%=request.getContextPath()%>/img/category_main/craft8.png" width="245" height="245">
			</div>
        </div>
		<nav class="menu" style="margin: 4%;">
			<ul style="font-size: 24px; justify-content: space-evenly; display: flex;" >
				<li><a href="">상세 정보</a></li>
				<hr>
				<li><a href="">후기</a></li>
				<hr>
				<li><a href="">Q & A</a></li>
			</ul>
			<hr style="margin: 1% 10%; ">
		</nav>
		<nav class="detail_info" style="font-size: 16px; font-weight: bolder; margin-left: 20%;">
			<ul>
				<li style="margin:1%;"><a href="">상세 정보</a></li>
				<p style="font-weight: lighter; font-size: 8px; margin: 1%;">상세정보로 넣은 이미지, 정보</p>
				<hr style="margin-right: 20%">
				<li style="margin: 1%;"><a href="">주소</a></li>
				<img src="<%=request.getContextPath()%>/img/category_main/map.png" width="750" height="300" style="margin: 1% 2%;">
				<p style="font-size: 8px">서울시 노원구 월계동 광운로 2나길</p>
				<hr style="margin-right: 20%">
				<li style="margin:1%;"><a href="">제공 사항</a></li>
				<p style="font-weight: lighter; font-size: 8px; margin: 1%;">스테인 글라스 만들 때 사용하는 재료</p>
				<hr style="margin-right: 20%">
				<li style="margin: 1%;"><a href="">유의 사항</a></li>
				<p style="font-weight: lighter; font-size: 8px; margin: 1%">미세한 유리조각이 날릴 수 있으니 주의</p>
				<hr style="margin-right: 20%">
				<li style="margin: 1%;"><a href="">준비물</a></li>
				<p style="font-weight: lighter; font-size: 8px; margin:1%;">튼튼한 두 팔과 체력!!!</p>
			</ul>
		</nav>
    </section>
</div>
<%@ include file="/views/common/footer.jsp"%>