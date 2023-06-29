<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List,com.smallus.review.model.vo.Review, java.text.SimpleDateFormat"%>
<%@ include file="/views/common/mainHeader.jsp"%>
<%
List<Review> reviews = (List) request.getAttribute("reviews");
%>
<div id="mainOpacity">
	<div class="i-withdrawalendtotal">
		<section class="i-tablecontent">
			<table class="i-mypageCategories">
				<tr>
					<td class="i-myInfo i-my">내정보</td>
					<td class="i-info">클래스정보</td>
					<td class="i-customerService i-cu">고객센터</td>
				</tr>
				<tr>
					<td class="i-myInfo"><a
						href="<%=request.getContextPath()%>/memberprofile.do">프로필관리</a></td>
					<td><a href="<%=request.getContextPath()%>/memberpayment.do">결제내역</a></td>
					<td class="i-customerService"><a
						href="<%=request.getContextPath()%>/admin/noticeListServlet.do">공지사항</a></td>
				</tr>
				<tr>
					<td class="i-myInfo"><a
						href="<%=request.getContextPath()%>/withdrawal.do">회원탈퇴</a></td>
					<td><a href="<%=request.getContextPath()%>/memberWishList.do">찜관리</a></td>
					<td class="i-customerService"><a
						href="<%=request.getContextPath()%>/memberInquiry.do">1:1 문의</a></td>
				</tr>
				<tr>
					<td class="i-myInfo"><a
						href="<%=request.getContextPath()%>/mypageCoupon.do">쿠폰관리</a></td>
					<td><a href="<%=request.getContextPath()%>/ajax/reviewTest.do">후기관리</a></td>
					<td class="i-customerService"><a
						href="<%=request.getContextPath()%>/ajax/qnaTest.do">Q&A</a></td>
				</tr>
			</table>
		</section>

		<div class="d-review-header" style="
    width: 70%;
    margin: auto;
    margin-top: 1%;
    margin-bottom: 1%;
">
			<h2>후기</h2>
			<!-- <select>
			<option value="클래스명">클래스명</option>
			<option value="작성일순">작성일순</option>
		</select>
		<select>
			<option value="class1">부드러운 앙금으로 빚어내는 네리끼리 화과자 </option>
			<option value="class2">베이킹 어렵지 않다! 고소하고 달콤한 마들렌 만들기</option>
		</select> -->
		</div>

		<div class="d-review-list" style="
    margin: auto;
    width: 70%;
">
			<%
			if (reviews == null || reviews.isEmpty()) {
			%>
			<div class="d-review-one">작성된 리뷰가 없습니다.</div>
			<%
			} else {
			for (Review r : reviews) {
			%>
			<hr>
			<div class="d-review-one">
				<img id="imgs"
					src="<%=request.getContextPath()%>/upload/class/<%=r.getImgPath()%>"
					width="150px" height="150px">
				<div class="d-review-table">
					<table>
						<tr>
							<td id="tr"><%=r.getMemberId()%></td>
							<td id="td"><%=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(r.getReviewDate())%></td>
						</tr>
						<tr>
							<td id="tr"><h3><%=r.getClassTitle()%></h3></td>
						</tr>
						<tr>
							<td id="tr"><h2><%=r.getReviewRating()%></h2></td>
						</tr>
						<tr>
							<td id="tr"><h4><%=r.getReviewTitle()%></h4></td>
						</tr>
						<tr>
							<td id="tr"><p><%=r.getReviewContent()%></p></td>
						</tr>
					</table>
					<button type="bottun" onclick="alert('삭제되었습니다.');">삭제</button>
				</div>
			</div>
			<%
			}
			}
			%>

		</div>
	</div>
</div>

<style>
#d-review-page {
	width: 70%;
	margin: 0 auto;
}

.d-review-one {
	width: 100%;
}

.d-review-table {
	width: 100%;
}

.d-review-one {
	margin: 20px;
	display: inline-block;
}

.d-review-table h2 {
	color: gold;
}

.d-review-table button {
	float: right;
	width: 80px;
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

#imgs {
	float: left;
	margin: 2%;
}

#tr {
	text-align: left;
	display: flex;
}

#td {
	text-align: center;
}
/* .d-review-one>*{
	border: 1px solid orange;
	} */
</style>

<%@ include file="/views/common/footer.jsp"%>