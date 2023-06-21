<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypage/test.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/payment.js"></script>
<%@ page import="com.smallus.classes.model.vo.ClassDetail, com.smallus.coupon.model.vo.Coupon" %>

<%@ include file="/views/common/myHeader.jsp"%>
<div id="mainOpacity">
			<div class="h-payment-title" id="h-hide">
		    	<h2>결과 페이지</h2>
		    </div>
</div>
<script>
//bodyParser 등을 통해 body의 JSON 데이터를 파싱할 수 있는지 확인해주세요.
//관리자콘솔에서 설정한 Content-Type에 따라 다른 파서를 적용해야 할 수 있습니다.
$.ajax({
	
})
app.use(bodyParser.json());
//POST 요청을 받는 /portone-webhook
app.post("/portone-webhook", async (req, res) => {
try {
const { tx_id, payment_id } = req.body;

//1. 포트원 API를 사용하기 위한 액세스 토큰 발급 받기
const signinResponse = await axios({
url: "https://api.portone.io/v2/signin/api-key",
method: "post",
headers: { "Content-Type": "application/json" },
data: {
 api_key: '1457187584652380', // 포트원 API Key
 //api_secret:'Zr78LlYN4Mcmcvplp9w8zbd0jaQg3yvCHdSJNrIbmCqdRVt1Y2RL8endR7eX6AoJBEN5NnO13Vs6CJSz'
 console.log(data);
},
});
const { access_token } = signinResponse.data;

//2. 포트원 결제내역 단건조회 API 호출
const paymentResponse = await axios({
url: `https://api.portone.io/v2/payments/${payment_id}`,
method: "get",
// 1번에서 발급받은 액세스 토큰을 Bearer 형식에 맞게 넣어주세요.
headers: { "Authorization": "Bearer " + access_token },
});


res.status(400).send(e);
}
</script>
<%@ include file="/views/common/footer.jsp"%>
