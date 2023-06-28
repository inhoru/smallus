<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.smallus.classes.model.vo.Classes"%>
<%
List<Classes> list = (List) request.getAttribute("list");
int totalData = (int) request.getAttribute("listCount");
String search=(String) request.getAttribute("search");
%>
<%@ include file="/views/common/mainHeader.jsp"%>
<div id="mainOpacity">
		
			<div class="i-mypagecoupon">
				<h2 class="i-mypageh2">'<%=search %>' 검색결과 <%=totalData %>개 </h2>

				<%
				if (list.isEmpty()) {
				%>
				<div class="i-nocoupon">검색 결과가 없습니다.</div>
				<%
				} else {
				%>
				<div class="i-wishListTotalManagement">
					<%
					int wcount = 0;
					for (Classes w : list) {
					%>
					
					<section class="i-imgContainer i-wishContainer">
						<div class="i-img-list">
							<a href=""> <img
								src="<%=request.getContextPath()%>/upload/class/<%=w.getClassThumbnail()%>"
								alt="no img">
								<h4 class="i-classTitle"><%=w.getClassTitle()%></h4>
								<input type="hidden" value="<%=w.getClassId()%>" class="i-classId">
								<h5>
									category |
									<%=w.getCategoryTitle()%></h5>
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

	
		<%
		if (list.isEmpty()) {
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





<%@ include file="/views/common/footer.jsp"%>