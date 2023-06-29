<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#qnatext {
	border: 1px solid #444444;
	margin: 1% 20%;
	border-radius: 20px;
	width: 650px;
	display: none;
	justify-content: center;
}

#qnactext {
	border: 1px solid #444444;
	margin: 1% 20%;
	border-radius: 20px;
	width: 650px;
	display: none;
	justify-content: center;
}
#a{
	margin: 1% auto;	
	width: 650px;
	justify-content:center;
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
	margin: 0 auto;
	text-align: center
}

table{
	width: 100%;
	border-collapse: collapse;
	border-top: 1px solid #444444;
	text-align: center;
	margin-right:100%;
}

table>tr {
	border-bottom: 1px solid #444444; 
	padding: 1% auto;
}

#tra{
	border: 1px solid #444444;
	margin: 1% 20%;
	border-radius: 20px;
	width: 650px;
	justify-content: center;
	display: none;

}
</style>
<div id="qna">
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
		<table>
			<tr>
				<th>상태</th>
				<th>클래스 이름</th>
				<th>제목</th>
				<th>작성일</th>
				<th>작성자</th>
			</tr>
			<tr id="td" oncancel="toggle(event)">
				<td>답변 대기</td>
				<td>난이도가 어떻게 되...</td>
				<td>우리 애들이랑 같이...</td>
				<td>2023.06.16</td>
				<td>이성진</td>
			</tr>
			<tr id="td" onclick="toggle(event);">
				<td>답변 완료</td>
				<td>단체 예약</td>
				<td>단체 예약을 하려고...</td>
				<td>2023.06.19</td>
				<td>나sms 유저다</td>
			</tr>

		<div>
			<table>
				<tr id="tra" onclick="toggle(event)";>
					<td id="l">율맘</td>
					<td id="l">2023-06-25</td>
					<td id="l">난이도가 어떻게 되는건지 궁금해서 질문드려용~</td>
					<td id="l">저희 애들이랑 같이 만들러 가려고 하는데 애들이 만들기엔 많이 어렵나요? 아 애들은 8살 남자아이와 5살여자아이예요~</td>
				</tr>
			</table>
		</div>
			
		<div id="qnatext" onclick="toggle(event)";>
			<table>
				<tr id="a">
					<td id="l">작성자</td>
					<td id="l">2023-06-25</td>
				</tr>
				<tr>
					<td id="l">단체 예약</td>
				</tr>
				<tr>
					<td id="l">단체예약을 좀 하고 싶은데 몇 명까지 가능하지 궁금해서 문의 남겨요~</td>
				</tr>
			</table>
		</div>
		<div id="qnactext" onclick="toggle(event)";>
			<table>
				<tr id="a">
					<th id="l">호스트</th>
					<td id="l">2023-06-25</td>
				</tr>
				<tr>
					<td id="l">저희 매장이 좀 협소한 관계로 최대 10분만 받고있어요:)</td>
				</tr>
			</table>
		</div>
<script>
	function toggle(e) {
		$("#tra").toggle(show);	
}
	
	function toggle(e) {
		$("#qnatext").toggle();
		$("#qnactext").toggle();
		
	}
	</script>
</section>