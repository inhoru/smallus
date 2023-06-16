<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/host/hostHeader.jsp"%>
    <!--main-->
    <div id="mainOpacity h-host-main">
        <!-- host-main reservation -->
        <section class="h-main">
            <div class="h-main-title">
                <h2>5월 예약 내역</h2>
                <!-- 예약내역 상세 페이지로 이동 -->
                <div class="h-viewList"><a href="">+</a></div>
            </div><hr>
            <div class="h-r-callendar" id="h-main-calendar">
            </div>
        </section>
        <section class="h-main h-main-rsvList">
            <div>
                <div class="h-main-title"> 
                    <h2>새로운 예약 내역</h2>
                    <!-- 예약 내역 상세 페이지로 이동 -->
                    <div class="h-viewList"><a href="<%=request.getContextPath()%>/host/rsrv.do?hostId=<%=loginHost.getHostId()%>" id="h-main-moveTo-rsv">+</a></div>
                </div>
                <hr>
                <!-- ajax 통해서 넣을 예약 테이블 -->
                <table id="h-main-rsv-tbl">
                    <tr>
                        <th>NO</th>
                        <th>클래스 이름</th>
                        <th>날짜</th>
                        <th>시간</th>
                        <th>예약 인원</th>
                        <th>잔여 인원</th>
                        <th>예약자 이름</th>
                    </tr>
                    <tr>
                        <td>r202306130751</td>
                        <td>구움과자 어쩌구</td>
                        <td>2023-05-18</td>
                        <td>15:00 - 17:00</td>
                        <td>1명</td>
                        <td>1명</td>
                        <td>최*호</td>
                    </tr>
                    <tr>
                        <td>r202306130751</td>
                        <td>구움과자 어쩌구</td>
                        <td>2023-05-18</td>
                        <td>15:00 - 17:00</td>
                        <td>1명</td>
                        <td>1명</td>
                        <td>최*호</td>
                    </tr>
                </table>
            </div>
        </section>
        <!-- host-main-calc -->
        <section class="h-main">
            <div class="h-main-title">
                <h2>월별 매출 내역</h2>
                <!-- 매출 내역 상세 페이지로 이동 -->
                <div class="h-viewList"><a href="">+</a></div>
            </div><hr>
            <div class="h-r-callendar" id="h-main-chart"></div>
        </section>
<%@ include file="/views/host/hostFooter.jsp"%>
        