<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/mainHeader.jsp"%>
<%@ page import="com.smallus.classes.model.vo.ClassIndex,com.smallus.main.model.vo.Wish"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common/main.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common/headrFooter.css">
<%
	List<ClassIndex> newExe= (List)request.getAttribute("newExe");
	List<ClassIndex> bestExe= (List)request.getAttribute("bestExe");
	List<ClassIndex> allExe= (List)request.getAttribute("allExe");
%>
<style>
div.craft{
display: felx;
justify-content: space_evenly;
}
.h-categoryMain{
	width: 100%;
	min-height: 600px; 
}
.h-categoryMain img{
	width:100%;
	height:500px;
	object-fit:cover;
}

</style>
<div id="mainOpacity" class="h-main">
<section class="h-categoryMain">
	<img src="<%=request.getContextPath()%>/img/category_exercise.jpg" alt="re1" title="내 손으로 작은 바..."
        onclick="location.href='<%=request.getContextPath()%>/maintoclass.do'">
</section>
<div class="h-main">
	<h2>NEW CLASS</h2>
	<h4 class="h-text">새롭게 등록된 가장 먼저 만나 보세요 ☻</h4>
	<section class="h-imgContainer">
	<%
	int wcounts = 0;
	if (newExe != null && !newExe.isEmpty()) {
		for (ClassIndex m : newExe) {
			boolean isWish = false;
			if (loginMember != null) {
		List<Wish> wish = (List<Wish>) session.getAttribute("wishMember");
		for (Wish w : wish) {
			
			    if (w.getClassId().equals(m.getClasses().getClassId())) {
			        isWish = true;
			        break;
			    }
			
			
		
		
		}
			}
		
	%>
				<div class="h-img-list">
					<a href="<%=request.getContextPath()%>/class/viewClassPage.do?classId=<%=m.getClasses().getClassId()%>"> <img src="<%=request.getContextPath()%>/upload/class/<%=m.getClasses().getClassThumbnail()%>">
					<div class="h-wish-container">
					<%
				if (loginMember != null) {
				%>
						<input type="checkbox" <% if (isWish) { %>checked<% } %> id="i-favorite<%=wcounts%>"
							name="favorite-checkbox" value="favorite-button" class="i-wishCheck"> <label
							for="i-favorite<%=wcounts%>" class="i-container"> <svg
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"
								stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-heart">
		                            <path
									d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z">
		                            </path>
		                    </svg>
						</label>
						<input type="hidden" value="<%=m.getClasses().getClassId()%>"
					class="i-classId">
						<%	
				}
				%>
					</div>
						<h4><%=m.getClasses().getClassTitle() %></h4>
						<h5><%=m.getCategory().getCategoryTitle()%> | <%=m.getClasses().getClassAddress()%></h5>
					</a>
				</div>
				<%
	wcounts++;
	}
	}
	%>
	</section>
	<h2>BEST CLASS</h2>
	<h4 class="h-text">현재 카테고리 내에서 많은 이용자가 찜한 클래스를 만나 보세요 ☻</h4>
	<section class="h-imgContainer h-cateAll">
		<%
	int wcounts1 = 0;
	if (bestExe != null && !bestExe.isEmpty()) {
		for (ClassIndex m : bestExe) {
			boolean isWish = false;
			if (loginMember != null) {
		List<Wish> wish = (List<Wish>) session.getAttribute("wishMember");
		for (Wish w : wish) {
			
			    if (w.getClassId().equals(m.getClasses().getClassId())) {
			        isWish = true;
			        break;
			    }
			
			
		
		
		}
			}
		
	%>
				<div class="h-img-list">
					<a href="<%=request.getContextPath()%>/class/viewClassPage.do?classId=<%=m.getClasses().getClassId()%>"> <img src="<%=request.getContextPath()%>/upload/class/<%=m.getClasses().getClassThumbnail()%>">
					<div class="h-wish-container">
					<%
				if (loginMember != null) {
				%>
						<input type="checkbox" <% if (isWish) { %>checked<% } %> id="i-favorite1<%=wcounts1%>"
							name="favorite-checkbox" value="favorite-button" class="i-wishCheck"> <label
							for="i-favorite1<%=wcounts1%>" class="i-container"> <svg
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"
								stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-heart">
		                            <path
									d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z">
		                            </path>
		                    </svg>
						</label>
						<input type="hidden" value="<%=m.getClasses().getClassId()%>"
					class="i-classId">
						<%	
				}
				%>
					</div>
						<h4><%=m.getClasses().getClassTitle() %></h4>
						<h5><%=m.getCategory().getCategoryTitle()%> | <%=m.getClasses().getClassAddress()%></h5>
					</a>
				</div>
				<%
	wcounts1++;
	}
	}
	%>
	</section>
	<h2>ALL CLASS</h2>
	<!-- <h4 class="h-text">현재 카테고리의 전체 클래스를 볼 수 있습니다 ☻</h4> -->
	<section class="h-imgContainer">
				<%
	int wcounts2 = 0;
	if (allExe != null && !allExe.isEmpty()) {
		for (ClassIndex m : allExe) {
			boolean isWish = false;
			if (loginMember != null) {
		List<Wish> wish = (List<Wish>) session.getAttribute("wishMember");
		for (Wish w : wish) {
			
			    if (w.getClassId().equals(m.getClasses().getClassId())) {
			        isWish = true;
			        break;
			    }
			
			
		
		
		}
			}
		
	%>
				<div class="h-img-list">
					<a href="<%=request.getContextPath()%>/class/viewClassPage.do?classId=<%=m.getClasses().getClassId()%>"> <img src="<%=request.getContextPath()%>/upload/class/<%=m.getClasses().getClassThumbnail()%>">
					<div class="h-wish-container">
					<%
				if (loginMember != null) {
				%>
						<input type="checkbox" <% if (isWish) { %>checked<% } %> id="i-favorite2<%=wcounts2%>"
							name="favorite-checkbox" value="favorite-button" class="i-wishCheck"> <label
							for="i-favorite2<%=wcounts2%>" class="i-container"> <svg
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"
								stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-heart">
		                            <path
									d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z">
		                            </path>
		                    </svg>
						</label>
						<input type="hidden" value="<%=m.getClasses().getClassId()%>"
					class="i-classId">
						<%	
				}
				%>
					</div>
						<h4><%=m.getClasses().getClassTitle() %></h4>
						<h5><%=m.getCategory().getCategoryTitle()%> | <%=m.getClasses().getClassAddress()%></h5>
					</a>
				</div>
				<%
	wcounts2++;
	}
	}
	%>
	<div class="pageBar">
		<%=request.getAttribute("pageBar") %>
	</div>
	</section>
</div>

   <script>
$(".i-wishCheck").change(function(e) {
	var classTitle = $(this).closest('.h-img-list').find('.i-classId').val();
	var isChecked = $(this).is(':checked');
	if (isChecked) {
		$.ajax({
			type: "get",
			url: "<%=request.getContextPath()%>/member/wishCheckAdd.do",
			data: { title: classTitle },
			success: function(data) {
				// 적용된 후의 처리 (예: 화면 업데이트)
				console.log("Wish added successfully");
			},
			error: function(r, m) {
				console.log(r);
				console.log(m);
				if (e.status == 404)
					alert("요청한 페이지가 없습니다");
			}
		});
	} else {
		$.ajax({
			type: "get",
			url: "<%=request.getContextPath()%>/member/wishCheckRemove.do",
			data: { title: classTitle },
			success: function(data) {
				// 적용된 후의 처리 (예: 화면 업데이트)
				console.log("Wish removed successfully");
			},
			error: function(r, m) {
				console.log(r);
				console.log(m);
				if (e.status == 404)
					alert("요청한 페이지가 없습니다");
			}
		});
	}
});
</script>
        
<%@ include file="/views/common/footer.jsp"%>