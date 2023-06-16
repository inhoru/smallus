<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/mainHeader.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>./css/category/detail.css"/>
<div class="detail">
<section id="main">
        <div class="detail_page">
			<a style="display: block; padding: 3% 20%; font-size: 8px;">공예</a>
			<h4 style="margin: 1% 20%; font-size: 32px;">스테인 글라스로 나만의 소품 만들기</h4>
			<img src="<%=request.getContextPath()%>/img/category_main/craft3.jpg" width="500" height="500" style="margin: 1px 20%">
			<input type="text" value="결제하기" width="200">
			<div class="detail_page2">
				<img src="<%=request.getContextPath()%>/img/category_main/craft2.jpg" width="245" height="245" style="margin-left:20%">
				<img src="<%=request.getContextPath()%>/img/category_main/craft8.png" width="245" height="245">
			</div>
        </div>
		<nav class="menu" style="margin: 4%;">
			<ul style="font-size: 24px; justify-content: space-evenly; display: flex;" >
				<li><a href="">상세 정보</a></li>
				<hr>
				<li><a href="">후기</a></li>
				<hr>
				<li><a href="">Q & A</a></li>
			</ul>
			<hr style="margin: 1% 10%; ">
		</nav>
		<nav class="detail_info" style="font-size: 16px; font-weight: bolder; margin-left: 20%;">
			<ul>
				<li style="margin:1%;"><a href="">상세 정보</a></li>
				<p style="font-weight: lighter; font-size: 8px; margin: 1%;">상세정보로 넣은 이미지, 정보</p>
				<hr style="margin-right: 20%">
				<li style="margin: 1%;"><a href="">주소</a></li>
				<img src="<%=request.getContextPath()%>/img/category_main/map.png" width="750" height="300" style="margin: 1% 2%;">
				<p style="font-size: 8px">서울시 노원구 월계동 광운로 2나길</p>
				<hr style="margin-right: 20%">
				<li style="margin:1%;"><a href="">제공 사항</a></li>
				<p style="font-weight: lighter; font-size: 8px; margin: 1%;">스테인 글라스 만들 때 사용하는 재료</p>
				<hr style="margin-right: 20%">
				<li style="margin: 1%;"><a href="">유의 사항</a></li>
				<p style="font-weight: lighter; font-size: 8px; margin: 1%">미세한 유리조각이 날릴 수 있으니 주의</p>
				<hr style="margin-right: 20%">
				<li style="margin: 1%;"><a href="">준비물</a></li>
				<p style="font-weight: lighter; font-size: 8px; margin:1%;">튼튼한 두 팔과 체력!!!</p>
				<hr style="margin-right: 20%">
			</ul>
		</nav>
		<nav class="epilogue" style="font-weight:bolder; margin-left: 20%;">
		<ul>
		<li style="font-size:16px; margin:1%;" ><a href="">후기</a></li>
		<hr style="margin-right: 20%">
		</ul>
		</nav>
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
		<nav class="epilogue" style="font-weight:bolder; margin-left: 20%;">
		<ul>
		<li style="font-size:16px; margin:1%;" ><a href="">Q & A </a></li>
		<hr style="margin-right: 20%">
		</ul>
		</nav>
		
    </section>
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
	margin-left: 20%
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
<%@ include file="/views/common/footer.jsp"%>