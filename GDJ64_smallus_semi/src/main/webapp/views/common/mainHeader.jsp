<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Small us ☺</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common/headrFooter.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage/mypage.css">
</head>
<body id="bodys">
	<header id="scroll">
		<div id="headerContainer">
			<a href=""><img src="<%=request.getContextPath()%>/img/main.png" alt="" id="logo"></a>
			<nav class="menu">
				<div id="categories">
					<h4>Categories</h4>
					<img src="<%=request.getContextPath()%>/img/부등호.png" alt="" width="12px" height="12px">
				</div>
				<div id="hiddenseach">
					<form action="http://www.google.co.kr/search" method="get">
						<input type="text" name="q" id="search"
							placeholder=" 관심,주제,클래스,호스트찾기">
					</form>
				</div>
			</nav>
			<div class="iconContainer">
			 <div class="i-loginHeadr">
                    <img src="<%=request.getContextPath()%>/img/mypage/기본프로필.png" alt="" width="30px" height="30px"><span>2_no님</span><a href=""><span>로그아웃</span></a>
                </div>
				<div class="icon">
					<div class="icon"><img src="<%=request.getContextPath()%>/img/검색.png" alt="" width="25px" height="25px" class="i-searchIcon"></div>
				</div>
				<div class="icon">
					<a href="<%=request.getContextPath()%>/mypage.html"><img src="<%=request.getContextPath()%>/img/마이페이지.png" alt=""
						width="25px" height="25px"></a>
				</div>
				<div class="icon">
					<a href=""><img src="<%=request.getContextPath()%>/img/하트.png" alt="" width="25px"
						height="25px"></a>
				</div>
				<div class="notification-icon">
					<div class="icon">
						<img src="<%=request.getContextPath()%>/img/알림.png" alt="" width="25px" height="25px"> <span
							class="num-count">13</span>
					</div>

					<div class="notification-container">
						<input class="checkbox" type="checkbox" id="size_1" value="small"
							checked /> <label class="notification" for="size_1"><a
							href="">1:1문의에대한 답변이등록되었습니다.</a></label> <input class="checkbox"
							type="checkbox" id="size_2" value="small" checked /> <label
							class="notification" for="size_2"><a href="">Q&A에대한
								답변이 등록되었습니다.</a> </label> <input class="checkbox" type="checkbox"
							id="size_3" value="small" checked /> <label class="notification"
							for="size_3"><a href="">이노의안되면된느거하라 클래스 승인되었습니다.</a> </label> <input
							class="checkbox" type="checkbox" id="size_4" value="small"
							checked /> <label class="notification" for="size_4"><a
							href="">이노의성공하는법 클래스 승인이거절당했습니다.</a> </label> <input class="checkbox"
							type="checkbox" id="size_5" value="small" checked /> <label
							class="notification" for="size_5"><a href="">이게배송왜안옴
								문의글에 답변이달렸습니다.</a></label>

					</div>


				</div>
			</div>

		</div>
		<table id="categoriesTable">
			<tr>
				<td class="ca">요리</td>
				<td class="ca">공예</td>
				<td class="ca">뷰티</td>
				<td class="ca">운동</td>
			</tr>
			<tr>
				<td><a href="">제과</a></td>
				<td><a href="">레진</a></td>
				<td><a href="">비누</a></td>
				<td><a href="">실내스포츠</a></td>
			</tr>
			<tr>
				<td><a href="">제빵</a></td>
				<td><a href="">가죽</a></td>
				<td><a href="">향수</a></td>
				<td><a href="">야외스포츠</a></td>
			</tr>
			<tr>
				<td><a href="">음료</a></td>
				<td><a href="">스테인 글라스</a></td>
				<td><a href="">천연 화장품</a></td>
				<td><a href=""></a></td>
			</tr>
		</table>
	</header>