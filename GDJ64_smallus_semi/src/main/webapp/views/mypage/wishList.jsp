<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.smallus.coupon.model.vo.Coupon"%>
<%
List<Classes> wish = (List) request.getAttribute("wishList");
%>
<%@ include file="/views/common/mainHeader.jsp"%>
<div id="mainOpacity">
	<section class="i-tablecontent">
		<table class="i-mypageCategories">
			<tr>
				<td class="i-myInfo i-my">내정보</td>
				<td class="i-info">클래스정보</td>
				<td class="i-customerService i-cu">고객센터</td>
			</tr>
			<tr>
				<td class="i-myInfo"><a href="">프로필관리</a></td>
				<td><a href="<%=request.getContextPath()%>/memberpayment.do">결제내역</a></td>
				<td class="i-customerService"><a href="">공지사항</a></td>
			</tr>
			<tr>
				<td class="i-myInfo"><a href="<%=request.getContextPath()%>/withdrawal.do">회원탈퇴</a></td>
				<td><a href="<%=request.getContextPath()%>/memberWishList.do">찜관리</a></td>
				<td class="i-customerService"><a href="<%=request.getContextPath()%>/memberInquiry.do">1:1 문의</a></td>
			</tr>
			<tr>
				<td class="i-myInfo"><a href="<%=request.getContextPath()%>/mypageCoupon.do">쿠폰관리</a></td>
				<td><a href="">후기관리</a></td>
				<td class="i-customerService"><a href="">Q&A</a></td>
			</tr>
		</table>
	</section>

		<section class="i-mypagecoupontotal">
			<div class="i-mypagecoupon">
				<h2 class="i-mypageh2">찜</h2>

				<%
				if (wish.isEmpty()) {
				%>
				<div class="i-nocoupon">찜 내역이 없습니다.</div>
				<%
				} else {
				%>
				<div class="i-wishListTotalManagement">
					<%
					int wcount = 0;
					for (Classes w : wish) {
					%>
					
					<section class="i-imgContainer i-wishContainer">
						<div class="i-img-list">
							<a href=""> <img
								src="<%=request.getContextPath()%>/img/<%=w.getClassThumbnail()%>"
								alt="no img">
								<h4 class="i-classTitle"><%=w.getClassTitle()%></h4>
								<input type="hidden" value="<%=w.getClassId()%>" class="i-classId">
								<h5>
									category |
									<%=w.getCategory().getCategoryTitle()%></h5>
							</a>
							<div class="i-wish-container i-wishheart">
								<input type="checkbox" checked="checked"
									id="i-favorite<%=wcount%>" name="favorite-checkbox"
									value="favorite-button" class="i-wishCheck"> <label
									for="i-favorite<%=wcount%>" class="i-container"> <svg
										xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="white"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-heart">
                                                    <path
											d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z">
                                                    </path>
                                                </svg>
								</label>
							</div>
						</div>
					</section>
					
					<%
					wcount++;
					}
					%>
				</div>
			</div>
			<%
			}
			%>

		</section>
		<%
		if (wish.isEmpty()) {
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
$(".i-wishCheck").change(e=>{
	var classTitle = $(e.target).closest('.i-imgContainer').find('.i-classId').val();
	var isChecked = $(e.target).is(':checked');
	if(isChecked){
		$.ajax({
			type:"get",
			url:"<%=request.getContextPath()%>/member/wishCheckAdd.do",
			 data: { title:classTitle},
			success:data=>{
				
			},
			error:(r,m)=>{
				console.log(r);
				console.log(m);
				if(e.status==404) alert("요청한 페이지가 없습니다");
			}
		})
	}else{
		$.ajax({
			type:"get",
			url:"<%=request.getContextPath()%>/member/wishCheckRemove.do",
			data: { title:classTitle},
			success:data=>{
				
			},
			error:(r,m)=>{
				console.log(r);
				console.log(m);
				if(e.status==404) alert("요청한 페이지가 없습니다");
			}
		})
	}
})






</script>


<%@ include file="/views/common/footer.jsp"%>