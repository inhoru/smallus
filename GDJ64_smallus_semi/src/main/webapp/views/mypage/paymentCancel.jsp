
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
	<form name="updatePwdFrm"
			action="<%=request.getContextPath()%>/memberpaymentCancelEnd.do"
			method="post">
  <div id="checkId-container">
    <h4>정말로 취소하시겠습니까?</h4>
  </div>
  <input type="hidden" name="paymentId"
						value="<%=request.getParameter("paymentId")%>" />
  <div class="checkId-button">
    <input type="submit" value="취소하기" class="re">&nbsp;
</form>
    <input type="button" value="닫기" class="cl" onclick="fn_close();">
  </div>


<script>
 
  function fn_close() {
    window.close();
  }
</script>


</body>
</html>