<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/mainHeader.jsp"%>
<style>
div#select_container{margin-right: 15%; text-align: right;}
section#main{width:600px; margin: 0 35%; text-align:center}
div#qna a{display: block; margin: 3% 30%; font-size:24px}
table#list{width:100%;  border-collapse: collapse;  border-top: 1px solid #444444;}
table#list th, table#list td{ border-bottom: 1px solid #444444; padding: 0 auto;}
</style>
    <div id="qna" >
    	<a href="">Q & A</a>
   	</div>
   	<div id="select_container">
   	<select>
            <option value="답변 상태">답변 상태</option>
    </select>
    <select>
    	<option value="답변 완료">답변 완료</option>
        <option value="답변 대기">답변 대기</option>
    </select>
   	</div>
		<section id="main">
        	<div id="table">
        	<table id="list">
        		<tr>
        			<th>상태</th>
        			<th>클래스 이름</th>
        			<th>제목</th>
        			<th>작성일</th>
        			<th>작성자</th>
        		</tr>
        		<tr>
        		<td>답변 대기</td>
        		<td>지금 이게 맞나요?</td>
        		<td>제가 하는게 맞는지 모르겠어요ㅜㅠ</td>
        		<td>2023.06.16</td>
        		<td>이성진</td>
        	</table>
        	</div>
        </section>
<%@ include file="/views/common/footer.jsp"%>