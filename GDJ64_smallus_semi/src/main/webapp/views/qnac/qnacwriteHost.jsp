<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/mainHeader.jsp"%>

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

#q {
	display: block;
	padding: 3% 25%;
	font-size: 24px;
}

#a {
	display: block;
	padding: 0 35%;
	font-size: 16px;
}

#but {
	width: 100px;
	height: 25px;
	border-radius: 20px;
	margin-top: 15%;
}
#but2{
	width: 100px;
	height: 25px;
	border-radius: 20px;
	margin-left: 50%
}
textarea {
	margin: 1% 35%;
	 font-size: 8px; 
	 border-radius: 20px; 
	 padding-left: 10px;
	
}
#to{
	display:none;
}
</style>
<div class="qna_page">
	<section id="main">
		<div class="qna">
			<a id="q">Q & A</a>
		</div>
		<div>
			<nav>
				<ul id="dtn">
					<li style="font-size: 16px; margin-left: 35%;">클래스 명: 양모펠트로
						반려동물 만들기</li>
					<div id="qnatext">
						<table>
							<tr>
								<td id="l">작성자</td>
								<td id="l">2023-06-25</td>
							</tr>
							<tr>
								<th id="l">단체 예약</th>
							</tr>
							<tr>
								<td id="l">단체예약을 좀 하고 싶은데 몇 명까지 가능하지 궁금해서 문의 남겨요~</td>
							</tr>
						</table>
						<button id="but" type="button" onclick="toreplyopen(event);">답변하기</button>
					</div>
					<!-- <textarea
						style="margin:1% 35% ;padding-left: 10px; font-size: 8px; border-radius: 20px; "
						cols="100" rows="2" placeholder="   제목을 입력해 주세요"></textarea> -->
					<div id="to">
						<a id="a">답변</a>
						<textarea cols="100" rows="20" placeholder="내용을 입력해 주세요"></textarea>
					<button id="but2" type="button" onclick="alert('답변등록 완료');">등록하기</button>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
				</ul>
			</nav>
		</div>
	</section>
	<script>
		function toreplyopen(e){
			$("#to").toggle();
		}
	</script>
</div>
<!-- <div class="footer">
		<div class="usMenu"></div> -->
<%@ include file="/views/common/footer.jsp"%>