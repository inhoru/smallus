
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
	
	$("#i-nickNameCheck").keyup(e => {
	    let memberNicknameReg = /^[a-zA-Z0-9가-힣]{2,}$/;
	    if (e.target.value.trim().length === 0) {
	        let msg = "두 글자 이상 입력하세요!";
	        let color = "#996F51";
	        $(".i-nickCheck").text(msg).css("color", color);
	        return; 
	    }
	    if (e.target.value.length >= 2 && memberNicknameReg.test(e.target.value)) {
	        $.ajax({
	            url: "<%=request.getContextPath()%>/member/updateNickname.do",
	            data: { "nickName": $(e.target).val() },
	            success: function (data) {
	                console.log(data, typeof data);
	                let msg = "", color = "";
	                if (data === 'true') {
	                    msg = "사용 가능한 닉네임입니다.";
	                    color = "#996F51";
	                } else {
	                    msg = "사용 불가능한 닉네임입니다.";
	                    color = "#996F51";
	                }
	                $(".i-nickCheck").text(msg).css("color", color);
	                console.log($("#i-nickNameCheck").val());
	            },
	            error: function (xhr, textStatus, errorThrown) {
	                console.log(xhr);
	                console.log(textStatus);
	                console.log(errorThrown);
	            }
	        });
	    } else {
	        let msg = "잘못된 닉네임 양식입니다. 영문, 숫자, 한글로만 입력하세요!";
	        let color = "#996F51";
	        $(".i-nickCheck").text(msg).css("color", color);
	    }
	});


	const btn = $(".re");
	btn.click(e => {
	    const ivalue = $("#i-nickNameCheck").val();
	    if ($(".i-nickCheck").text() === "잘못된 닉네임 양식입니다. 영문, 숫자, 한글로만 입력하세요!") {
	        alert("잘못된 닉네임 양식입니다. 영문, 숫자, 한글로만 입력하세요!");
	        return;
	    }
	    opener.document.querySelector("#i-nickName").value = ivalue;
	    close();
	});
	

</script>

</body>
</html>