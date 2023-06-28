<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List,com.smallus.classes.model.vo.ClassIndex,com.smallus.member.model.vo.Member, com.smallus.host.model.vo.Host,com.smallus.main.model.vo.Wish"%>


<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common/main.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common/headrFooter.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
<%
List<ClassIndex> wishClass = (List) request.getAttribute("wishClass");
List<ClassIndex> newClass = (List) request.getAttribute("newClass");
Member loginMember = (Member) session.getAttribute("loginMember");
if(loginMember!=null){
List<Wish> wish = (List) session.getAttribute("wishMember");
}
%>
<h2>NEW CLASS</h2>
		<% if(loginMember!=null){
List<Wish> wish = (List) session.getAttribute("wishMember");%>

		<%for(Wish w : wish){ %>
			<input type="hidden"
			value="<%=w.getClassId()%>" class="i-classId2">
		<%} 
		}%>
<section class="h-imgContainer">
	<%
		int wcounts = 0;
	if (newClass != null && !newClass.isEmpty()) {
		for (ClassIndex m : newClass) {
	%>
	<div class="h-img-list">
		<a
			href="<%=request.getContextPath()%>/class/viewClassPage.do?classId=<%=m.getClasses().getClassId()%>">
			<img
			src="<%=request.getContextPath()%>/upload/class/<%=m.getClasses().getClassThumbnail()%>">
			<div class="h-wish-container">
				<%
				if (loginMember != null) {
				%>
				<input type="checkbox" id="i-favorite<%=wcounts%>"
					name="favorite-checkbox" value="favorite-button"
					class="i-wishCheck"> <label for="i-favorite<%=wcounts%>"
					class="i-container"> <svg
						xmlns="http://www.w3.org/2000/svg" width="24" height="24"
						viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"
						stroke-linecap="round" stroke-linejoin="round"
						class="feather feather-heart">
	                            <path
							d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z">
	                            </path>
	                    </svg>
				</label>
				<input type="hidden"
			value="<%=m.getClasses().getClassId()%>" class="i-classId">
				<%
				}
				%>
			</div>
			<h4><%=m.getClasses().getClassTitle()%></h4> 
			<h5><%=m.getCategory().getCategoryTitle()%>
				|
				<%=m.getClasses().getClassAddress()%></h5>
		</a>

	</div>
	<%
	wcounts++;
	}
	}
	%>
</section>

<h2>BEST CLASS</h2>
<section class="h-imgContainer">
	<%
		int wcount = 0;
	if (wishClass != null && !wishClass.isEmpty()) {
		for (ClassIndex m : wishClass) {
	%>
	<div class="h-img-list">
		<a
			href="<%=request.getContextPath()%>/class/viewClassPage.do?classId=<%=m.getClasses().getClassId()%>">
			<img
			src="<%=request.getContextPath()%>/upload/class/<%=m.getClasses().getClassThumbnail()%>">
			<div class="h-wish-container">
				<%
				if (loginMember != null) {
				%>

				<input type="checkbox" id="i-favorites<%=wcount%>"
					name="favorite-checkbox" value="favorite-button"> <label
					for="i-favorites<%=wcount%>" class="i-container"> <svg
						xmlns="http://www.w3.org/2000/svg" width="24" height="24"
						viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"
						stroke-linecap="round" stroke-linejoin="round"
						class="feather feather-heart">
	                            <path
							d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z">
	                            </path>
	                    </svg>
				</label>
				<%
				
				}
				%>
			</div>
			<h4><%=m.getClasses().getClassTitle()%></h4>
			<h5><%=m.getCategory().getCategoryTitle()%>
				|
				<%=m.getClasses().getClassAddress()%></h5>
		</a>

	</div>
	<%
	wcount++;
	}
	}
	%>
</section>

<script>
$(".i-wishCheck").change(e=>{
	var classTitle = $(e.target).closest('.h-img-list').find('.i-classId').val();
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

$(".i-wishCheck").change(e=>{
	var classTitle = $(e.target).closest('.h-img-list').find('.i-classId').val();
	var classId=$(".i-classId2").val();




</script>
