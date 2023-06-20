<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/admin/adminHeader.jsp"%>
<body>
	<section class="h-main">
		<div class="h-main-title">
		    <h2>공지사항 등록</h2>
		</div><hr>
	</section>
	<section>
		<div id="m-NoticeContainer">
			<table>
			<tr>
				<td>카테고리 종류</td>
				<td>
					<select name="notice_type" id="">
					<option>공지사항</option>
					<option>이벤트</option>
					<option>기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>카테고리 제목</td>
				<td><input type="text" name="notice_title" id="notice_title"></td>
			</tr>
			<tr>
				<td colspan="2">
					<legend>
						<textarea name="notice_content" id="notice_content" rows="30" cols="100"></textarea>
					</legend>
				</td>
				<td></td>
			</tr>
			</table>
		</div>
	</section>
</body>
<%@ include file="/views/host/hostFooter.jsp"%>