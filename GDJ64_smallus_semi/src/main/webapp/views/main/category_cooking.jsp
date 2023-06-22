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
    <div style="text-align: center;" id="img">
        <img src="<%=request.getContextPath()%>/img/cooking_main/cooking1.png" alt="re1" width="1300px" height="600px" title="내 손으로 작은 바..."
        onclick="location.href='<%=request.getContextPath()%>/views/class/classDetail.jsp'">
    </div>
    
    <section id="main">
        <h2 style="font-size: 24px; margin: 3% 7%;">BEST CLASS</h2>
    <!-- ajax 통해서 넣을 예약 테이블 -->
    
    <div class="s_category_crafts" style="display: flex; justify-content: space-evenly;'">
        <div class="craft">
            <img src="<%=request.getContextPath()%>/img/cooking_main/cooking1.png" alt="" width="300px" height="300px" title="내 손으로 작은 바...""
            onclick="location.href='<%=request.getContextPath()%>/views/class/classDetail.jsp'">
            <h5>쉽게 만드는 초코크림 케이크</h5>
            <p style="font-size: 8px">요리 | 서울시 광진구</p>
            <p style="font-size: 8px">초코나무숲 | 2023.06.15</p>
        </div>
        <div class="craft">
            <img src="<%=request.getContextPath()%>/img/cooking_main/cooking2.jpg" alt="" width="300px" height="300px" title="우리 집 반려동물..."
            onclick="location.href='<%=request.getContextPath()%>/views/class/classDetail.jsp'">
            <h5>플레인 마들렌 만들기</h5>
            <p style="font-size: 8px">요리 | 경기도 수원시</p>
            <p style="font-size: 8px">마드레느 | 2023.06.15</p>
        </div>
        <div class="craft">
            <img src="<%=request.getContextPath()%>/img/cooking_main/cooking3.jpg" alt="" width="300px" height="300px" title="나만의 썬캐쳐 만들..."
            onclick="location.href='<%=request.getContextPath()%>/views/class/classDetail.jsp'">
            <h5>초보도 쉽게 만들 수 있는 마카롱 만들기</h5>
            <p style="font-size: 8px">요리 | 서울시 광진구</p>
            <p style="font-size: 8px">마카롱 공장 | 2023.06.15</p>
        </div>
        <div class="craft">
            <img src="<%=request.getContextPath()%>/img/cooking_main/cooking4.jpg" alt="" width="300px" height="300px"title="나만의 특별한 은반..."
            onclick="location.href='<%=request.getContextPath()%>/views/class/classDetail.jsp'">
            <h5>내가 만들어서 더 특별한 에이드</h5>
            <p style="font-size: 8px">요리 | 서울시 마포구</p>
            <p style="font-size: 8px">시엔 | 2023.06.15</p>
        </div>
    </div>

    <h2 style="font-size: 24px; margin: 3% 7%;">NEW CLASS</h2>
    <div class="s_category_crafts" style="display: flex; justify-content: space-evenly;">
        <div class="product">
            <img src="<%=request.getContextPath()%>/img/cooking_main/cooking5.jpg" alt="" width="300px" height="300px" title="심플하면서 특별한 ..." id="preview"
            onclick="location.href='<%=request.getContextPath()%>/views/class/classDetail.jsp'">
            <h5>레터링 케이크 만들기</h5>
            <p style="font-size: 8px">요리 | 서울시 광진구</p>
            <p style="font-size: 8px">후후케이크 | 2023.06.15</p> 
        </div>
        <div class="product">
            <img src="<%=request.getContextPath()%>/img/cooking_main/cooking6.jpg" alt="" width="300px" height="300px" title="우리 집 안에 작은 ..."
            onclick="location.href='<%=request.getContextPath()%>/views/class/classDetail.jsp'">
            <h5>귀여운 동물모양 마카롱 만들기</h5>
            <p style="font-size: 8px">요리 | 경기도 시흥시</p>
            <p style="font-size: 8px">마카롱롱 | 2023.06.15</p>
        </div>
        <div class="product">
            <img src="<%=request.getContextPath()%>/img/cooking_main/cooking7.jpg" alt="" width="300px" height="300px" title="아기자기한 도자기 ..."
            onclick="location.href='<%=request.getContextPath()%>/views/class/classDetail.jsp'">
            <h5>꽃 앙금 케이크 만들기</h5>
            <p style="font-size: 8px">요리 | 서울시 마포구</p>
            <p style="font-size: 8px">케이크 만드는 언니들 | 2023.06.15</p>
        </div>
        <div class="product">
            <img src="<%=request.getContextPath()%>/img/cooking_main/cooking8.jpg" alt="" width="300px" height="300px" title="스테인 글라스로 나..."
            onclick="location.href='<%=request.getContextPath()%>/views/class/classDetail.jsp'">
            <h5>초대음식으로 좋은 요리 배우기</h5>
            <p style="font-size: 8px">요리 | 서울시 강동구</p>
            <p style="font-size: 8px">쿠킹클래스 | 2023.06.15</p> 
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