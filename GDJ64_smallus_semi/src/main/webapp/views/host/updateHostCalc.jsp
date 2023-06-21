<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/hostHeader.jsp"%>
<%@ page import="java.util.List, com.smallus.payment.model.vo.Payment" %>
<!--main-->
<div id="mainOpacity h-host-main">
	<section class="h-main h-calc">
     	<!-- 호스트 테이블의 정산 정보 -->
			<h2>정산 정보 관리</h2><hr>
			<table class="h-calc-tbl">
				<tr>
					<td>은행 명</td>
					<td>카카오뱅크</td>
					<td>계좌 번호</td>
					<td>3333-11-2222222</td>
					<td>예금주 명</td>
					<td>예금주</td>
					<td>정산 일</td>
					<td>매달 1일</td>
					<td><button onclick="location.assign('<%=request.getContextPath() %>/host/updateAccount.do')">수정</button></td>
				</tr>
			</table>
	</section>
	<!-- main -->
	<section class="h-main h-main-rsvList">
		<div class="h-main-title">
			<h2>새로운 예약 내역</h2>
	    </div>
	        <hr>
			<div class="h-r-callendar" id="h-main-chart"></div>
                <table id="h-main-rsv-tbl">
                    <tr>
                    	<th>NO</th>
                        <th>결제 번호</th>
                        <th>클래스 이름</th>
                        <th>날짜</th>
                        <th>예약자 아이디</th>
                        <th>예약 인원</th>
                    </tr>
                    <!-- P.PAYMENT_ID, C.CLASS_TITLE, CD.BOOKING_TIME_START, CD.BOOKING_TIME_END, P.MEMBER_ID -->
		                    <tr>
	                   		</tr>
                    
                    <tr>
                        <td colspan="5">조회된 예약이 없습니다.</td>
                    </tr>
                </table>
            </div>
        </section>
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    
    </script>
    <script src="<%=request.getContextPath() %>/js/host.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<%@ include file="/views/common/hostFooter.jsp"%>


        