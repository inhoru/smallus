<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/views/common/mainHeader.jsp"%>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>./css/category/category.css"/>
</style>
    <div style="text-align: center;" id="img">
        <img src="<%=request.getContextPath()%>/img/beauty_main/beauty2.jpg" alt="re1" width="1300px" height="600px" title="내 손으로 작은 바..."
        onclick="location.href='<%=request.getContextPath()%>/maintoclass.do'">
    </div>
    
    <section id="main">
        <h2 style="font-size: 24px; margin: 3% 7%;">BEST CLASS</h2>
    <!-- ajax 통해서 넣을 예약 테이블 -->
    
    <div class="s_category_crafts" style="display: flex; justify-content: space-evenly;'">
        <div class="craft">
            <img src="<%=request.getContextPath()%>/img/beauty_main/beauty2.jpg" alt="" width="300px" height="300px" title="내 손으로 작은 바...""
            onclick="location.href='<%=request.getContextPath()%>/maintoclass.do'">
            <h5>보석 같은 비누 만들기</h5>
            <p style="font-size: 8px">뷰티 | 서울시 광진구</p>
            <p style="font-size: 8px">유리구슬 | 2023.06.15</p>
        </div>
        <div class="craft">
            <img src="<%=request.getContextPath()%>/img/beauty_main/beauty1.jpg" alt="" width="300px" height="300px" title="우리 집 반려동물..."
            onclick="location.href='<%=request.getContextPath()%>/maintoclass.do'">
            <h5>작은 꽃밭을 닮은 비누</h5>
            <p style="font-size: 8px">뷰티 | 경기도 수원시</p>
            <p style="font-size: 8px">야니얀 | 2023.06.15</p>
        </div>
        <div class="craft">
            <img src="<%=request.getContextPath()%>/img/beauty_main/beauty3.jpg" alt="" width="300px" height="300px" title="나만의 썬캐쳐 만들..."
            onclick="location.href='<%=request.getContextPath()%>/maintoclass.do'">
            <h5>하늘을 옮겨놓은 듯한 비누 만들기</h5>
            <p style="font-size: 8px">뷰티 | 서울시 광진구</p>
            <p style="font-size: 8px">비누거품 | 2023.06.15</p>
        </div>
        <div class="craft">
            <img src="<%=request.getContextPath()%>/img/beauty_main/beauty4.jpg" alt="" width="300px" height="300px"title="나만의 특별한 은반..."
            onclick="location.href='<%=request.getContextPath()%>/maintoclass.do'">
            <h5>특별한 향수 만들기</h5>
            <p style="font-size: 8px">뷰티 | 서울시 마포구</p>
            <p style="font-size: 8px">시엔 | 2023.06.15</p>
        </div>
    </div>

    <h2 style="font-size: 24px; margin: 3% 7%;">NEW CLASS</h2>
    <div class="s_category_crafts" style="display: flex; justify-content: space-evenly;">
        <div class="product">
            <img src="<%=request.getContextPath()%>/img/beauty_main/beauty5.jpg" alt="" width="300px" height="300px" title="심플하면서 특별한 ..." id="preview"
            onclick="location.href='<%=request.getContextPath()%>/maintoclass.do'">
            <h5>천연 화장품 만들기</h5>
            <p style="font-size: 8px">뷰티 | 서울시 광진구</p>
            <p style="font-size: 8px">니트에이 | 2023.06.15</p> 
        </div>
        <div class="product">
            <img src="<%=request.getContextPath()%>/img/beauty_main/beauty6.jpg" alt="" width="300px" height="300px" title="우리 집 안에 작은 ..."
            onclick="location.href='<%=request.getContextPath()%>/maintoclass.do'">
            <h5>나만의 향수 만들기</h5>
            <p style="font-size: 8px">뷰티 | 경기도 시흥시</p>
            <p style="font-size: 8px">솔메 | 2023.06.15</p>
        </div>
        <div class="product">
            <img src="<%=request.getContextPath()%>/img/beauty_main/beauty7.jpg" alt="" width="300px" height="300px" title="아기자기한 도자기 ..."
            onclick="location.href='<%=request.getContextPath()%>/maintoclass.do'">
            <h5>특별한 나만의 향수 만들기</h5>
            <p style="font-size: 8px">뷰티 | 서울시 마포구</p>
            <p style="font-size: 8px">예쁜 언니랑 | 2023.06.15</p>
        </div>
        <div class="product">
            <img src="<%=request.getContextPath()%>/img/beauty_main/beauty8.jpg" alt="" width="300px" height="300px" title="스테인 글라스로 나..."
            onclick="location.href='<%=request.getContextPath()%>/maintoclass.do'">
            <h5>천연 화장품 만들기</h5>
            <p style="font-size: 8px">뷰티 | 서울시 강동구</p>
            <p style="font-size: 8px">오월 | 2023.06.15</p> 
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