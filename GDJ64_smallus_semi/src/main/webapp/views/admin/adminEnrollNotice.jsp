<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/admin/adminHeader.jsp"%>
<style>
table#h-main-rsv-tbl input[type=submit]{
	margin-top:10px;
	margin-bottom:10px;	
	width:24rem;
	font-weight: bold;
	background-color: #E8D6C3;
	border:0px;
	border-radius: 1rem;
	padding: 0.4rem 0.6rem;
	font-size: 1rem;
	height:50px;
	cursor:pointer;
}
section.h-main-rsvList table {
	border: 1px solid #444444;
	border-collapse: collapse;
	clear: both;
}
section.h-main table {
	width: 50%;
	margin: 1rem auto;
}
</style>
<body>
	<section class="h-main">
		<div class="h-main-title">
			<h2>공지사항 등록</h2>
		</div>
		<hr>
	</section>
	<section class="h-main h-main-rsvList">
		<div>
			<table id="h-main-rsv-tbl">
				<tr>
					<td>카테고리 종류</td>
					<td><select name="notice_type" id="" style="">
							<option>공지사항</option>
							<option>이벤트</option>
							<option>기타</option>
					</select></td>
				</tr>
				<tr>
					<td>카테고리 제목</td>
					<td><input type="text" name="notice_title" id="notice_title" style="width:500px;"></td>
				</tr>
				<tr>
					<td colspan="2">
						<legend>상세내용</legend>
							<textarea name="notice_content" id="notice_content" cols="100" rows="20"></textarea>
						</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="공지사항 등록">
					</td>
				</tr>
			</table>
		</div>
	</section>
</body>
<%@ include file="/views/host/hostFooter.jsp"%>