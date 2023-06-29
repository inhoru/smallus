<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="d-review-page">

	<br>
	<br>

	<div class="d-review-header">
		<!-- <select>
			<option value="전체보기">전체보기</option>
			<option value="작성일순">작성일순</option>
		</select> -->
		<!-- <select>
			<option value="class1">부드러운 앙금으로 빚어내는 네리끼리 화과자 </option>
			<option value="class2">베이킹 어렵지 않다! 고소하고 달콤한 마들렌 만들기</option>
		</select> -->
	</div>

	<div class="d-review-list">
		<hr>
		<div class="d-review-one">
			<div class="d-review-table">
				<table>
					<tr>
						<td><h2>★★★★★</h2></td>
					</tr>
					<tr id=time>
						<td>작성자</td>
						<td>2023-06-15 19:50</td>
					</tr>
					<!-- <tr>
					</tr> -->
					<tr>
						<td><h3>너무 재밌어용ㅎㅎ</h3></td>
					</tr>
					<tr>
						<td><p>친구 생일 선물로 만들어 줬는데 너무 이쁘다고 하더라구요. 너무 좋아해줘서 뿌듯했어요:)다음에는 다른 것도 만들러 갈려고요ㅎㅎ</p></td>
					</tr>
				</table>
			</div>
		</div>

		<hr>
		<div class="d-review-one">
			<div class="d-review-table">
				<table>
					<tr>
						<td><h2>★★★★★</h2></td>
					</tr>
					<tr id=time>
						<td>작성자</td>
						<td>2023-06-15 19:50</td>
					</tr>
					<!-- <tr>
				</tr> -->
					<tr>
						<td><h3>너무 재밌어용ㅎㅎ</h3></td>
					</tr>
					<tr>
						<td><p>친구 생일 선물로 만들어 줬는데 너무 이쁘다고 하더라구요. 너무 좋아해줘서 뿌듯했어요:)다음에는 다른 것도 만들러 갈려고요ㅎㅎ</p></td>
					</tr>
				</table>
			</div>
		</div>

		<hr>
		<div class="d-review-one">
			<div class="d-review-table">
				<table>
					<tr>
						<td><h2>★★★★★</h2></td>
					</tr>
					<tr id="time">
						<td >작성자</td>
						<td>2023-06-15 19:50</td>
					</tr>
					<!-- <tr>
				</tr> -->
					<tr>
						<td><h3>너무 재밌어용ㅎㅎ</h3></td>
					</tr>
					<tr>
						<td><p>친구 생일 선물로 만들어 줬는데 너무 이쁘다고 하더라구요. 너무 좋아해줘서 뿌듯했어요:)다음에는 다른 것도 만들러 갈려고요ㅎㅎ</p></td>
					</tr>
				</table>
			</div>
		</div>


	</div>
</div>
<style>
.d-review-list{
	width: 100%;
}
#d-review-page {
	width: 80%;
	}

.d-review-one {
	/* margin: 20px; */
	padding: 0 auto;
	text-align: left;
}

.d-review-table h2 {
	color: gold;
	text-align: left;
}
.d-review-table h3{
text-align: left;
}


.d-review-table button {
	justify-content: end;
	/* 삭제버튼을 오른쪽으로 빼고 싶으나.... */
}

.d-review-table table {
	margin-left: 20px;
}

.d-review-header>select {
	display: inline-block;
	overflow: hidden;
	margin: 10px;
	height: 30px;
	border-radius: 20px;

}

/* .d-review-one>* {
	border: 1px solid orange;
} */

p {
	margin-bottom: 2%
}

#time {
	display: inline;
	justify-content: left;
}
a{
display: block;}
</style>