<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/host/host-header.jsp"%>
    <!--main-->
    <div id="mainOpacity h-host-main">
        <!-- menu-category -->
        <section class="h-menu">
            <div>
                <table>
                    <tr>
                        <th>호스트 관리</th>
                        <th>클래스 관리</th>
                        <th>예약 관리</th>
                        <th>고객 센터</th>
                    </tr>
                    <tr><a href=""></a>
                        <td><a href="">프로필 수정</a></td>
                        <td><a href="">내 클래스 보기</a></td>
                        <td><a href="">클래스 예약 관리</a></td>
                        <td><a href="">공지사항</a></td>
                    </tr>
                    <tr>
                        <td><a href="">회원 탈퇴</a></td>
                        <td><a href="">클래스 등록하기</a></td>
                        <td><a href="">정산 정보 관리</a></td>
                        <td><a href="">1:1 문의</a></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><a href="">Q&A 관리</a></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><a href="">후기 관리</a></td>
                    </tr>
                </table>
            </div>            
        </section>
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
                    <div class="h-viewList"><a href="">+</a></div>
                </div>
                <hr>
                <!-- ajax 통해서 넣을 예약 테이블 -->
                <table>
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
                <h2>5월 매출 내역</h2>
                <!-- 매출 내역 상세 페이지로 이동 -->
                <div class="h-viewList"><a href="">+</a></div>
            </div><hr>
            <div class="h-r-callendar" id="h-main-chart"></div>
        </section>
<%@ include file="/views/common/footer.jsp"%>
        