<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*, com.smallus.classes.model.vo.*, java.text.SimpleDateFormat,com.smallus.main.model.vo.Wish"%>
<script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
<%
Classes info = (Classes) request.getAttribute("classinfo");
List<ClassDetail> schedule = (List) request.getAttribute("classSchedule");
String classId = (String) request.getAttribute("classId");


%>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ae17cb6906cd1874ef26a94895d53fdb&libraries=services"></script>

<meta charset="utf-8">

<%@ include file="/views/common/mainHeader.jsp"%>

<%
	
			boolean isWish = false;
			if (loginMember != null) {
		List<Wish> wish = (List<Wish>) session.getAttribute("wishMember");
		for (Wish w : wish) {
			
			    if (w.getClassId().equals(classId)) {
			        isWish = true;
			        break;
			    }
			
			
		
		
		}
			}
			
%>

<div style="background-color: #FFFBF5; padding: 1%;">
	<div class="d-class-detail">
		<div class="d-detail-header">
			<div class="d-detail-img">
				<img
					src="<%=request.getContextPath()%>/upload/class/<%=info.getClassThumbnail()%>"
					width=400px height=400px>
				<!-- 이미지 등록한것 있으면 수정예정 -->
			</div>
			<div class="d-detail-main">
				<div id="d-detail-top">
					<p><%=info.getCategoryTitle()%></p>
					<div class="h-wish-container">
					<%
				if (loginMember != null) {
				%>
						<input type="checkbox" id="i-favoritee2" name="favorite-checkbox"
							value="favorite-button" class="i-wishCheck" <% if (isWish) { %>checked<% } %>> <label
							for="i-favoritee2" class="i-container"> <svg
								xmlns="http://www.w3.org/2000/svg" width="30" height="30"
								viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"
								stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-heart">
		                            <path
									d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z">
		                            </path>
		                    </svg>
						</label>
						 <input type="hidden" value="<%=info.getClassId()%>"
					class="i-classId">
					<%} %>
	
	
					</div>
				</div>

				<h2 name="classTitle"><%=info.getClassTitle()%></h2>
				<p name="hostNickname"><%=info.getHostNickname()%></p>
				<h3>
					1인
					<%=info.getClassPrice()%>원
				</h3>
				<div class="d-detail-schedule">
					<div id="d-detail-date">
						<select id="h-pselectClassDetailOption"
							onchange="selectClassDetailOption()">

							<option>시간 선택</option>

							<%
							if (schedule != null && !schedule.isEmpty()) {
								for (ClassDetail cd : schedule) {
									if (cd.getRemainingPersonnel() != 0) {
							%>
							<option name="classDetailOption"
								value="<%=cd.getClassDetailId()%>_<%=cd.getBookingTimeStart()%>_<%=cd.getBookingTimeEnd()%>_<%=cd.getRemainingPersonnel()%>">
								<%=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(cd.getBookingTimeStart())%>
								~
								<%=new SimpleDateFormat("MM-dd HH:mm").format(cd.getBookingTimeEnd())%>
								잔여인원:<%=cd.getRemainingPersonnel()%>
							</option>
							<!-- 현재 인원 추출방식은 문자열 자르기 -->
							<%
							}
							}
							} else {
							%>
							<option>선택 가능한 일정이 없습니다.</option>
							<%
							}
							%>
						</select>

					</div>
					<div id="d-detail-personnel">
						<p>인원 수</p>
						<button onclick="personMinus();">-</button>
						<p id="personnel" name="personnel">1명</p>
						<button onclick="personPlus();">+</button>
					</div>
					<div id="d-payment">
						<p id="d-payment-price" name="price">결제금액원</p>
						<input type="submit" value="결제하기" id="h-moveToPay">
					</div>
				</div>
			</div>
		</div>
		<br>
		<div class="d-detail-menu">
			<nav>
				<ul id="info2">
					<li><h2 id="infoAjax">
							상세 정보
							</h3></li>
					<hr id="h">
					<li><h2 id="reviewAjax">
							후기
							</h3></li>
					<hr id="h">
					<li><h2 id="qnaAjax">
							Q & A
							</h3></li>
				</ul>
			</nav>
		</div>
		<div class="d-dtail-ajax">
			<nav class="detail_info">
				<!-- style="font-size: 16px; font-weight: bolder; margin-left: 20%;" -->
				<ul>
					<li id="info"><p>상세 정보</p></li>
					<p id="text"><%=info.getClassDetail()%></p>
					<hr>
					<li id="info"><p>주소</p></li>
					<div id="map" style="width: 80%; height: 350px;"></div>
					<p style="font-size: 8px"><%=info.getClassAddress()%></p>
					<hr>
					<li id="info"><p>제공 사항</p></li>
					<p id="text"><%=info.getClassOffer()%></p>
					<hr>
					<li id="info"><p>유의 사항</p></li>
					<p id="text"><%=info.getClassNotice()%></p>
					<hr>
					<li id="info"><p>준비물</p></li>
					<p id="text"><%=info.getClassSupplies()%></p>
					<!-- <hr style="margin-right: 20%"> -->
				</ul>
			</nav>
		</div>
	</div>
</div>
<section id="h-paymentSectionContainer"></section>
<script>

	let personnelCount=1;
	let payment=<%=info.getClassPrice()%>*personnelCount;
	
	const personMinus=()=>{
		personnelCount=personnelCount-1;
		if(personnelCount<=0){
			alert("1명 이상만 선택 가능합니다!");
			personnelCount=1;
		}
		paymentcalcul();
	}
	const personPlus=()=>{
		personnelCount=personnelCount+1;
		let select=$("#d-detail-date>select option:selected").val();
		console.log(select);
		let maxPersonnel=select.substr(30);
		console.log(maxPersonnel);
		if(personnelCount>maxPersonnel){
			alert("신청 가능한 인원이 초과되었습니다.");
			personnelCount=maxPersonnel;
		}
		paymentcalcul();
	}
	const paymentcalcul=()=>{
		document.getElementById("personnel").innerHTML=personnelCount+"명";
		payment=<%=info.getClassPrice()%>*personnelCount;
		document.getElementById("d-payment-price").innerHTML="결제금액 "+payment+"원";
	}
	document.getElementById("d-detail-date").addEventListener("change",e=>{
		personnelCount=1;
		paymentcalcul();
	})
	
	
	$("#infoAjax").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/ajax/detailTest.do",
			//dataType:"html",
			success:function(data){
				console.log(data);
				$(".d-dtail-ajax").html(data);
				},
				error:(e,m)=>{
					console.log(e)
				}
			});
		});
	
		$("#qnaAjax").click(e=>{
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/qnaTest.do",
				success:function(data){
					console.log(data);
					$(".d-dtail-ajax").html(data);
				},
				error:(e,m)=>{
					console.log(e);
				}
			});
		});
		
		$("#reviewAjax").click(e=>{	
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/reviewTest.do",
				//dataType:"html",
				success:function(data){
					console.log(data);
					$(".d-dtail-ajax").html(data);
					},
					error:(e,m)=>{
						console.log(e)
					}
				});
			});
		// 선택한 옵션의 값 가져오기 
		let classDetailArr;
		let classDetailId;
		let classBookingTimeStart;
		let classBookingTimeEnd;
		let remainingPersonnel;
		let adssgd;
		function selectClassDetailOption(){
			let index =$("#h-pselectClassDetailOption option:selected").val();
			classDetailArr= index.split("_");
			
			// 선택내용에 따라 결제하기 버튼을 숨김
			let select=$("#d-detail-date>select option:selected").val();
			let maxPersonnel=select.substr(30);
			 if(select=="시간 선택"){
				$("#d-detail-personnel").hide() ;
				$("#d-payment").hide() ;
			}else{
				$("#d-detail-personnel").show() ;
				$("#d-payment").show() ;
			}  
			
		}
		
		let selectedClass ='<%=info%>';
		let a=selectedClass.split(",");
		let loginMember='<%=session.getAttribute("loginMember")%>'
		// 결제하기 버튼 클릭하면 로그인 분기처리 
		$("#h-moveToPay").click(e=>{
			/* console.log(loginMember); */
			let classDetailId=classDetailArr[0];
			let classBookingTimeStart=classDetailArr[1];
			let classBookingTimeEnd=classDetailArr[2];
			let remainingPersonnel=classDetailArr[3];
			
			if(loginMember=="null"){
				alert("로그인 후 결제할 수 있습니다.")
				location.replace("<%=request.getContextPath()%>/memberLoginMove.do");
			}else{
				location.assign('<%=request.getContextPath()%>/class/payment.do?id='+classDetailId+'&personnel='+personnelCount);
			}
		})
		
		
</script>
<script>
$(".i-wishCheck").change(function(e) {
	var classTitle = $(this).closest('.h-wish-container').find('.i-classId').val();
	var isChecked = $(this).is(':checked');
	console.log(classTitle);

	if (isChecked) {
		$.ajax({
			type: "get",
			url: "<%=request.getContextPath()%>/member/wishCheckAdd.do",
			data: { title: classTitle },
			success: function(data) {
				// 적용된 후의 처리 (예: 화면 업데이트)
				console.log("Wish added successfully");
			},
			error: function(r, m) {
				console.log(r);
				console.log(m);
				if (e.status == 404)
					alert("요청한 페이지가 없습니다");
			}
		});
	} else {
		$.ajax({
			type: "get",
			url: "<%=request.getContextPath()%>/member/wishCheckRemove.do",
			data: { title: classTitle },
			success: function(data) {
				// 적용된 후의 처리 (예: 화면 업데이트)
				console.log("Wish removed successfully");
			},
			error: function(r, m) {
				console.log(r);
				console.log(m);
				if (e.status == 404)
					alert("요청한 페이지가 없습니다");
			}
		});
	}
});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(37.629212933724, 127.05508971584), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
    };  

<!-- // 지도를 생성합니다  -->   
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('<%=info.getClassAddress()%>', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        /* var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;"></div>'
        });
        infowindow.open(map, marker);
 */
        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});   
</script>
<style>
/* 기본상세정보 CSS : 상세페이지 접근때부터 있어야해서 여기도 있음 */
nav.detail_info {
	font-size: 16px;
	font-weight: bolder;
	margin-left: 20%;
}

#info {
	margin: 1%;
}

#text {
	font-weight: lighter;
	font-size: 8px;
	margin: 1%
}

#address {
	width: 750px;
	height: 300px;
	margin: 1% 2%
}

hr {
	margin-right: auto;
}

#info2 {
	display: inline-flex;
	/* justify-content: center; */
	text-align: justify;
	width: 80%;
	margin: 3% 0;
}

#h {
	margin: 0 auto;
}

/* 상세페이지 전체 */
.d-class-detail {
	width: 70%;
	margin: 0 auto;
}

.d-detail-header {
	display: flex;
	margin: 15px;
}

.d-detail-header>* {
	padding: 15px;
}

.d-detail-header div {
	margin: 5px 0;
}

#d-detail-top *{
	display: flex;
}
#d-detail-personnel {
	display: flex;
}
#d-detail-top input{
display:none;}

#d-detail-personnel button {
	width: 30px;
	background-color: #F8D8D8;
	border-radius: 20px;
}

#d-payment {
	display: flex;
}

#d-payment>input {
	width: 100px;
	background-color: #F8D8D8;
	border-radius: 20px;
}

.d-class-detail div {
	/* border:1px solid red; */
	
}

.d-detail-menu nav {
	display: flex;
	justify-content: space-around;
	text-align: center;
}

.d-detail-menu ul {
	
}
.h-wish-container input:checked+label svg {
    cursor: pointer;
    fill: rgb(255, 0, 0);
    stroke:rgb(255, 0, 0);
    animation: heartButton 1s;
}

.h-wish-container input+label svg {
    cursor: pointer;
    fill: rgb(255, 255, 255);
    stroke:rgb(255, 0, 0);
    animation: heartButton 1s;
}
 #d-detail-top .h-wish-container{
	display: flex;
	justify-content: end;
	position: relative;
	margin-right: 5%;
}
</style>





<%@ include file="/views/common/footer.jsp"%>


