<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/mainHeader.jsp"%>
<
<style>
#qnatext {
	border: 1px solid #444444;
	margin: 1% 35%;
	border-radius: 20px;
	width: 650px;
	display: flex;
	justify-content: center;
}

#l {
	text-align: left;
	padding-left: 5px;
	}

#a {
	display: block;
	padding: 3% 25%;
	font-size: 24px;
}

li {
	font-size: 16px;
	margin-left: 35%;
}

#t {
	margin: 1% 35%;
	padding-left: 10px;
	font-size: 8px;
	border-radius: 20px;
}

#c {
	margin: 0 35%;
	padding-left: 10px;
	font-size: 8px;
	border-radius: 20px;
}

#but {
	width: 80px;
	height: 25px;
	border-radius: 20px;
	margin-left: 50%;
}
</style>
<div class="qna_page">
	<section id="main">
		<div class="qna">
			<a id="a">Q & A</a>
		</div>
		<div>
			<nav>
				<ul id="dtn">
					<li>클래스 명: 양모펠트로 반려동물 만들기</li>
					<div id="qnatext">
						<table>
							<tr>
								<td id="l">작성자</td>
								<td id="l">2023-06-23</td>
							</tr>
							<tr>
								<th id="l">살짝 어려운 거 같았는데 너무 재미있었어요:)</th>
							</tr>
							<tr>
								<td id="l">qnac를 아예 만들지 않아 css를 그만하고 싶어도 그만 둘 수가 없어요..진심으로 죄송합니다.</td>
							</tr>
						</table>
					</div>

					<textarea id="t" cols="100" rows="2" placeholder="제목을 입력해 주세요"></textarea>
					<textarea id="c" cols="100" rows="20" placeholder="내용을 입력해 주세요"></textarea>
					<br>
					<br>
					<button id="but" type="sumbit">답변하기</button>
					<br>
					<br>
					<br>
					<br>
				</ul>

			</nav>
		</div>
	</section>
</div>
<!-- <div class="footer">
		<div class="usMenu"></div> -->
<%@ include file="/views/common/footer.jsp"%>