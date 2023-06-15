<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/host/hostHeader.jsp"%>
<!--main-->
<div id="mainOpacity h-host-main">
	 <section class="h-main h-main-rsvList">
     	<div class="h-main-title">
     		<h2>내 클래스 보기</h2>
     			<!-- 예약 내역 상세 페이지로 이동 -->
                <div class="h-viewList"><a href="">+</a></div>
        </div><hr>
        <!-- ajax 통해서 넣을 예약 테이블 -->
				<div class="h-class-list">
					<a href="">
						<img src="<%=request.getContextPath()%>/img/img-slide2-1.png">
					</a>
					<table>
						<tr>
							<th>승인 상태</th>
							<th>판매 상태</th>
							<th></th>
							<th>클래스 ID</th>
						</tr>
						<tr>
							<td colspan="4">클래스 이름</td>
						</tr>
						<tr>
							<td>신청 일</td>
							<td>YYYY-MM-DD</td>
							<td>승인 일</td>
							<td>YYYY-MM-DD</td>
						</tr>
						<tr>
							<td></td>
							<td><button>수정</button></td>
							<td><button>삭제</button></td>
							<td><button>더보기</button></td>
						</tr>
					</table>
				</div>
			</div>
	</section>
<%@ include file="/views/host/hostFooter.jsp"%>
        