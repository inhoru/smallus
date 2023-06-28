<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/views/common/mainHeader.jsp"%>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>./css/category/category.css"/>
<style>
div.craft{
display: felx;
justify-content: space_evenly;
}
</style>
<div id="mainOpacity" class="h-main">
<section>
	<img src="<%=request.getContextPath()%>/img/activity_main/activity6.jpg" alt="re1" title="내 손으로 작은 바..."
        onclick="location.href='<%=request.getContextPath()%>/maintoclass.do'">
</section>
<section>
	<h2>NEW CLASS</h2>
	<%-- <%if(newClass!=null && !newClass.isEmpty()){ 
			for(ClassIndex m : newClass){%>
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
			}%> --%>
	<div class="h-img-list">
			<a href=""> <img src="<%=request.getContextPath()%>/img/img-slide2-4.png" alt="no img">
				<h4>class-title</h4>
				<h5>category | location</h5>
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
</section>
    <div style="text-align: center;" id="img">
        <img src="<%=request.getContextPath()%>/img/activity_main/activity6.jpg" alt="re1" width="1300px" height="600px" title="내 손으로 작은 바..."
        onclick="location.href='<%=request.getContextPath()%>/maintoclass.do'">
    </div>
    
    <section id="main">
        <h2 style="font-size: 24px; margin: 3% 7%;">BEST CLASS</h2>
    <!-- ajax 통해서 넣을 예약 테이블 -->
    
    <div class="s_category_crafts" style="display: flex; justify-content: space-evenly;'">
        <div class="craft">
            <img src="<%=request.getContextPath()%>/img/activity_main/activity6.jpg" alt="" width="300px" height="300px" title="내 손으로 작은 바...""
            onclick="location.href='<%=request.getContextPath()%>/maintoclass.do'">
            <h5>초보도 재밌게 할 수 있는 클라이밍</h5>
            <p style="font-size: 8px">운동 | 서울시 광진구</p>
            <p style="font-size: 8px">클라이밍 동호회 | 2023.06.15</p>
        </div>
        <div class="craft">
            <img src="<%=request.getContextPath()%>/img/activity_main/activity1.jpg" alt="" width="300px" height="300px" title="우리 집 반려동물..."
            onclick="location.href='<%=request.getContextPath()%>/maintoclass.do'">
            <h5>쉽게 배우는 보드</h5>
            <p style="font-size: 8px">운동 | 경기도 수원시</p>
            <p style="font-size: 8px">우리 같이 보드타자 | 2023.06.15</p>
        </div>
        <div class="craft">
            <img src="<%=request.getContextPath()%>/img/activity_main/activity2.jpg" alt="" width="300px" height="300px" title="나만의 썬캐쳐 만들..."
            onclick="location.href='<%=request.getContextPath()%>/maintoclass.do'">
            <h5>*중급*보드 기술 배우기</h5>
            <p style="font-size: 8px">운동 | 서울시 광진구</p>
            <p style="font-size: 8px">보드 모임 | 2023.06.15</p>
        </div>
        <div class="craft">
            <img src="<%=request.getContextPath()%>/img/activity_main/activity3.jpg" alt="" width="300px" height="300px"title="나만의 특별한 은반..."
            onclick="location.href='<%=request.getContextPath()%>/maintoclass.do'">
            <h5>*초보도 가능*프리다이빙 배우기</h5>
            <p style="font-size: 8px">운동 | 서울시 마포구</p>
            <p style="font-size: 8px">free diving | 2023.06.15</p>
        </div>
    </div>

    <h2 style="font-size: 24px; margin: 3% 7%;">NEW CLASS</h2>
    <div class="s_category_crafts" style="display: flex; justify-content: space-evenly;">
        <div class="product">
            <img src="<%=request.getContextPath()%>//img/activity_main/activity4.jpg" alt="" width="300px" height="300px" title="심플하면서 특별한 ..." id="preview"
            onclick="location.href='<%=request.getContextPath()%>/maintoclass.do'">
            <h5>머메이드 다이빙 배우기</h5>
            <p style="font-size: 8px">운동 | 서울시 광진구</p>
            <p style="font-size: 8px">Mermaid | 2023.06.15</p> 
        </div>
        <div class="product">
            <img src="<%=request.getContextPath()%>/img/activity_main/activity5.jpg" alt="" width="300px" height="300px" title="우리 집 안에 작은 ..."
            onclick="location.href='<%=request.getContextPath()%>/maintoclass.do'">
            <h5>*성인* 따릉이로 자전거 배우기</h5>
            <p style="font-size: 8px">운동 | 경기도 시흥시</p>
            <p style="font-size: 8px">자전거사랑 | 2023.06.15</p>
        </div>
        <div class="product">
            <img src="<%=request.getContextPath()%>/img/activity_main/activity7.jpg" alt="" width="300px" height="300px" title="아기자기한 도자기 ..."
            onclick="location.href='<%=request.getContextPath()%>/maintoclass.do'">
            <h5>배드민턴 배우기</h5>
            <p style="font-size: 8px">운동 | 서울시 마포구</p>
            <p style="font-size: 8px">운동하는 언니들 | 2023.06.15</p>
        </div>
        <div class="product">
            <img src="<%=request.getContextPath()%>/img/activity_main/activity8.jpg" alt="" width="300px" height="300px" title="스테인 글라스로 나..."
            onclick="location.href='<%=request.getContextPath()%>/maintoclass.do'">
            <h5>테니스와 다른 매력에 스쿼시 배우기</h5>
            <p style="font-size: 8px">운동 | 서울시 강동구</p>
            <p style="font-size: 8px">옐로우짐 | 2023.06.15</p> 
        </div>
    </div>

    <h2 style="font-size: 24px; margin: 3% 7%;">ALL CLASS</h2>
    <div class="s_category_crafts" style="display: flex; justify-content: space-evenly;">
</div>

     <!-- <div id="mainOpacity">
        <section id="banner">
        </section>
        </div>  -->
        </section>
        
<%@ include file="/views/common/footer.jsp"%>