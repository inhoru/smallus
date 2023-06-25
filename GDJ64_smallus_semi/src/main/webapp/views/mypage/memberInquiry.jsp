
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List,com.smallus.Inquiry.model.vo.Faq,com.smallus.Inquiry.model.vo.Inquiry"%>
<%@ include file="/views/common/mainHeader.jsp"%>
<%
List<Faq> faqList = (List) request.getAttribute("faqList");
List<Faq> faqcategorie = (List) request.getAttribute("faqcategoie");
List<Inquiry> inquiryList = (List) request.getAttribute("inquiry");
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
				<td class="i-customerService"><a href="<%=request.getContextPath()%>/memberInquiry.do">1:1 문의</a></td>
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
			<span class="i-faqCategoriesDetails">이용안내</span> <span
				class="i-faqCategoriesDetails">회원정보</span> <span
				class="i-faqCategoriesDetails">결제/환불</span> <span
				class="i-faqCategoriesDetails">호스트신청</span>

		</div>
		<%
		int count = 0;
		for (Faq f : faqList) {
			if (count == 4) {
				break;
			}
		%>
		<ul>
			<li><input type="hidden" value="<%=f.getFaqId()%>" name="faqId"
				class="i-faqId">
				<div class="i-faqContentTitle"><%=f.getFaqTitle()%></div>
				<div class="i-faqContent"><%=f.getFaqContent()%></div></li>
		</ul>
		<%
		count++;
		}
		%>





		<h3 class="i-inquiryTitle">
			1:1 문의
			<button class="i-inquirybutton"
				onclick="location.assign('<%=request.getContextPath()%>/insertInquiry.do')">글쓰기</button>
		</h3>
		<%
		if (inquiryList.isEmpty()) {
		%>
		<div class="i-nopayment">문의 내역이 없습니다.</div>
		<%
		} else {
		%>
		<table class="i-inquiryTable">
			<tr>
				<th>유형</th>
				<th>제목</th>
				<th>작성일</th>
				<th>처리상태</th>
			</tr>

			<%
			for (Inquiry i : inquiryList) {
			%>
			<tr>
				<td class="i-inquiryContent"><%=i.getBoardType()%></td>
				<td class="i-inquiryContent"><%=i.getBoardTitle()%></td>
				<td class="i-inquiryContent"><%=i.getBoardRdate()%></td>
				<%if(i.getCommentConent()==null) {%>
				<td class="i-inquiryContent"><%=i.getBoardCheck()%></td>
				<%}else{ %>
				<td class="i-inquiryContent">답변완료</td>
				<%} %>
				<td>
					<button class="i-inquiryremovebutton">삭제</button> 
					<input
							type="hidden" value="<%=i.getBoardId()%>" name="boardId"
							class="i-boardId">
				</td>
			</tr>

			<tr class="i-inquiryContentAnswer">
				<td colspan="5"><div class="i-ca">질문</div> 
				
				<%if(i.getSfRename()!=null){%>
				<img width="80px" height="80px" style=" margin-right: 90%;     margin-top: 3%;" src="<%=request.getContextPath()%>/upload/inquiry/<%=i.getSfRename() %>">	
				<%}else{%>
				<%} %>
				<br /><%=i.getBoardContent()%></div></td>
			</tr>
			<%
			if (i.getCommentConent() != null) {
			%>
			<tr class="i-tds">
				<td colspan="5">
				<div class="i-ca">답변</div> <br /> <%=i.getCommentConent() %>
				</td>
			</tr>
			<%
			}else{
				
			}
			%>


			<%
			}
			}
			%>
		</table>





	</div>
	<%
	if (inquiryList.isEmpty()) {
	%>

	<%
	} else {
	%>
	<div class="pageBar">
		<%=request.getAttribute("pageBar")%>
	</div>
	<%
	}
	%>
</div>
<script>
   

	$(".i-faqContentTitle").click(e => {
		$(e.target).next().slideToggle(0);
	
		
	})
	$(".i-inquiryremovebutton").click(e => {
		const remove = $(e.target).closest('tr').find('.i-boardId').val();
		console.log(remove);
		$.ajax({
			type:"get",
			url:"<%=request.getContextPath()%>/Inquiryremove.do?categorie=호스트신청",
			data: {remove:remove},
			success:data=>{
				$("#mainOpacity").html(data);
			},
			error:(r,m)=>{
				console.log(r);
				console.log(m);
				if(e.status==404) alert("요청한 페이지가 없습니다");
			}
		})
	});
		
	
	
	
	$(".i-inquiryContent").click(e=>{
	er=$(e.target).parent().next().slideToggle(0);
	er=$(e.target).parent().next().next().slideToggle(0);
	console.log(er);
	
	
	})
	
	$(".i-faqCategoriesDetails").click(e=>{
		const categorie=$(e.target).text();
	
			$.ajax({
				type:"get",
				url:"<%=request.getContextPath()%>/faqServlt.do",
				data: {categorie:categorie},
				success:data=>{
					$("#mainOpacity").html(data);
				},
				error:(r,m)=>{
					console.log(r);
					console.log(m);
					if(e.status==404) alert("요청한 페이지가 없습니다");
				}
			})
		});



</script>
<%@ include file="/views/common/footer.jsp"%>