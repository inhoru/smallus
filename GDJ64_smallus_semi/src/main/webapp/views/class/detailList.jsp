<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div>
		 <div>
		<a href="">상세 정보</a>
		</div>
		<nav class="detail_info">
			<!-- style="font-size: 16px; font-weight: bolder; margin-left: 20%;" -->
			<ul>
				<li id="info"><p>상세 정보</p></li>
				<p id="text">상세정보로 넣은 이미지, 정보</p>
				<hr>
				<li id="info"><p>주소</p></li>
				<img  id="address" src="<%=request.getContextPath()%>/img/category_main/map.png">
				<p style="font-size: 8px">서울시 노원구 월계동 광운로 2나길</p>
				<hr>
				<li id="info"><p>제공 사항</p></li>
				<p id="text">스테인 글라스 만들 때 사용하는 재료</p>
				<hr>
				<li id="info"><p>유의 사항</p></li>
				<p id="text">미세한 유리조각이 날릴 수 있으니 주의</p>
				<hr>
				<li id="info"><p>준비물</p></li>
				<p id="text">튼튼한 두 팔과 체력!!!</p>
				<!-- <hr style="margin-right: 20%"> -->
			</ul>
		</nav>
	</div>
	<style>
	nav.detail_info{
	font-size:16px;
	font-weight: bolder;
	margin-left: 20%;
	}
	#info{
	margin: 1%;
	}
	#text{
	font-weight: lighter;
	font-size: 8px;
	margin: 1%
	}
	#address{
	width: 750px;
	height: 300px;
	margin: 1% 2%}
	hr{
	margin-right: 20%;
	}
	</style>