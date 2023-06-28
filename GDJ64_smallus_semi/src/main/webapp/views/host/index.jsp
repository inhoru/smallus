<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/mainHeader.jsp"%>
<%@ page import="com.smallus.payment.model.vo.MainPayment"%>
<script>

	  $.ajax({
		url:"<%=request.getContextPath()%>/mainPage.do",
		dataType: 'json',
		success: data =>{
				
			console.log(data);
				
			},
			error: (r, m, e) => {
				console.log(r);
				console.log(m);
			}
		}); 
</script>
<div id="mainOpacity" class="h-main">
	<!-- main 배너 -->
	<section></section>
	<div>
		<h2>BEST CLASS</h2>
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
		</section>
	</div>
<%@ include file="/views/common/footer.jsp"%>