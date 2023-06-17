
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.smallus.member.model.vo.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>

</head>
<style>
/*폰트 */
@font-face {
	font-family: "GmarketSansLight";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff")
		format("woff");
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: "GmarketSansMedium";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff")
		format("woff");
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: "GmarketSansBold";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff")
		format("woff");
	font-weight: normal;
	font-style: normal;
}

div#checkId-container {
	padding: 0;
	color: #555555;
	list-style-type: none;
	text-decoration: none;
	font-family: 'GmarketSansMedium';
	margin-top: 10%;
	display: flex;
	flex-direction: column;
	align-items: center;
}

div.checkId-button {
	display: flex;
	justify-content: center;
	margin-top: 5%;
}

#i-nickNameCheck {
	border-radius: 15px;
	width: 250px;
	height: 30px;
}

.re, .cl {
	font-weight: bolder;
	width: 80px;
	height: 40px;
	border-radius: 80px;
	background: #E8D6C3;
	border: none;
	cursor: pointer;
	margin-left: 3%;
	margin-right: 3%;
}

.i-userNickname {
	
}

.i-nickCheck {
	font-family: 'GmarketSansMedium';
	margin-top: 5%;
	text-align: center;
	font-size: 12px;
}
*{
background-color: #FFFBF5;
}
</style>
<body>
	<div id="checkId-container">
		<h4>닉네임을 입력해주세요.</h4>
		<input type="text" name="nickName" id="i-nickNameCheck">
	</div>
	<div class="i-nickCheck"></div>
	<div class="checkId-button">
		<input type="button" value="사용하기" class="re">&nbsp; <input
			type="button" value="취소" class="cl" onclick="fn_close();" />
	</div>
	<script>
	/* 닫기창 */

	function fn_close(){
		window.close();
	}
	
	$("#i-nickNameCheck").keyup(e=>{
		if(e.target.value.length>=2){	
				$.ajax({
			url:"<%=request.getContextPath()%>/member/updateNickname.do",
			data:{"nickName":$(e.target).val()},
			success:function(data){
				console.log(data,typeof data);
				let msg="",color="";
				if(data=='true'){
					msg="사용가능한 닉네임입니다.";
					color="#996F51";
					
				}else{
					msg="사용불가능한 닉네임입니다.";
					color="#996F51";
				}
				$(".i-nickCheck").text(msg).css("color",color);
				console.log($("#i-nickNameCheck").val());
				
			},error:function(r,m){
				console.log(r);
				console.log(m);
			}
		});
		}else{
		let msg="",color="";
		msg="두글자이상 입력해주세요.";
		color="#996F51";
		$(".i-nickCheck").text(msg).css("color",color);	
			};
		
		});
	const btn=$(".re")	
	btn.click(e=>{
		const ivalue=($("#i-nickNameCheck").val());
		opener.document.querySelector("#i-nickName").value=ivalue;
		close();
	});

	

</script>

</body>
</html>