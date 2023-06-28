<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.smallus.classes.model.vo.ClassIndex"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common/main.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common/headrFooter.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
<%
List<ClassIndex> wishClass = (List) request.getAttribute("wishClass");
List<ClassIndex> newClass = (List) request.getAttribute("newClass");
%>
<h2>NEW CLASS</h2>
<section class="h-imgContainer">
	<%
	if (newClass != null && !newClass.isEmpty()) {
		for (ClassIndex m : newClass) {
	%>
	<div class="h-img-list">
		<a
			href="<%=request.getContextPath()%>/class/viewClassPage.do?classId=<%=m.getClasses().getClassId()%>">
			<img
			src="<%=request.getContextPath()%>/upload/class/<%=m.getClasses().getClassThumbnail()%>">
			<div class="h-wish-container i-wishheart">
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
			<h4><%=m.getClasses().getClassTitle()%></h4>
			<h5><%=m.getCategory().getCategoryTitle()%>
				|
				<%=m.getClasses().getClassAddress()%></h5>
		</a>

	</div>
	<%
	}
	}
	%>
</section>

<h2>BEST CLASS</h2>
<section class="h-imgContainer">
	<%
	if (wishClass != null && !wishClass.isEmpty()) {
		for (ClassIndex m : wishClass) {
	%>
	<div class="h-img-list">
		<a
			href="<%=request.getContextPath()%>/class/viewClassPage.do?classId=<%=m.getClasses().getClassId()%>">
			<img
			src="<%=request.getContextPath()%>/upload/class/<%=m.getClasses().getClassThumbnail()%>">
			<div class="h-wish-container i-wishheart"
				style="display: flex; position: relative; bottom: 40px; margin-right: 5%; justify-content: end;">
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
			<h4><%=m.getClasses().getClassTitle()%></h4>
			<h5><%=m.getCategory().getCategoryTitle()%>
				|
				<%=m.getClasses().getClassAddress()%></h5>
		</a>

	</div>
	<%
	}
	}
	%>
</section>
