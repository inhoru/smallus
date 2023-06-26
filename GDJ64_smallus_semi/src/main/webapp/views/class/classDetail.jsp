<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.smallus.classes.model.vo.*, java.text.SimpleDateFormat" %>
<%
	Classes info=(Classes)request.getAttribute("classinfo");
	List<ClassDetail> schedule=(List)request.getAttribute("classSchedule");
%>
<%!
	// public int personnelCount=1;
	// int classPrice=37000;
	// 이 자료를 자바로 저장해야하는지? 자바스크립트로 저장해도 넘길수있는지?
	int wishNum=110;
	double starPoint=4.5;
%>

<%@ include file="/views/common/mainHeader.jsp"%>

<div class="d-class-detail">
	<div class="d-detail-header">
		<div class="d-detail-img">
			<img src="<%=request.getContextPath()%>/upload/class/<%=info.getClassThumbnail() %>" width=400px height=400px>
			<!-- 이미지 등록한것 있으면 수정예정 -->
		</div>
		<div class="d-detail-main">
			<div id="d-detail-top">
				<p><%=info.getCategoryTitle() %></p>
				<p>♥ 찜 <%=wishNum%> </p>
				<!-- if분기로 찜 여부 표시 -->
				<p>★ <%=starPoint %>점</p>
				<!-- 리뷰 조회해서 평균내기 -->
			</div>
			<h3><%=info.getClassTitle() %></h3>
			<h4>1인 <%=info.getClassPrice() %>원</h4>
			<div class="d-detail-schedule">
				<div id="d-detail-date">
					<select>
					<%for(ClassDetail cd : schedule){ %>
						<option><%=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(cd.getBookingTimeStart()) %> ~ <%=new SimpleDateFormat("MM-dd HH:mm").format(cd.getBookingTimeEnd()) %> 잔여인원:<%=cd.getRemainingPersonnel() %></option>
						<!-- 현재 인원 추출방식은 문자열 자르기 -->
					<%} %>
					</select> 
				</div>
				<div id="d-detail-personnel">
					<p>인원수</p>
					<button onclick="personMinus();">-</button>
					<p id="personnel">1명</p>
					<button onclick="personPlus();">+</button>
				</div>
				<div id="d-payment">
					<p id="d-payment-price">결제금액 <%=info.getClassPrice() %>원</p>
					<input type="submit" value="결제하기" id="h-moveToPay">
				</div>
			</div>
		</div>
	</div>
	<br>
	<div class="d-detail-menu">
		<nav>
			<ul>
				<li><h3 id="infoAjax">상세 정보</h3></li>
				<hr>
				<li><h3 id="reviewAjax">후기</h3></li>
				<hr>
				<li><h3 id="qnaAjax">Q & A</h3></li>
			</ul>
		</nav>
	</div>
	<div class="d-dtail-ajax">
		<nav class="detail_info">
			<!-- style="font-size: 16px; font-weight: bolder; margin-left: 20%;" -->
			<ul>
				<li id="info"><p>상세 정보</p></li>
				<p id="text"><%=info.getClassDetail() %></p>
				<hr>
				<li id="info"><p>주소</p></li>
				<img  id="address" src="<%=request.getContextPath()%>/img/category_main/map.png">
				<p style="font-size: 8px"><%=info.getClassAddress() %></p>
				<hr>
				<li id="info"><p>제공 사항</p></li>
				<p id="text"><%=info.getClassOffer() %></p>
				<hr>
				<li id="info"><p>유의 사항</p></li>
				<p id="text"><%=info.getClassNotice() %></p>
				<hr>
				<li id="info"><p>준비물</p></li>
				<p id="text"><%=info.getClassSupplies() %></p>
				<!-- <hr style="margin-right: 20%"> -->
			</ul>
		</nav>
	</div>
</div>

<script>
	let personnelCount=1;
	let payment=<%=info.getClassPrice() %>*personnelCount;
	
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
		let maxPersonnel=select.substr(29);
		console.log(maxPersonnel);
		if(personnelCount>maxPersonnel){
			alert("신청 가능한 인원이 초과되었습니다.");
			personnelCount=maxPersonnel;
		}
		paymentcalcul();
	}
	const paymentcalcul=()=>{
		document.getElementById("personnel").innerHTML=personnelCount+"명";
		payment=<%=info.getClassPrice() %>*personnelCount;
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
		let loginMember='<%=(Member) session.getAttribute("loginMember")%>';
		// 결제하기 버튼 클릭하면 로그인 분기처리 
		$("#h-moveToPay").click(e=>{
			console.log(loginMember);
			if(loginMember==null){
				location.assign('<%=request.getContextPath()%>/memberLoginMove.do');
			}else{
				$.ajax({
					url:"<%=request.getContextPath()%>/host/payment.do",
					/* header:{'Content-Type':'application/json'}, */
					//dataType:"html",
					dataType:"json",
					data:{
						
					},
					success:function(data){
						console.log(data, typeof data);
				        },
					error: function(jqXHR, textStatus, errorThrown) {
						console.log("에러 발생: " + textStatus, errorThrown);
					}
				})
			}
		})
</script>

<style>
/* 기본상세정보 CSS : 상세페이지 접근때부터 있어야해서 여기도 있음 */
	nav.detail_info{
	font-size:16px;
	font-weight: bolder;
	margin-left: 20%;
	}
	#info{
	margin: 1%;
	}
	#text{
	font-weight: lighter;
	font-size: 8px;
	margin: 1%
	}
	#address{
	width: 750px;
	height: 300px;
	margin: 1% 2%}
	hr{
	margin-right: 20%;
	}


/* 상세페이지 전체 */
	.d-class-detail{
		width:70%;
		margin : 0 auto;
	}
	.d-detail-header{
		display:flex;
		margin : 15px;
	}
	.d-detail-header>*{
		padding: 15px;
	}
	.d-detail-header div{
		margin:5px 0;
	}
	#d-detail-top{
		display:flex;
	}
	#d-detail-personnel{
		display:flex;
	}
	#d-detail-personnel button{
		width:30px;
		background-color:#F8D8D8;
		border-radius: 20px;
	}
	#d-payment{
		display:flex;
	}
	#d-payment> input{
		width:100px;
		background-color:#F8D8D8;
		border-radius: 20px;
	}
	.d-class-detail div{
		/* border:1px solid red; */
	}
	.d-detail-menu nav{
	display:flex;
	justify-content: space-around;
		text-align: center;
	}
	
	.d-detail-menu ul{

		
	}
	
</style>







<%@ include file="/views/common/footer.jsp"%>

