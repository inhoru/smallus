<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.smallus.review.model.vo.Review" %>
<%@ include file="/views/common/mainHeader.jsp"%>
<%
	List<Review> reviews=(List)request.getAttribute("reviews");
%>
<div id="d-review-page">

	<br><br>

	<div class="d-review-header">
		<h2>내 클래스에 등록된 후기</h2>
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
		<%if(reviews==null || reviews.isEmpty()){ %>
			<div class="d-review-one">
				작성된 리뷰가 없습니다.
			</div>
		<%} else{
			for(Review r : reviews){%>
				<hr>
				<div class="d-review-one">
					<img id="imgs" src="<%=request.getContextPath()%>/img/<%=r.getImgPath() %>"
						width="150px" height="150px">
					<div class="d-review-table">
						<table>
							<tr>
								<td  id="tr"><%=r.getMemberId() %></td>
								<td id="td"><%=r.getReviewDate() %></td>
							</tr>
							<tr>
								<td id="tr"><h3><%=r.getClassTitle() %></h3></td>
							</tr>
							<tr>
								<td id="tr"><h2><%=r.getReviewRating() %></h2></td>
							</tr>
							<tr>
								<td id="tr"><h4><%=r.getReviewTitle() %></h4></td>
						</tr>
							<tr>
								<td id="tr"><p><%=r.getReviewContent() %></p></td>
							</tr>
						</table>
					<button>삭제</button>
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
		margin:20px;
		display: inline-block;
	}
	.d-review-table h2{
	color:gold;
	}
	.d-review-table button{
	justify-content: end;
	margin-left: 95%; 
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

<%@ include file="/views/common/footer.jsp"%>