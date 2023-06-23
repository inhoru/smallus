<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/views/common/mainHeader.jsp"%>

<div id="d-review-page">

	<br><br>

	<div class="d-review-header">
		<h2>후기</h2>
		<select>
			<option value="클래스명">클래스명</option>
			<option value="작성일순">작성일순</option>
		</select>
		<select>
			<option value="class1">부드러운 앙금으로 빚어내는 네리끼리 화과자 </option>
			<option value="class2">베이킹 어렵지 않다! 고소하고 달콤한 마들렌 만들기</option>
		</select>
	</div>
	
	<div class="d-review-list">
		<hr>
		<div class="d-review-one">
			<img id="imgs" src="<%=request.getContextPath()%>/img/img-slide2-1.png"
				width="150px" height="150px">
			<div class="d-review-table">
				<table>
					<tr>
					<td id="td">2023-06-15 19:50</td>
					</tr>
					<tr>
						<td id="tr"><h3>부드러운 앙금으로 빚어내는 네리끼리 화과자</h3></td>
					</tr>
					<tr>
						<td id="tr"><h2>★★★★★</h2></td>
					</tr>
									<tr>
						<td id="tr"><h4>너무 재밌어용ㅎㅎ</h4></td>
					</tr>
					<tr>
						<td id="tr"><p>할머니 생신 선물로 만들어 드렸는데 너무 이뻐서 못 먹겠다고 하시더라구요. 너무 좋아하셔서 뿌듯했어요:)</p></td>
					</tr>
				</table>
			<!-- <button>삭제</button> -->
			</div>
		</div>
		
		<hr>
		<div class="d-review-one">
			<img id="imgs" src="<%=request.getContextPath()%>/img/img-slide2-1.png"
				width="150px" height="150px">
			<div class="d-review-table">
			<table>
				<tr>
					<td id="td">2023-06-15 19:50</td>
					</tr>
				<tr>
					<td id="tr"><h3>부드러운 앙금으로 빚어내는 네리끼리 화과자</h3></td>
				</tr>
				<tr>
					<td id="tr"><h2>★★★★★</h2></td>
				</tr>
				
				<tr>
						<td id="tr"><h4>너무 재밌어용ㅎㅎ</h4></td>
				</tr>
				<tr>
					<td id="tr"><p>할머니 생신 선물로 만들어 드렸는데 너무 이뻐서 못 먹겠다고 하시더라구요. 너무 좋아하셔서 뿌듯했어요:)</p></td>
				</tr>
			</table>
			<!-- <button>삭제</button> -->
			</div>
		</div>
		
		<hr>
		<div class="d-review-one">
			<img id="imgs" src="<%=request.getContextPath()%>/img/img-slide2-1.png"
				width="150px" height="150px">
			<div class="d-review-table">
			<table>
				<tr>
					<td id="td">2023-06-15 19:50</td>
					</tr>
				<tr>
					<td id="tr"><h3>부드러운 앙금으로 빚어내는 네리끼리 화과자</h3></td>
				</tr>
				<tr>
					<td id="tr"><h2>★★★★★</h2></td>
				</tr>
				<tr>
						<td id="tr"><h4>너무 재밌어용ㅎㅎ</h4></td>
				</tr>
				<tr>
					<td id="tr"><p>할머니 생신 선물로 만들어 드렸는데 너무 이뻐서 못 먹겠다고 하시더라구요. 너무 좋아하셔서 뿌듯했어요:)</p></td>
				</tr>
			</table>
			<!-- <button>삭제</button> -->
			</div>
		</div>
		
	
	</div>
</div>
<style>
	#d-review-page{
	width:70%;
	margin: 0 auto;
	}
	.d-review-one{
		margin:20px;
		display: inline-block;
	}
	.d-review-table h2{
	color:gold;
	}
	/* .d-review-table button{
	justify-content: end;
	margin-left: 95%; 
	width: 80px;
	/* 삭제버튼을 오른쪽으로 빼고 싶으나.... */
	} */
	.d-review-table table{
	margin-left:20px;
	}
	.d-review-header>select{
		display:inline-block;
		overflow: hidden;
		margin:10px;
		height: 30px;
		border-radius: 20px;
	}
	#imgs{
	float: left;
	margin: 2%;
	}
	#tr{
	text-align: left;
	display: flex;
	}
	#td{
	text-align: left;
	/* .d-review-one>*{
	border: 1px solid orange;
	} */
	
	
	
		
</style>

<%@ include file="/views/common/footer.jsp"%>