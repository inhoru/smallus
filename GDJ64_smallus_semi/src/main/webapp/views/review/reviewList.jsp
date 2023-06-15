<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/host/hostHeader.jsp"%>

<div id="d-review-page">
	<h2>내 클래스에 등록된 후기</h2>
	<div class="d-review-list">
		<hr>
		<div class="d-review-one">
			<img src="<%=request.getContextPath()%>/img/img-slide2-1.png"
				width="150px" height="150px">
			<div class="d-review-table">
			<table>
				<tr>
					<td>작성자</td>
				</tr>
				<tr>
					<td>2023-06-15 19:50</td>
				</tr>
				<tr>
					<td><h3>부드러운 앙금으로 빚어내는 네리끼리 화과자</h3></td>
				</tr>
				<tr>
					<td><h2>★★★★★</h2></td>
				</tr>
				<tr>
					<td><p>할머니 생신 선물로 만들어 드렸는데 너무 이뻐서 못 먹겠다고 하시더라구요. 너무 좋아하셔서 뿌듯했어요:)</p></td>
				</tr>
			</table>
			</div>
			<button>삭제</button>
		</div>
		<div class="d-review-list">
		<hr>
		<div class="d-review-one">
			<img src="<%=request.getContextPath()%>/img/img-slide2-1.png"
				width="150px" height="150px">
			<div class="d-review-table">
			<table>
				<tr>
					<td>작성자</td>
				</tr>
				<tr>
					<td>2023-06-15 19:50</td>
				</tr>
				<tr>
					<td><h3>부드러운 앙금으로 빚어내는 네리끼리 화과자</h3></td>
				</tr>
				<tr>
					<td><h2>★★★★★</h2></td>
				</tr>
				<tr>
					<td><p>할머니 생신 선물로 만들어 드렸는데 너무 이뻐서 못 먹겠다고 하시더라구요. 너무 좋아하셔서 뿌듯했어요:)</p></td>
				</tr>
			</table>
			</div>
			<button>삭제</button>
		</div>
		<div class="d-review-list">
		<hr>
		<div class="d-review-one">
			<img src="<%=request.getContextPath()%>/img/img-slide2-1.png"
				width="150px" height="150px">
			<div class="d-review-table">
			<table>
				<tr>
					<td>작성자</td>
				</tr>
				<tr>
					<td>2023-06-15 19:50</td>
				</tr>
				<tr>
					<td><h3>부드러운 앙금으로 빚어내는 네리끼리 화과자</h3></td>
				</tr>
				<tr>
					<td><h2>★★★★★</h2></td>
				</tr>
				<tr>
					<td><p>할머니 생신 선물로 만들어 드렸는데 너무 이뻐서 못 먹겠다고 하시더라구요. 너무 좋아하셔서 뿌듯했어요:)</p></td>
				</tr>
			</table>
			</div>
			<button>삭제</button>
		</div>
		<div class="d-review-list">
		<hr>
		<div class="d-review-one">
			<img src="<%=request.getContextPath()%>/img/img-slide2-1.png"
				width="150px" height="150px">
			<div class="d-review-table">
			<table>
				<tr>
					<td>작성자</td>
				</tr>
				<tr>
					<td>2023-06-15 19:50</td>
				</tr>
				<tr>
					<td><h3>부드러운 앙금으로 빚어내는 네리끼리 화과자</h3></td>
				</tr>
				<tr>
					<td><h2>★★★★★</h2></td>
				</tr>
				<tr>
					<td><p>할머니 생신 선물로 만들어 드렸는데 너무 이뻐서 못 먹겠다고 하시더라구요. 너무 좋아하셔서 뿌듯했어요:)</p></td>
				</tr>
			</table>
			</div>
			<button>삭제</button>
		</div>
		
	
	</div>
</div>
<style>
	#d-review-page{
	width:70%;
	margin: 0 auto;
	display: flex;
	}
	.d-review-list>div{
	
	}
	.d-review-one{
	display:inline-flex;
	border:1px solid red;
	}
	.d-review-table h2{
	color:gold;
	}
	.d-review-table button{
	justify-content: end;
	/* 삭제버튼을 오른쪽으로 빼고 싶으나.... */
	}
	.d-review-table table{
	margin-left:20px;
	}
	
		
		
</style>

<%@ include file="/views/host/hostFooter.jsp"%>