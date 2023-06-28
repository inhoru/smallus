<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
:root { -
	--btn-radius: 2rem; 
	--img-radius: 1rem; 
	--be-color: #F5E7D2; /* 연한 베이지 버튼 */ 
	--ye-color: #FBEFD3; /* 연한 노란색 버튼 */ 
	--dk-color: #E8D6C3; /*진한베이지 버튼 */ 
	--main-col-lt: #FFFCF5; /* main primary */ 
	--border-color: #F6E9DF; /*border  연한 컬러*/ 
	--font-small: 0.8rem; /* button 폰트 사이즈 */ 
	--btn-padding: 0.4rem 0.6rem; /* button padding 값 */ 
	--btn-bold: bolder;
}

.h-modalNickName, .h-modalPassword, .h-modalPhone, .h-modalEmail, .h-modalDelete {
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
	display: none;
	text-align:center;
}

 .modal-content{
	background-color: var(--main-col-lt);
	margin: 15% auto;
	width: 40%;
	text-align:center;
	padding: 2rem;
}

.modal-content button, .h-updateEmail button, .h-modalDelete button{
	background-color:var(--be-color);
	padding: var(--btn-padding);
	font-size: var(--font-small);
	border-radius: var(--btn-radius);
	border: 0;
	margin-left:1rem;
	margin-top:2rem;
}
.modal-content table{
	width: 100%;
	display:flex;
	justify-content: space-between;
}

.modal-content button:hover, .modal-content button:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
div#h-AddSchedule-calendar{
	width: 100%;
	margin: 2rem auto;
}
div#h-AddSchedule-calendar input, .h-modalInsertSchedule input {
width: 20rem; 
}
.h-ReviewTbl{
width : 100%;
}
.h-ReviewTbl * {
text-align:left;
height: 2.5rem;
}
.h-tbl-align-right {
text-align: right;}
.h-tbl-align-right button#h-deleteReview{
	width: 6rem;
	text-align: center;
	margin-right: 0;
}
    </style>
<%@ page import="com.smallus.classes.model.vo.ClassDetail, com.smallus.classes.model.vo.Classes,
	com.smallus.review.model.vo.ReviewHost
" %>
<%
	List<ReviewHost> reviews=(List)request.getAttribute("reviews");
%>
<%@ include file="/views/common/hostHeader.jsp"%>
<div id="mainOpacity h-host-main">
	 <section class="h-main h-class-sub">
     	<h2>내 클래스 후기 보기</h2>
     	<div>
			<select>
				<option value="클래스명">클래스명</option>
				<option value="작성일순">작성일순</option>
			</select>
			<select>
				<option value="class1">부드러운 앙금으로 빚어내는 네리끼리 화과자 </option>
				<option value="class2">베이킹 어렵지 않다! 고소하고 달콤한 마들렌 만들기</option>
			</select>
     	</div>
		<%if(reviews==null || reviews.isEmpty()){ %>
			<h5>등록된 후기가 없습니다</h5>
		<%}else{
			for(ReviewHost rh: reviews){%>
			<div class="h-class-list">
				<a href="">
					<img src="<%=request.getContextPath()%>/upload/class/<%=rh.getClasses().getClassThumbnail() %>">
				</a>
				<table class="h-ReviewTbl">
					<tr>
						<td colspan="3"><%=rh.getReview().getReviewId() %></td>
						<td class="h-tbl-align-right"><button id="h-deleteReview" value="<%=rh.getReview().getReviewId()%>">삭제</button></td>
					</tr>
					<tr>
						<td class="h-tbl-align-left" colspan="2">[<%=rh.getCategory().getCategoryTitle() %>] <%=rh.getClasses().getClassTitle() %></td>
						<td class="h-tbl-align-left">[수강 일] <%=rh.getClassDetail().getBookingTimeStart() %> - <%=rh.getClassDetail().getBookingTimeEnd() %></td>
						<td class="h-tbl-align-left">[수강 인원 수] <%=rh.getPayment().getClassPersonnel() %></td>
					</tr>
					<tr>
						<td colspan="2"><%=rh.getReview().getReviewTitle()%></td>
						<td class="h-tbl-align-right"><%=rh.getPayment().getMemberId() %></td>
						<td><%=rh.getReview().getReviewDate() %></td>
						<td>
							<%if(rh.getReview().getReviewRating()==5){%>★★★★★
							<%}else if(rh.getReview().getReviewRating()==4){%>★★★★
							<%}else if(rh.getReview().getReviewRating()==3) {%>★★★
							<%}else if(rh.getReview().getReviewRating()==2){%>★★
							<%}else{ %>★
							<%} %>
						</td>
					</tr>
					<tr>
						<td colspan="4"><%=rh.getReview().getReviewContent()%></td>
					</tr>
					<tr>
					</tr>
				</table>
			</div><!--end .h-class list-->
			<%} 
			}%>
	</section>
	<div class="pageBar">
		<%=request.getAttribute("pageBar")%>
	</div>
	<script>
		$(document).on("click", "#h-deleteReview", function() {
			alert("삭제 됩니다");
			let val=$("#h-deleteReview").val();
			console.log(val);
			$.ajax({
				url: "<%=request.getContextPath()%>/review/deleteReviewByHost.do",
		    	data: {
			    	"reviewId":val,
			    	},
		            success: function (data) {
		                console.log(data, typeof data);
		                alert("삭제 완료 :)")
		            },
		            error: function (xhr, textStatus, errorThrown) {
		                console.log(xhr);
		                console.log(textStatus);
		                console.log(errorThrown);
		                alert("삭제 실패 :<")
		           }
		 	});
			
		})
	</script>
<%@ include file="/views/common/hostFooter.jsp"%>
