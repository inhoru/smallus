
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.util.List,com.smallus.Inquiry.model.vo.Faq"%>
<%@ include file="/views/common/mainHeader.jsp"%>
<%
List<Faq> faqList = (List) request.getAttribute("inquiry");
%>

<div id="mainOpacity">
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
				<td class="i-customerService"><a href="">공지사항</a></td>
			</tr>
			<tr>
				<td class="i-myInfo"><a
					href="<%=request.getContextPath()%>/withdrawal.do">회원탈퇴</a></td>
				<td><a href="<%=request.getContextPath()%>/memberWishList.do">찜관리</a></td>
				<td class="i-customerService"><a href="">1:1 문의</a></td>
			</tr>
			<tr>
				<td class="i-myInfo"><a
					href="<%=request.getContextPath()%>/mypageCoupon.do">쿠폰관리</a></td>
				<td><a href="">후기관리</a></td>
				<td class="i-customerService"><a href="">Q&A</a></td>
			</tr>
		</table>
	</section>
	<div class="i-personalinquiry">
		<h3 class="i-faqTitle">자주 묻는 질문</h3>
		<div class="i-faqCategories">
			<span class="i-faqCategoriesDetails">전체</span>
			<span class="i-faqCategoriesDetails">이용안내</span>
			<span class="i-faqCategoriesDetails">회원정보</span>
			<span class="i-faqCategoriesDetails">결제/환불</span>
			<span class="i-faqCategoriesDetails">호스트신청</span>
		
		</div>

		<%for(Faq f : faqList){ %>
		<ul>
			<li>
				<input type="hidden" value="<%=f.getFaqId()%>"
						name="faqId" class="i-faqId">
				<div class="i-faqContentTitle"><%=f.getFaqTitle() %></div>
				<div class="i-faqContent"><%=f.getFaqContent() %></div>
			</li>
		</ul>
			<%} %>
		<div class="pageBar">
			<%=request.getAttribute("pageBar")%>
		</div>



		<h3 class="i-inquiryTitle">1:1 문의</h3>
		
		<table class="i-inquiryTable">
			<tr>
				<th>유형</th>
				<th>제목</th>
				<th>작성일</th>
				<th>처리상태</th>
			</tr>
			<tr>
				<td class="i-inquiryContent">배송문의</td>
				<td class="i-inquiryContent">배송왜안옴--</td>
				<td class="i-inquiryContent">2023.04.12</td>
				<td class="i-inquiryContent">답변완료</td>
				<td><button class="i-inquiryremovebutton">삭제</button></td>
			</tr>
			<tr>
				<td colspan="5"><div class="i-inquiryContentAnswer">누구나거ㅏㅁ너아ㅣㄴ머ㅣ어마ㅣㅓㅇㄴ마ㅓ아너마언마ㅓ아너마언마ㅓ안머ㅏ언마ㅣ어ㅏㄴ미ㅓ아ㅣㄴ머ㅏ인머ㅏㅣㅇ너마ㅣㅓㅇㄴ마ㅣ어ㅣㅁ</div></td>
			</tr>
			<tr>
				<td class="i-inquiryContent">배송문의</td>
				<td class="i-inquiryContent">배송왜안옴--</td>
				<td class="i-inquiryContent">2023.04.12</td>
				<td class="i-inquiryContent">답변대기</td>
			</tr>
			<tr>
				<td colspan="5"><div class="i-inquiryContentAnswer">누ㅇㄴ마ㅓ아너마언마ㅓ아너마언마ㅓ안머ㅏ언마ㅣ어ㅏㄴ미ㅓ아ㅣㄴ머ㅏ인머ㅏㅣㅇ너마ㅣㅓㅇㄴ마ㅣ어ㅣㅁ</div></td>
			</tr>
		</table>

		
	
		
	</div>
</div>
<script>
	$(".i-faqContentTitle").click(e => {
		$(e.target).next().slideToggle(0);
	})
	$(".i-inquiryContent").click(e=>{
	er=$(e.target).parent().next().children().children().slideToggle(0);
	
	})
	
	$(".i-faqCategoriesDetails").click(e=>{
		const categorie=$(e.target).text();
		if(categorie=='전체'){
			location.assign("<%=request.getContextPath()%>/memberInquiry.do")
		}else{
			
		location.assign("<%=request.getContextPath()%>/inquirycategories.do?categorie="+categorie)
		}
	})	




</script>
<%@ include file="/views/common/footer.jsp"%>