<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/hostHeader.jsp"%>
<%@ page import="com.smallus.host.model.vo.Host"%>

<style>
table#h-main-rsv-tbl button{
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
					<td style="padding-left: 10px;text-align: left;"><select name="noticeType" id="noticeType">
							<option value="1">공지사항</option>
							<option value="2">이벤트</option>
							<option value="3">기타</option>
					</select></td>
				</tr>
				<tr>
					<td>카테고리 제목</td>
					<td style="padding-left:10px; text-align:left;"><input type="text" name="noticeTitle" id="noticeTitle" style="width:500px;"></td>
				</tr>
				<tr>
					<td colspan="2">
						<legend>상세내용</legend>
							<textarea name="noticeContent" id="noticeContent" cols="100" rows="20"></textarea>
						</td>
				</tr>
				<tr>
					<td colspan="2"><button id="m-noticeEnrollbtn">공지사항 등록</button>
					</td>
				</tr>
			</table>
		</div>
	</section>
</body>
<script>
	$("#m-noticeEnrollbtn").click(e=>{
		let noticeType=$("#noticeType").val();
		let noticeTitle=$("#noticeTitle").val();
		let noticeContent=$("#noticeContent").val();
		console.log(noticeType,noticeTitle,noticeContent);
		location.assign('<%=request.getContextPath()%>/notice/enrollNotice.do?hostId=<%=loginHost.getHostId()%>&noticeType='+noticeType+'&noticeTitle='+noticeTitle+'&noticeContent='+noticeContent);
	});
</script>
<%@ include file="/views/common/hostFooter.jsp"%>