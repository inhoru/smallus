<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/mainHeader.jsp"%>
<%@ page import="com.smallus.classes.model.vo.ClassIndex" %>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common/main.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common/headrFooter.css">
<%
	List<ClassIndex> newCooking= (List)request.getAttribute("newCooking");
	List<ClassIndex> bestCooking= (List)request.getAttribute("bestCooking");
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
	<img src="<%=request.getContextPath()%>/img/category_cooking.jpg" alt="re1" title="내 손으로 작은 바..."
        onclick="location.href='<%=request.getContextPath()%>/maintoclass.do'">
</section>
<div class="h-main">
	<h2>NEW CLASS</h2>
	<section class="h-imgContainer">
		<%if(newCooking!=null && !newCooking.isEmpty()){ 
				for(ClassIndex m : newCooking){%>
				<div class="h-img-list">
					<a href="<%=request.getContextPath()%>/class/viewClassPage.do?classId=<%=m.getClasses().getClassId()%>"> <img src="<%=request.getContextPath()%>/upload/class/<%=m.getClasses().getClassThumbnail()%>">
						<h4><%=m.getClasses().getClassTitle() %></h4>
						<h5><%=m.getCategory().getCategoryTitle()%> | <%=m.getClasses().getClassAddress()%></h5>
					</a>
					<div class="h-wish-container">
						<input type="checkbox" checked="checked" id="i-favorite2"
							name="favorite-checkbox" value="favorite-button"> <label
							for="i-favorite2" class="i-container"> <svg
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"
								stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-heart">
		                            <path
									d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z">
		                            </path>
		                    </svg>
						</label>
					</div>
				</div>
				<%} 
				}%>
	</section>
	<h2>BEST CLASS</h2>
	<section class="h-imgContainer">
		<%if(bestCooking!=null && !bestCooking.isEmpty()){ 
				for(ClassIndex m : bestCooking){%>
				<div class="h-img-list">
					<a href="<%=request.getContextPath()%>/class/viewClassPage.do?classId=<%=m.getClasses().getClassId()%>"> <img src="<%=request.getContextPath()%>/upload/class/<%=m.getClasses().getClassThumbnail()%>">
						<h4><%=m.getClasses().getClassTitle() %></h4>
						<h5><%=m.getCategory().getCategoryTitle()%> | <%=m.getClasses().getClassAddress()%></h5>
					</a>
					<div class="h-wish-container">
						<input type="checkbox" checked="checked" id="i-favorite2"
							name="favorite-checkbox" value="favorite-button"> <label
							for="i-favorite2" class="i-container"> <svg
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"
								stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-heart">
		                            <path
									d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z">
		                            </path>
		                    </svg>
						</label>
					</div>
				</div>
				<%} 
				}%>
	</section>
</div>
        
<%@ include file="/views/common/footer.jsp"%>