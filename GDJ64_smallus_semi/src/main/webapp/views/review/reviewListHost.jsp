<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.smallus.review.model.vo.ReviewHost" %>	
<%
	List<ReviewHost> reviews=(List)request.getAttribute("reviews");
	
%>	
<%@ include file="/views/common/hostHeader.jsp"%>

<div id="d-review-page">

	<br><br>
		
	<div class="d-review-header">
		<h2>클래스에 등록된 후기</h2>
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
		<%if(reviews==null || reviews.isEmpty()){ %>
			<div class="d-review-one">
				작성된 리뷰가 없습니다.
 			</div>
		<%} else{
			for(ReviewHost r : reviews){%>
				<hr>
				<div class="d-review-one">
					<img id="imgs" src="<%=request.getContextPath()%>/upload/class/<%=r.getClasses().getClassThumbnail()%>"
						width="150px" height="150px">
					<div class="d-review-table">
						<table>
							<tr>
								<td  id="tr"><%=r.getPayment().getMemberId() %></td>
								<td id="td"><%=r.getReview().getReviewDate() %></td>
							</tr>
							<tr>
								<td id="tr"><h3><%=r.getClasses().getClassTitle() %></h3></td>
							</tr>
							<tr>
								<td id="tr"><h2><%=r.getReview().getReviewRating() %></h2></td>
							</tr>
							<tr>
								<td id="tr"><h4><%=r.getReview().getReviewTitle() %></h4></td>
						</tr>
							<tr>
								<td id="tr"><p><%=r.getReview().getReviewContent() %></p></td>
							</tr>
						</table>
					<button type="button" onclick="alert('삭제되었습니다.')">삭제</button>
					</div>
				</div>
		<%} 
		}%>
		
	
	</div>
</div>
<style>
	#d-review-page{
	width:70%;
	margin: 0 auto;
	}
	.d-review-one{
		width:100%;
	}
	.d-review-table{
		width:100%;
	}
	.d-review-one{
		margin:20px;
		display: inline-block;
	}
	.d-review-table h2{
		color:gold;
	}
	.d-review-table button{
		float:right;
		width: 80px;
	/* 삭제버튼을 오른쪽으로 빼고 싶으나.... */
	}
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
	text-align: center;
	/* .d-review-one>*{
	border: 1px solid orange;
	} */
</style>
<%@ include file="/views/common/hostFooter.jsp"%>