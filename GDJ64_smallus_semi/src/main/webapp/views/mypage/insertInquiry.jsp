<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/mainHeader.jsp"%>
<%

%>
<div id="mainOpacity">
	<section class="i-tablecontent">
		<table class="i-mypageCategories">
			<tr>
				<td class="i-myInfo i-my">내정보</td>
				<td class="i-info">클래스정보</td>
				<td class="i-customerService i-cu">고객센터</td>
			</tr>
			<tr>
				<td class="i-myInfo"><a href="">프로필관리</a></td>
				<td><a href="<%=request.getContextPath()%>/memberpayment.do">결제내역</a></td>
				<td class="i-customerService"><a href="">공지사항</a></td>
			</tr>
			<tr>
				<td class="i-myInfo"><a href="<%=request.getContextPath()%>/withdrawal.do">회원탈퇴</a></td>
				<td><a href="<%=request.getContextPath()%>/memberWishList.do">찜관리</a></td>
				<td class="i-customerService"><a href="<%=request.getContextPath()%>/memberInquiry.do">1:1 문의</a></td>
			</tr>
			<tr>
				<td class="i-myInfo"><a href="<%=request.getContextPath()%>/mypageCoupon.do">쿠폰관리</a></td>
				<td><a href="">후기관리</a></td>
				<td class="i-customerService"><a href="">Q&A</a></td>
			</tr>
		</table>
	</section>

	<style>
table#tbl-board {
	width: 100%;
	margin: 0 auto;
	border-collapse: collapse;
	padding: 0px 20px;
}

table#tbl-board th {
	width: 125px;
	border: 1px solid;
	padding: 5px 0;
	text-align: center;
}

table#tbl-board td {
	border: 1px solid;
	padding: 5px 0 5px 10px;
	text-align: left;
}
</style>
	<div class="i-personalinquiry">
		<h3 class="i-inquiryTitle">1:1 문의</h3>
		<form action="<%=request.getContextPath()%>/insertInquiryEnd.do" onsubmit="return dateForm();" method="post" enctype="multipart/form-data">
			<table id='tbl-board'>
				<tr>
					<th>회원정보</th>
					<td><input type="text" name="memberId"
						value="<%=infoMember.getMemberId()%>" disabled></td>
				</tr>
				<tr>
					<th>문의유형</th>
					<td><select  class="boardType" name="boardType">
							<option value="문의유형선택">문의유형선택</option>
							<option value="결제문의">결제문의</option>
							<option value="취소환불문의">취소환불문의</option>
							<option value="오류문의">오류문의</option>
							<option value="회원정보문의">회원정보문의</option>
							<option value="신고">신고</option>
							<option value="배송문의">배송문의</option>
					</select></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text"class="boardTitle" name="boardTitle"
						required></td>
				</tr>

				<tr>
					<th>문의 내용</th>
					<td><textarea cols="42" rows="5" 
							class="boardContent" name="boardContent"></textarea></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><input type="file" id="i-upfile" multiple>
						<div id="uploadpreview"></div></td>
				</tr>

			</table>
			<button class="i-storage" onclick="uploadFile();">등록</button>
		</form>
	</div>
	<script>
function dateForm(e) {
    const content = document.getElementsByName("boardContent")[0].value;
    const type=document.getElementsByName("boardType")[0].value;
    if (content == "") {
        alert("내용을 입력해주세요.");
        return false;
    }
    if (type == "문의유형선택") {
        alert("문의유형을 선택해주세요.");
        return false;
}
    return true;
}
$("#i-upfile").change(e=>{
	$("#uploadpreview").html('');
	const files=e.target.files;
		$.each(files,(i,f)=>{
		const reader =new FileReader();
	reader.onload=e=>{
		const img=$("<img>").attr({
			src:e.target.result,"width" :"50","height":"50"
		});
		$("#uploadpreview").append(img);
	}	
	reader.readAsDataURL(f);
		})
			
})


function uploadFile() {
  const formData = new FormData();
  const fileInput = $("#i-upfile");
  if (fileInput[0].files.length > 0) {
    for (let i = 0; i < fileInput[0].files.length; i++) {
      formData.append('file' + i, fileInput[0].files[i]);
    }
  }
  formData.append("boardType",$(".boardType :selected").val());
  formData.append("boardTitle",$(".boardTitle").val());
  formData.append("boardContent",$(".boardContent").val());
 
  $.ajax({
    url: "<%=request.getContextPath()%>/insertInquiryEnd.do",
    type: "post",
    data: formData,
    processData: false,
    contentType: false,
    success: data => {
    

    },
    error: (r, m) => {

    },
    complete: () => { 

    }
  });
};

	

    
</script>
	<%@ include file="/views/common/footer.jsp"%>