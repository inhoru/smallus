<%@page import="java.lang.ProcessHandle.Info"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/mainHeader.jsp"%>

 <div class="i-withdrawaltotal">
            <section class="i-withdrawal">
                <h2 class="i-withdrawalh2">회원탈퇴</h2>
                <div class="i-withdrawalcontent">
                    <h1>정말 small us 을 떠나실건가요?</h1>
                    <h3>회원탈퇴 신청 전 아래 사항을 확인 부탁드립니다.</h3>
                    <div class="i-withdrawalcontent-span">
                        <span>1.탈퇴 후 5일까지 고객센터를 통해 철회가 가능하며 이후에는 모든 회원 정보가 지체 없이 파기됩니다.</span>
                        <span>2.탈퇴 후 수강권, 구독권, 코칭권, 포인트, 캐시, 쿠폰 등 회원 개인이 가진 권리는 모두 소멸됩니다.</span>
                        <span>3.탈퇴 후에는 구매했던 모든 상품의 환불 처리가 불가하오니 필요한 경우 탈퇴 전에 반드시 환불 처리를 해주시`기 바랍니다.</span>
                        <span>4.배송, 교환, 반품, 구독 중인 상품이 있는 경우 탈퇴가 불가하므로 고객센터로 문의해 주시기 바랍니다.</span>
                        <span>5.탈퇴 후 커뮤니티 혹은 영상 내에 작성한 게시물과 댓글은 삭제 처리가 불가합니다.</span>
                        <span>6.휴대폰 인증을 통해 생성한 아이디가 여러 개인 경우 1개의 아이디를 탈퇴해도 다른 아이디는 계속해서 사용 가능합니다.</span>
                    </div>
                </div>
                <a href="<%=request.getContextPath()%>/withdrawalPassword.do"><button class="i-withdrawalbutton">회원탈퇴</button></a>

            </section>
        </div>
<%@ include file="/views/common/footer.jsp"%>