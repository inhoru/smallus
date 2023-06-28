<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ include file="/views/common/mainHeader.jsp"%> 
<style>
#qnatext {
	border: 1px solid #444444;
	margin: 1% 35%;
	border-radius: 20px;
	width: 650px;
	display: none;
	justify-content: center;
}

#qnactext {
	border: 1px solid #444444;
	margin: 1% 35%;
	border-radius: 20px;
	width: 650px;
	display: none;
	justify-content: center;
}

#l {
	text-align: left;
	padding-left: 5px;
}
div#select_container {
	margin-right: 21%;
	text-align: right;
}

section#main {
	width: 1000px;
	margin: 0 25%;
	text-align: center
}

div#qna a {
	display: block;
	margin: 3% 20%;
	font-size: 24px
}

table#list {
	width: 100%;
	border-collapse: collapse;
	border-top: 1px solid #444444;
	text-align: center;
	margin-right:100%;
}

table#list th, table#list td {
	border-bottom: 1px solid #444444;
	padding: 1% auto;
}
</style>
<div id="qna">
	<a href="">Q & A</a>
</div>
<div id="select_container">
	<select>
		<option value="답변 상태">답변 상태</option>
	</select> <select>
		<option value="답변 완료">답변 완료</option>
		<option value="답변 대기">답변 대기</option>
	</select>
</div>
<section id="main">
	<div id="table">
		<table id="list">
			<tr>
				<th>상태</th>
				<th>클래스 이름</th>
				<th>제목</th>
				<th>작성일</th>
				<th>작성자</th>
			</tr>
			<tr onclick="alert('test')">
				<td>답변 대기</td>
				<td>지금 이게 맞나요?</td>
				<td>제가 하는게 맞는지 모르겠어요ㅜㅠ</td>
				<td>2023.06.16</td>
				<td>이성진</td>
			</tr>
			<tr id="td" onclick="toggle(event);">
				<td>답변 완료</td>
				<td>어휴..</td>
				<td>오늘도 학원에 왔다</td>
				<td>2023.06.19</td>
				<td>나sms 유저다</td>
			</tr>
		</table>
		
		<div class="qna_page">
	<section id="main">
		<div id="qnatext" onclick="toggle(event)";>
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
		</div>
		<div id="qnactext" onclick="toggle(event)";>
			<table>
				<tr>
					<th id="l">호스트</th>
					<td id="l">2023-06-25</td>
				</tr>
				<tr>
					<td id="l">저희 매장이 좀 협소한 관계로 최대 10분만 받고있어요:)</td>
				</tr>
			</table>
		</div>

</div>
</div>
	<script>
	function toggle(e) {
		$("#qnatext").toggle();
		$("#qnactext").toggle();
		
	}
	</script>
	</div>
</section>
 <%@ include file="/views/common/footer.jsp"%> 