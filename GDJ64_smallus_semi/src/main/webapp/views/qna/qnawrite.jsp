<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/mainHeader.jsp"%>
<div class="qna_page">
	<section id="main">
		<div class="qna">
			<a style="display: block; padding: 3% 25%; font-size: 24px;">Q &
				A</a>
		</div>
		<div>
			<nav>
				<ul id="dtn">
					<li style="font-size: 16px; margin-left: 35%;">클래스 명: 양모펠트로
						반려동물 만들기</li>
					<textarea
						style="margin:1% 35% ;padding-left: 10px; font-size: 8px; border-radius: 20px; "
						cols="100" rows="2" placeholder="   제목을 입력해 주세요"></textarea>
					<textarea
						style="margin: 1% 35%; font-size: 8px; border-radius: 20px; padding-left:10px"
						cols="100" rows="20" placeholder="    내용을 입력해 주세요"></textarea>
					<br>
					<br>
					<button type="sumbit"
						style="width: 80px; height: 25px; border-radius: 20px; margin-left: 50%;">등록하기</button>
					<br>
					<br>
					<br>
					<br>
				</ul>
			</nav>
		</div>
	</section>
	<div class="footer">
		<div class="usMenu"></div>
		<%@ include file="/views/common/footer.jsp"%>