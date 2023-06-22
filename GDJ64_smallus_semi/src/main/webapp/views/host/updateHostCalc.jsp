<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
			<div id="h-updateAccInfo">
				<h4>은행 명</h4>
				<select id="h-selectAccountBank">
					<option selected disabled>은행 선택
					<option value="카카오뱅크" name="hostAccountBank">카카오뱅크
					<option value="국민은행" name="hostAccountBank">국민은행
					<option value="기업은행" name="hostAccountBank">기업은행
					<option value="농협은행" name="hostAccountBank">농협은행
					<option value="신한은행" name="hostAccountBank">신한은행
					<option value="산업은행" name="hostAccountBank">산업은행
					<option value="우리은행" name="hostAccountBank">우리은행
					<option value="한국씨티은행" name="hostAccountBank">한국씨티은행
					<option value="하나은행" name="hostAccountBank">하나은행
					<option value="SC제일은행" name="hostAccountBank">SC제일은행
				</select>
				<h4>계좌 번호</h4>
				<input type="text" placeholder="계좌번호" name="hostAccount">
				<h4>예금주 명</h4>
				<input type="text" placeholder="정산 받을 예금 주 이름을 입력하세요" name="hostAccountName">
				<h4>정산 일자</h4>
				<input type="number" placeholder="정산은 신청 후 24시간 이내에 승인됩니다." name="calcReqDate">
				<button id="h-hostAccountUpdateBtn">수정</button>
			</div>
        