<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/mainHeader.jsp"%>
                    <form action="<%=request.getContextPath()%>/withdrawalEnd.do">
 <div class="i-withdrawalendtotal">
            <section class="i-withdrawal">
                <h2 class="i-withdrawalendh2">회원탈퇴</h2>
                <div class="i-withdrawalendcontent">
                    <h2>비밀번호를 입력해주세요.</h2>
                    <input type="password" name="password">
                    <button class="i-withdrawalendbutton">회원탈퇴</button>
                </div>
            </section>
        </div>
                    </form>
<%@ include file="/views/common/footer.jsp"%>