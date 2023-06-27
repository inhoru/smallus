
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

#memberEmail {
	border-radius: 15px;
	width: 200px;
	height: 25px;
	padding-left: 5%;
}
.i-memberEmail{
	border-radius: 15px;
	width: 200px;
	height: 25px;
	padding-left: 5%;
	
}

.re, .cl {
	font-weight: bolder;
	width: 100px;
	height: 40px;
	border-radius: 80px;
	background: #E8D6C3;
	border: none;
	cursor: pointer;
	margin-left: 3%;
	margin-right: 3%;
}
.i-re{
font-weight: bolder;
	width: 100px;
	height: 30px;
	border-radius: 80px;
	background: #E8D6C3;
	border: none;
	cursor: pointer;
	margin-left: 3%;
	margin-right: 3%;}

table{
margin: 0 auto;
	border-spacing: 20px;
	font-size: 16px;
	font-weight: 900;
}

.i-nickCheck {
	font-family: 'GmarketSansMedium';
	margin-top: 5%;
	text-align: center;
	font-size: 12px;
}

* {
	background-color: #FFFBF5;
}
</style>
<body>
<div id="checkId-container" >
	<table>
		<tr>
			<th>이메일</th>
			<td><input type="email" placeholder="abcde@naver.com"
				name="memberEmail" id="memberEmail"></td>
			<td><input type="button" name="memberEmail_check"
				id="memberEmail_check" class="i-re" value="인증번호발송" onclick="mailSend();">
				<span style="display: none; color: red" id="m-timer">180</span></td>
		</tr>
		<tr>
			<th>이메일인증번호</th>
			<td><input type="text" name="memberEmail_check2"
				id="memberEmail_check2" class="i-memberEmail"></td>
			<td><input type="button" name="" value="인증"
				onclick="emailcheck();" class="i-re"> <input type="hidden"
				name="memberEmail_check3" id="memberEmail_check3"></td>
		</tr>

	</table>
	
	</div>
	<div class="checkId-button">
		<input type="button" value="사용하기" class="re">&nbsp; <input
			type="button" value="취소" class="cl" onclick="fn_close();" />
	</div>
	<script>
	/* 닫기창 */

	function fn_close(){
		window.close();
	}
	
	const mailSend=()=>{
		let memberEmailReg=/\S+@\S+\.\S+/;
		let memberEmail=$("#memberEmail").val();
		//timecheck();
		if(memberEmailReg.test(memberEmail)){
			alert("인증번호를 발송했습니다.");
			$.ajax({
				url:'<%=request.getContextPath()%>/MailSendServlet.do',
				data:{memberEmail:memberEmail},
				dataType:"text",
				success: function(data){
					console.log(data);
					if(data!='null'){
						epw=data;
						$("memberEmail_check2").focus();
					}else{
						alert("유효하지 않은 메일주소입니다. 다시 시도하세요");
					}
				},
				error:(r,m,e)=>{
					console.log(r);
					console.log(m);
				}
			});
		}else{
			alert("이메일 형식이 잘못됐습니다. 메일양식을 확인해주세요");
		}
	}
	
	function emailcheck(){
		let emailcheck=$("#memberEmail_check2").val();
		console.log(emailcheck, typeof emailcheck)
		console.log(epw, typeof epw);
		if(epw==emailcheck){
			$("#memberEmail_check3").val('Y');
			alert("인증성공하셨습니다.");
		}else{
			$("#memberEmail_check3").val('N');
			alert("인증번호를 다시 확인해주세요.");
		}
	}
	
	const emailcheck2=()=>{
		let val=$("#memberEmail_check3").val();
		console.log(val);
		if(val=='Y'){
			return true;
		}else{
			alert("이메일 인증을 진행해주세요^^");
			return false;
		}
	}
	

	
	const btn=$(".re")	
	btn.click(e=>{
		let val=$("#memberEmail_check3").val();
		if(val=='Y'){		
		const ivalue=($("#memberEmail").val());
		opener.document.querySelector("#i-email").value=ivalue;
		close();
		}else{
			alert("이메일 인증을 진행해주세요^^");
		}
	});

	

</script>

</body>
</html>