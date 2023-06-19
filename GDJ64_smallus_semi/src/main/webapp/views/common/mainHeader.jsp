<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.smallus.member.model.vo.Member, com.smallus.host.model.vo.Host"%>
<%
Member infoMember = (Member) request.getAttribute("infoMember"); 
Member loginMember = (Member) session.getAttribute("loginMember");
Host loginHost = (Host) session.getAttribute("loginHost");
Cookie[] cookies = request.getCookies();
String saveId = null;
String savehostId = null;
if (cookies != null) {
	for (Cookie c : cookies) {
		if (c.getName().equals("saveId")) {
			saveId = c.getValue();
		}
		if (c.getName().equals("savehostId")) {
			savehostId = c.getValue();
		}
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Small us ☺</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common/headrFooter.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common/main.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/mypage/mypage.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
</head>
<body id="bodys">
	<header id="scroll">
		<div id="headerContainer">
			<a href="<%=request.getContextPath()%>"><img
				src="<%=request.getContextPath()%>/img/main.png" alt="" id="logo"></a>
			<%
			if (loginMember == null) {
			%>
			<nav class="menu">
				<div id="categories">
					<h4>Categories</h4>
					<img src="<%=request.getContextPath()%>/img/부등호.png" alt=""
						width="12px" height="12px">
				</div>
				<div id="hiddenseach">
					<form action="http://www.google.co.kr/search" method="get">
						<input type="text" name="q" class="search"
							placeholder=" 관심,주제,클래스,호스트찾기">
					</form>
				</div>
			</nav>
			<div class="iconContainer">
				<div class="i-loginHeadr">
					<span></span><a href=""><span></span></a>
				</div>
				<div class="iconinfo">
					<img src="<%=request.getContextPath()%>/img/검색.png" alt=""
						width="25px" height="25px" class="i-searchIcon">
				</div>
				<div class="icon">
					<img
						src="<%=request.getContextPath()%>/img/마이페이지.png" alt=""
						width="25px" height="25px" class="i-loginPage">
				</div>
				<div class="icon">
					<a href="<%=request.getContextPath()%>/memberLoginMove.do"><img
						src="<%=request.getContextPath()%>/img/하트.png" alt="" width="25px"
						height="25px"></a>
				</div>
			</div>
		</div>
			<div class="i-loginToggle">
				<div class="i-loginMove">
					<a href="<%=request.getContextPath()%>/memberLoginMove.do"><span class="i-memberLoginMove">회원 로그인</span></a>
					<a href="<%=request.getContextPath()%>/hostLoginMove.do"><span class="i-hostLoginMove">호스트 로그인</span></a>
				</div>
			</div>
		</div>
		<%
		} else {
		%>
		<nav class="menu">
			<div id="categories">
				<h4>Categories</h4>
				<img src="<%=request.getContextPath()%>/img/부등호.png" alt=""
					width="12px" height="12px">
			</div>
			<div id="hiddenseach">
				<form action="http://www.google.co.kr/search" method="get">
					<input type="text" name="q" class="search"
						placeholder=" 관심,주제,클래스,호스트찾기">
				</form>
			</div>
		</nav>
		<div class="i-loginHeadr">
			<div class="i-iconinfo">
				<img src="<%=request.getContextPath()%>/upload/mypageprofile/<%=infoMember.getMemberImg()%>" alt=""
					width="30px" height="30px" class="i-iconinfoimg"><span
					id="i-iconinfouser"><%=infoMember.getMemberNickname()%></span><span class="i-nim">님</span> <a
					href="<%=request.getContextPath()%>/logout.do"><span class="i-logout">로그아웃</span></a>
			</div>
			<div class="icon">
				<a><img src="<%=request.getContextPath()%>/img/검색.png" alt=""
					width="25px" height="25px" class="i-searchIcon"></a>
			</div>
			<div class="icon">
				<a href="<%=request.getContextPath()%>/memberMypage.do"><img
					src="<%=request.getContextPath()%>/img/마이페이지.png" alt=""
					width="25px" height="25px"></a>
			</div>
			<div class="icon">
				<a href=""><img src="<%=request.getContextPath()%>/img/하트.png"
					alt="" width="25px" height="25px"></a>
			</div>
			<div class="notification-icon">
				<div class="icon i-noticon">
					<img src="<%=request.getContextPath()%>/img/알림.png" alt=""
						width="25px" height="25px"> <span class="num-count">13</span>
				</div>
			</div>
			<div class="notification-container">
				<div class="scroll-snap-card">
					<div class="slide">
						<p class="tip">
						<div class="i-notifcationTotal">
							<input class="checkbox" type="checkbox" id="size_2" value="small"
								checked /> <label class="notification" for="size_2"><span>2023-06-15</span>
								<br /> <span class="i-notType">Q&A</span> <a href="">결제오류에대한문의에대한
									답변이등록되었습니다.</a></label> <input class="checkbox" type="checkbox" id="size_3"
								value="small" checked /> <label class="notification"
								for="size_3"><span>2023-06-15</span> <br /> <span
								class="i-notType">클래스</span> <a href="">결제오류에대한문의에대한
									답변이등록되었습니다.</a></label> <input class="checkbox" type="checkbox" id="size_4"
								value="small" checked /> <label class="notification"
								for="size_4"><span>2023-06-15</span> <br /> <span
								class="i-notType">클래스</span> <a href="">결제오류에대한문의에대한
									답변이등록되었습니다.</a></label> <input class="checkbox" type="checkbox" id="size_5"
								value="small" checked /> <label class="notification"
								for="size_5"><span>2023-06-15</span> <br /> <span
								class="i-notType">리뷰</span> <a href="">결제오류에대한문의에대한
									답변이등록되었습니다.</a></label> <input class="checkbox" type="checkbox" id="size_6"
								value="small" checked /> <label class="notification"
								for="size_6"><span>2023-06-15</span> <br /> <span
								class="i-notType">1:1문의</span> <a href="">결제오류에대한문의에대한
									답변이등록되었습니다.</a></label>
						</div>
					</div>
				</div>
			</div>
		</div>

		<%
		}
		%>
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
	<% if (loginMember == null) { %>
<script>
  /* 비로그인 시 작동 */
  let isSearchFieldActive = false;

  $(document).on("click", (e) => {
    const clickedInsideSearchIcon = $(e.target).hasClass("i-searchIcon");
    const clickedInsideSearchField = $(e.target).is(".search");
    const searchContainer = $(".iconContainer");

    if (isSearchFieldActive && !clickedInsideSearchIcon && !clickedInsideSearchField && !searchContainer.has(e.target).length) {
      const icon = $(".i-iconinfo");
      const searchField = $(".search");
      const categories = $("#categories");

      icon.css("visibility", "visible");
      searchField.css("display", "none");
      categories.css("visibility", "visible");
      $(".i-searchIcon").css("transform", "translateX(0)");
      $(".i-searchIcon").css("transition", "0.4s");
      $("#mainOpacity").css("opacity", "1.0");
      isSearchFieldActive = false;
      searchField.val("");
    }
  });

  $(".i-searchIcon").click((e) => {
    const icon = $(".i-iconinfo");
    const searchField = $(".search");
    const categories = $("#categories");

    if (isSearchFieldActive) {
      $("form").submit(); 
      return;
    }

    icon.css("visibility", "hidden");
    searchField.css("display", "flex");
    categories.css("visibility", "hidden");
    $(".i-searchIcon").css("transform", "translateX(-370%)");
    $(".i-searchIcon").css("transition", "0.7s");
    $("#mainOpacity").css("opacity", "0.5");

    searchField.focus();
    isSearchFieldActive = true;


    e.stopPropagation();
  });


  // 검색 필드 이외의 영역을 클릭할 때 검색 필드 숨기기
  $(document).on("click", (e) => {
    const searchField = $(".search");

    if (isSearchFieldActive && !searchField.is(e.target) && searchField.has(e.target).length === 0) {
      searchField.val("");
      searchField.css("display", "none");
      $(".i-searchIcon").css("transform", "translateX(0)");
      $(".i-searchIcon").css("transition", "0.4s");
      $("#mainOpacity").css("opacity", "1.0");
      isSearchFieldActive = false;
    }
  });
</script>
<% } else { %>
<script>
  /* 로그인 시 작동 */
  let isSearchFieldActive = false;

  $(document).on("click", (e) => {
    const clickedInsideSearchIcon = $(e.target).hasClass("i-searchIcon");
    const clickedInsideSearchField = $(e.target).is(".search");
    const searchContainer = $(".iconContainer");

    if (isSearchFieldActive && !clickedInsideSearchIcon && !clickedInsideSearchField && !searchContainer.has(e.target).length) {
      const icon = $(".i-iconinfo");
      const searchField = $(".search");
      const categories = $("#categories");

      icon.css("visibility", "visible");
      searchField.css("display", "none");
      categories.css("visibility", "visible");
      $(".i-searchIcon").css("transform", "translateX(0)");
      $(".i-searchIcon").css("transition", "0.4s");
      $("#mainOpacity").css("opacity", "1.0");
      isSearchFieldActive = false;
      searchField.val("");
    }
  });

  $(".i-searchIcon").click((e) => {
    const icon = $(".i-iconinfo");
    const searchField = $(".search");
    const categories = $("#categories");

    if (isSearchFieldActive) {
      $("form").submit(); // 폼을 제출하여 검색을 실행합니다.
      return;
    }

    icon.css("visibility", "hidden");
    searchField.css("display", "flex");
    categories.css("visibility", "hidden");
    $(".i-searchIcon").css("transform", "translateX(-185%)");
    $(".i-searchIcon").css("transition", "0.7s");
    $("#mainOpacity").css("opacity", "0.5");

    searchField.focus();
    isSearchFieldActive = true;

    // 이벤트 전파 방지
    e.stopPropagation();
  });

  // 검색 필드에서 Enter 키를 누를 때 검색 실행
  $(".search").keydown((e) => {
    if (e.key === "Enter") {
      $("form").submit(); // 폼을 제출하여 검색을 실행합니다.
    }
  });

  // 검색 필드 이외의 영역을 클릭할 때 검색 필드 숨기기
  $(document).on("click", (e) => {
    const searchField = $(".search");

    if (isSearchFieldActive && !searchField.is(e.target) && searchField.has(e.target).length === 0) {
      searchField.val("");
      searchField.css("display", "none");
      $(".i-searchIcon").css("transform", "translateX(0)");
      $(".i-searchIcon").css("transition", "0.4s");
      $("#mainOpacity").css("opacity", "1.0");
      isSearchFieldActive = false;
    }
  });
</script>
<% } %>

	</header>