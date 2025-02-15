<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/mainHeader.jsp"%>

<%@ page import="com.smallus.classes.model.vo.ClassIndex"%>



<script>
	  $.ajax({
		url:"<%=request.getContextPath()%>/mainPage.do",
		dataType: 'html',
		success: data =>{
				
			console.log(data);
			$("#hMainNew").html(data);
				
			},
			error: (r, m, e) => {
				console.log(r);
				console.log(m);
			}

		}); 
	  
</script>

<div id="mainOpacity" class="h-main">
	<!-- main 배너 -->
	<div class="h-main-slide-container" id="hmain">
		<div class="slides fade">
			<img src="<%=request.getContextPath()%>/img/main-img0.jpg" style="width: 100%" id="h-craft">
			<div class="slide-text">Craft</div>
		</div>

		<div class="slides fade">
			<img src="<%=request.getContextPath()%>/img/main-img2.jpg" style="width: 100%" id="h-beauty">
			<div class="slide-text">Beauty</div>
		</div>

		<div class="slides fade">
			<img src="<%=request.getContextPath()%>/img/main-img3.jpg" style="width: 100%" id="h-activity">
			<div class="slide-text">Activity</div>
		</div>
		<div class="slides fade">
			<img src="<%=request.getContextPath()%>/img/main-img4.jpg" style="width: 100%" id="h-cooking">
			<div class="slide-text">Cooking</div>
		</div>

		<!-- Next and previous buttons -->
		<a class="prev" onclick="plusSlides(-1)"><img src="<%=request.getContextPath()%>/img/prev.svg"></a>
		<a class="next" onclick="plusSlides(1)"><img src="<%=request.getContextPath()%>/img/next.svg"></a>
	</div>
	<br>
	<!-- The dots/circles -->
	<div style="text-align: center">
		<span class="dot" onclick="currentSlide(1)"></span> <span class="dot"
			onclick="currentSlide(2)"></span> <span class="dot"
			onclick="currentSlide(3)"></span> <span class="dot"
			onclick="currentSlide(4)"></span>
	</div>

	<!-- img-slide 2 -->
	<section class="h-main-sec2">
		<div class="text">
			<span>나의 첫 베이킹</span> 인기 베이킹 클래스
			<!--baking 카테고리에서 베스트 인 메뉴 상위 노출/ 아래에 베이킹 카테고리 출력-->
			<button name="h-best-baking-class" onclick="hViewCookingCategory()">바로가기</button>
		</div> 
		
		<ul class="h-gallery">
			<li class="h-img-slider2"><a href="<%=request.getContextPath()%>/class/viewClassPage.do?classId=CLA1000"><img src="<%=request.getContextPath()%>/img/img-slide2-1.png" class="sImg"></a></li>
			<li class="h-img-slider2"><a href="<%=request.getContextPath()%>/class/viewClassPage.do?classId=CLA1040"><img src="<%=request.getContextPath()%>/img/img-slide2-2.png" class="sImg"></a></li>
			<li class="h-img-slider2"><a href="<%=request.getContextPath()%>/class/viewClassPage.do?classId=CLA1037"><img src="<%=request.getContextPath()%>/img/img-slide2-3.png" class="sImg"></a></li>
			<li class="h-img-slider2"><a href="<%=request.getContextPath()%>/class/viewClassPage.do?classId=CLA1028"><img src="<%=request.getContextPath()%>/img/img-slide2-4.png" class="sImg"></a></li>
		</ul>
	</section>
	<!-- 광고 배너 -->
	<section class="h-main-banner">
		<div class="h-banner-container">
			<div class="h-banner-area">
				<a href="<%=request.getContextPath()%>/memberLoginMove.do">
					<div>
						<h3>신규 가입 5000원 할인 쿠폰 지급</h3>
						<button name="enroll" id="enroll" onclick="fn_login()">가입하기</button>
					</div> <img src="<%=request.getContextPath()%>/img/main-banner-coupon.svg">
				</a>
			</div>
			<div class="h-banner-area">
				<a href="<%=request.getContextPath()%>/admin/noticeListServlet.do">
					<div>
						<h3>small us X Kakao pay</h3>
						<h5>Kakao Pay로 10만원 이상 결제 시 5천원 할인</h5>
					</div> <!-- 아래 쿠폰 이미지는 결제 수단에 따라 이미지 변경 예정 -->
					<img src="<%=request.getContextPath()%>/img/kakaopay.png" width="100" height="100">
				</a>
			</div>
		</div>
	</section>

	<!-- new class section -->
	<div id="hMainNew"></div>
	<%-- <h2>NEW CLASS</h2>
	<section class="h-imgContainer">

		<div class="h-img-list">
			<a href=""> <img
				src="<%=request.getContextPath()%>/img/img-slide2-4.png"
				alt="no img">
				<h4>class-title</h4>
				<h5>category | location</h5>
			</a>
			<div class="h-wish-container">
				<input type="checkbox" checked="checked" id="i-favorite2"
					name="favorite-checkbox" value="favorite-button"> <label
					for="i-favorite2" class="i-container"> <svg
						xmlns="http://www.w3.org/2000/svg" width="24" height="24"
						viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"
						stroke-linecap="round" stroke-linejoin="round"
						class="feather feather-heart">
                            <path
							d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z">
                            </path>
                    </svg>
				</label>
			</div>
		</div>
		<div class="h-img-list">
			<a href=""> <img
				src="<%=request.getContextPath()%>/img/img-slide2-4.png"
				alt="no img">
				<h4>class-title</h4>
				<h5>category | location</h5>
			</a>
			<div class="h-wish-container">
				<input type="checkbox" checked="checked" id="i-favorite3"
					name="favorite-checkbox" value="favorite-button"> <label
					for="i-favorite3" class="i-container"> <svg
						xmlns="http://www.w3.org/2000/svg" width="24" height="24"
						viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"
						stroke-linecap="round" stroke-linejoin="round"
						class="feather feather-heart">
                            <path
							d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z">
                           </path>
                    </svg>
				</label>
			</div>
		</div>
		<div class="h-img-list">
			<a href=""> <img
				src="<%=request.getContextPath()%>/img/img-slide2-4.png"
				alt="no img">
				<h4>class-title</h4>
				<h5>category | location</h5>
			</a>
			<div class="h-wish-container">
				<input type="checkbox" checked="checked" id="i-favorite4"
					name="favorite-checkbox" value="favorite-button"> <label
					for="i-favorite4" class="i-container"> <svg
						xmlns="http://www.w3.org/2000/svg" width="24" height="24"
						viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"
						stroke-linecap="round" stroke-linejoin="round"
						class="feather feather-heart">
                            <path
							d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z">
                            </path>
                     </svg>
				</label>
			</div>
		</div>
		<div class="h-img-list">
			<a href=""> <img
				src="<%=request.getContextPath()%>/img/img-slide2-4.png"
				alt="no img">
				<h4>class-title</h4>
				<h5>category | location</h5>
			</a>
			<div class="h-wish-container">
				<input type="checkbox" checked="checked" id="i-favorite4"
					name="favorite-checkbox" value="favorite-button"> <label
					for="i-favorite4" class="i-container"> <svg
						xmlns="http://www.w3.org/2000/svg" width="24" height="24"
						viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"
						stroke-linecap="round" stroke-linejoin="round"
						class="feather feather-heart">
                            <path
							d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z">
                            </path>
                     </svg>
				</label>
			</div>
		</div>
	</section> --%>
<script>

		$("#h-activity").click(e=>{
			location.assign('<%=request.getContextPath()%>/categoryActivity.do?categoryId=EXE');
		})
		$("#h-beauty").click(e=>{
			location.assign('<%=request.getContextPath()%>/categoryBeauty.do?categoryId=BEA');
		})
		$("#h-craft").click(e=>{
			location.assign('<%=request.getContextPath()%>/categoryCraft.do?categoryId=CRA');
		})
		$("#h-cooking").click(e=>{
			location.assign('<%=request.getContextPath()%>/categoryCooking.do?categoryId=COO');
		})
		let slideIndex = 1;
	    showSlides(slideIndex);
	
	    // Next/previous controls
	    function plusSlides(n) {
	        showSlides(slideIndex += n);
	    }
	
	    // Thumbnail image controls
	    function currentSlide(n) {
	        showSlides(slideIndex = n);
	    }
	
	    function showSlides(n) {
	    	let i;
	    	let slides = document.getElementsByClassName("slides");
	    	let dots = document.getElementsByClassName("dot");
	    	if (n > slides.length) {slideIndex = 1}
	   		if (n < 1) {slideIndex = slides.length}
	        for (i = 0; i < slides.length; i++) {
	            slides[i].style.display = "none";
	        }
	        for (i = 0; i < dots.length; i++) {
	            dots[i].className = dots[i].className.replace(" active", "");
	        }
	        slides[slideIndex-1].style.display = "block";
	        dots[slideIndex-1].className += " active";
	    }
	</script>
<%@ include file="/views/common/footer.jsp"%>