<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/mainHeader.jsp"%>

<div class="d-add-review-page">
	<br><br>
	<h2>후기 등록하기</h2>
	<br>
	<hr>
	<div class="d-add-review-title">
		<img src="<%=request.getContextPath()%>/img/img-slide2-1.png" 
		width="150px" height="150px" id="review-img">
		<div class="review-title-content">
			<h3>베이킹 어렵지 않다! 고소하고 달콤한 마들렌 만들기</h3>
			<p>마들렌장인<p>
			<p>2023-06-19 13:00~16:00</p>
			<h2>★★★★☆</h2>
			<!-- 첫번째 별을 클릭시 텍스트가 ★☆☆☆☆이 되고 이렇게 걸어야하나 -->
		</div>
	</div>
	<input type="text" placeholder="제목을 입력해주세요.">
	<textarea rows="20" cols="100" placeholder="내용을 입력해주세요."></textarea>
	<br><br><br>
	<form>
	<input type="submit" value="등록하기" onclick="alert('등록되었습니다.')">
	</form>
</div>
<br><br><br><br><br>

<style>
	.d-add-review-page{
		width: 70%;
		margin: 0 auto;
		display:flex;
		flex-direction:column;
	}
	.d-add-review-title{
		width: 90%;
		margin : 30px;
		display:flex;
	}
	.review-title-content{
		width: 90%;
		margin : 15px;
	}
	.review-title-content>h2{
		color:gold;
	}
	.d-add-review-page>textarea{
		width: 100%;
		max-width:900px;
		margin : 0 ;
		border: 2px solid #595959;
		border-radius: 20px;
		padding: 10px;
	}
	
	.d-add-review-page>input{
		width: 100%;
		max-width:600px;
		border: 2px solid #595959;
		border-radius: 20px;
		padding: 10px;
		margin-bottom:10px;
		text-align: center;
	
	}
	.d-add-review-page>input[type="submit"]{
		width: 100px;
		height: 30px;
		border-radius: 20px;
		color:#595959;
		background-color: #F8D8D8;
		margin: 0 auto;
	}
	

</style>

<%@ include file="/views/common/footer.jsp"%>


