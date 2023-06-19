<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smallus.classes.model.vo.Classes" %>
<%List<Classes> classList=(List)request.getAttribute("classList"); %>
<%@ include file="/views/host/hostHeader.jsp"%>

<!--main-->
<div id="mainOpacity h-host-main">
	<!-- 내 클래스 보기 페이지 -->
	 <section class="h-main h-main-rsvList">
     	<div class="h-main-title">
     		<h2>내 클래스 보기</h2>
                <!-- <div class="h-viewList"><a href="">+</a></div> -->
                <select name="selectClassStatus" id="selectClassStatus" onchange="selectOption()">
                	<option disabled selected>승인 상태</option>
                	<option value="W">승인 대기</option>
                	<option value="Y">승인 완료</option>
                	<option value="N">승인 거절</option>
                </select>
        </div><hr>
       
        <!-- hostId를 통해서 가지고 온 클래스 리스트  -->
        <div class="h-class-list-container">
			<%if(classList!=null&&!classList.isEmpty()) {
				for(Classes c:classList){%>
				<div class="h-class-list">
					<!-- 썸네일 이미지 클릭 혹은 더보기버튼 클릭으로 상세 페이지로 이동 -->
					<a href="<%=request.getContextPath()%>/host/viewClassDetail.do?classId=<%=c.getClassId() %>" class="h-class-list-img">
						<img src="<%=request.getContextPath()%>/img/<%=c.getClassThumbnail()%>">
					</a>
					<table>
						<tr>
							<%if(c.getClassPassId().equals("W")){ %>
								<th class="h-tbl-align-left" class="h-class-pass-W">
										승인 대기
								</th>
								<th></th>
							<%}else if(c.getClassPassId().equals("N")) {%>
								<th class="h-tbl-align-left" class="h-class-pass-N">
										승인 거절
								</th>
								<th></th>
							<%} else if(c.getClassPassId().equals("Y")){%>
								<th class="h-tbl-align-left" class="h-class-pass-Y">
										승인 완료
								<th>
								<th>판매 중</th>
								<%} %> 
<%-- 								<%if(c.getClassPassId().equals("W")){ %>
									<th class="h-tbl-align-left" class="h-class-pass-W">승인 대기</th>
									<th class="h-class-pass-W"></th>
									<th class="h-tbl-align-left" class="h-class-pass-N" display="none">승인 거절</th>
									<th class="h-class-pass-N" display="none"></th>
									<th class="h-tbl-align-left" class="h-class-pass-Y" display="hidden">승인 완료<th>
									<th class="h-class-pass-Y"display="hidden" >판매 중</th>
								<%} %>
 --%>							<th colspan="2"><%=c.getClassId() %></th>
						</tr>
						<tr>
							<td class="h-tbl-align-left" colspan="4"><%=c.getClassTitle() %></td>
						</tr>
						<tr>
							<td class="h-tbl-align-left">신청 일</td>
							<td><%=c.getClassUpLoadDate() %></td>
							<td>승인 일</td>
								<%if(c.getClassPassId().equals("Y")){ %>
							<td>								
								<%= c.getClassPassDate()%>
							</td>
							<%}else{%>
							<td>-</td>
							<%} %>
						</tr>
						<tr>
							<td></td>
							<td><button>수정</button></td>
							<td><button>삭제</button></td>
							<!--이미지 클릭 혹은 더보기버튼 클릭으로 상세 페이지로 이동 -->
							<td><button>더보기</button></td>
						</tr>
					</table>
				</div>
				<%}
				}else{ %>
			<%} %>
        </div>
        <div id="gg">gg</div>
	</section>
	<script>
	
		let viewClassSub=$(".h-class-list-img");
		console.log(viewClassSub);
		// select 옵션 변경하면 옵션의 값 가져오는 함수
		function selectOption(){
			let index = $("#selectClassStatus option").index($("#selectClassStatus option:selected"));
			// index =1 -> W / 2:Y/3:N
			
			let classList= $(".h-class-list");
			let classPassW=$(".h-class-pass-W");
			//console.log(index);
			if(index==1){
				i.css('backgroundColor','red');
				//if()
				console.log(i)
				console.log(classList);
				console.log(classPassW);
			}
			
			
		}
		/* function selectOption(){
			let select=document.getElementById("selectClassStatus");
			var selectValue = select.options[select.selectedIndex].value;
			let classPassWDiv=$(".h-class-pass-W");
			let classPassDivW=document.querySelectorAll('div.h-class-list-container div.h-class-pass-W');
			let gg=document.getElementById('gg');
			if(selectValue=='W'){
				alert("W");
				//classPassWDiv.parents().find('div.h-class-list').css('display','none')
				classPassWDiv.parent().css('backgroundColor','red');
				console.log(classPassWDiv.parents());
				//console.log(classPassDivW.parentNode);
				//classList.indexOf('승인 대기')
				//classList.style.display ='none';
				gg.style.display='none';
			}else if(selectValue=='Y'){
				alert('Y')
			}	
				
		} */
			
	</script>       
<%@ include file="/views/host/hostFooter.jsp"%>
        