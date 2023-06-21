<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
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
			<tr>
				<td>답변 대기</td>
				<td>지금 이게 맞나요?</td>
				<td>제가 하는게 맞는지 모르겠어요ㅜㅠ</td>
				<td>2023.06.16</td>
				<td>이성진</td>
			</tr>
			<tr>
				<td>답변 완료</td>
				<td>어휴..</td>
				<td>오늘도 학원에 왔다</td>
				<td>2023.06.19</td>
				<td>나sms 유저다</td>
			</tr>
			<tr>
			</tr>
			<tr>
			</tr>
		</table>
	</div>
</section>