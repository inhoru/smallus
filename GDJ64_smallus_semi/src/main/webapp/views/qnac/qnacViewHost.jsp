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

#qnactext {
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

/* #a {
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
} \

#c {
   margin: 0 35%;
   padding-left: 10px;
   font-size: 8px;
   border-radius: 20px;
} */
#but {
	width: 80px;
	height: 25px;
	border-radius: 20px;
	margin-top: 10%;
}
</style>
<div class="qna_page">
	<section id="main">

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
		</div>
		<div id="qnactext">
			<table>
				<tr>
					<th id="l">호스트</th>
					<td id="l">2023-06-25</td>
				</tr>
				<tr>
					<td id="l">저희 매장이 좀 협소한 관계로 최대 10분만 받고있어요:)</td>
				</tr>
			</table>
			<button id="but" type="submit" onclick="alert('답변이 삭제되었습니다')">삭제하기</button>
		</div>
</div>
</div>
<!-- <div class="footer">
      <div class="usMenu"></div> -->
<%@ include file="/views/common/footer.jsp"%>