<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/hostHeader.jsp"%>
<%@ page import="com.smallus.host.model.vo.Host"%>

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
		<form action='<%=request.getContextPath()%>/notice/enrollNotice.do' method="post" enctype="multipart/form-data">
			<table id="h-main-rsv-tbl">
				<tr>
					<th>카테고리 종류</th>
					<td style="padding-left: 10px;text-align: left;">
					<select name="noticeType" id="noticeType">
							<option value="1">공지사항</option>
							<option value="2">이벤트</option>
							<option value="3">기타</option>
					</select></td>
					<td><input type="hidden" name="hostId" value="<%=loginHost.getHostId()%>"></td>
				</tr>
				<tr>
					<th>카테고리 제목</th>
					<td style="padding-left:10px; text-align:left;"><input type="text" name="noticeTitle" id="noticeTitle" style="width:500px;"></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td style="padding-left:10px; text-align:left;"><input type="file" name="m-upFile" id="m-upFile"></td>
				</tr>
				<tr>
					<td colspan="2">
						<legend>상세내용</legend>
							<textarea name="noticeContent" id="noticeContent" cols="100" rows="20"></textarea>
						</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="공지사항 등록" onclick="return enrollcheck();">
					</td>
				</tr>
			</table>
		</div>
	</section>
</body>
<script>
function enrollcheck(){
	const content=$("#boardContent").val();
	if(content==""){
		return false;
	}else{
		return true;
	}
}
</script>
<%@ include file="/views/common/hostFooter.jsp"%>