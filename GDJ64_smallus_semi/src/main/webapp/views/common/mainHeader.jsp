<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List,com.smallus.member.model.vo.Member, com.smallus.host.model.vo.Host,com.smallus.classes.model.vo.Classes,com.smallus.member.model.vo.Notifications"%>
<%
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
					<img src="<%=request.getContextPath()%>/img/마이페이지.png" alt=""
						width="25px" height="25px" class="i-loginPage">
				</div>
				<div class="icon">
					<a href="<%=request.getContextPath()%>/memberLoginMove.do"> <img
						src="<%=request.getContextPath()%>/img/하트.png" alt="" width="25px"
						height="25px"></a>
				</div>
			</div>
		</div>
		<div class="i-loginToggle">
			<div class="i-loginMove">
				<a href="<%=request.getContextPath()%>/memberLoginMove.do"><span
					class="i-memberLoginMove">회원 로그인</span></a> <a
					href="<%=request.getContextPath()%>/hostLoginMove.do"><span
					class="i-hostLoginMove">호스트 로그인</span></a>
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
				<img
					src="<%=request.getContextPath()%>/upload/mypageprofile/<%=loginMember.getMemberImg()%>"
					alt="" width="30px" height="30px" class="i-iconinfoimg"><span
					id="i-iconinfouser"><%=loginMember.getMemberNickname()%></span><span
					class="i-nim">님</span> <a
					href="<%=request.getContextPath()%>/logout.do"><span
					class="i-logout">로그아웃</span></a>
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
				<a href="<%=request.getContextPath()%>/memberWishList.do"><img
					src="<%=request.getContextPath()%>/img/하트.png" alt="" width="25px"
					height="25px"></a>
			</div>

			<%
			if (loginMember != null) {
				List<Notifications> not = (List) session.getAttribute("Notlist");
				int notcount = (int) session.getAttribute("notcount");
			%>

			<div class="notification-icon">
				<div class="icon i-noticon">
					<img src="<%=request.getContextPath()%>/img/알림.png" alt=""
						width="25px" height="25px"> <span class="num-count"><%=notcount%></span>
				</div>
			</div>
			<div class="notification-container">
				<div class="scroll-snap-card">
					<div class="slide">
						<p class="tip">
						<div class="i-notifcationTotal">
							<%
							int count = 2;
							%>
							<%
							if (!not.isEmpty()) {
							%>
							<%
							for (Notifications n : not) {
							%>
							<input class="checkbox" type="checkbox" id="size_<%=count%>"
								value="small" checked /> <label class="notification"
								for="size_<%=count%>"><span><%=n.getCreatedAt()%></span>
								<br /> <span class="i-notType"><%=n.getNotiflType()%></span> <a
								href="<%=request.getContextPath()%>/memberInquiry.do"><%=n.getNotiflType()%> <%=n.getNotiflMessage()%>
							</a><input type="hidden" value="<%=n.getNotiflId()%>" class="i-notId"></label>

							<%
							count++;
							}
							%>
							<%
							} else {
							%>
							<div class="i-nocoupon">알림이 없습니다.</div>
							<%
							}
							}
							%>
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
				<td class="ca"><a
					href="<%=request.getContextPath()%>/views/main/category_cooking.jsp">요리<a></a></td>
				<td class="ca"><a
					href="<%=request.getContextPath()%>/views/main/category_crafts.jsp">공예</a></td>
				<td class="ca"><a
					href="<%=request.getContextPath()%>/views/main/category_beauty.jsp">뷰티</a></td>
				<td class="ca"><a
					href="<%=request.getContextPath()%>/views/main/category_activity.jsp">운동</a></td>
			</tr>
			<tr>
				<td><a
					href="<%=request.getContextPath()%>/views/main/category_cooking.jsp">제과</a></td>
				<td><a
					href="<%=request.getContextPath()%>/views/main/category_crafts.jsp">레진</a></td>
				<td><a
					href="<%=request.getContextPath()%>/views/main/category_beauty.jsp">비누</a></td>
				<td><a
					href="<%=request.getContextPath()%>/views/main/category_activity.jsp">실내스포츠</a></td>
			</tr>
			<tr>
				<td><a
					href="<%=request.getContextPath()%>/views/main/category_cooking.jsp">제빵</a></td>
				<td><a
					href="<%=request.getContextPath()%>/views/main/category_crafts.jsp">가죽</a></td>
				<td><a
					href="<%=request.getContextPath()%>/views/main/category_beauty.jsp">향수</a></td>
				<td><a
					href="<%=request.getContextPath()%>/views/main/category_activity.jsp">야외스포츠</a></td>
			</tr>
			<tr>
				<td><a
					href="<%=request.getContextPath()%>/views/main/category_cooking.jsp">음료</a></td>
				<td><a
					href="<%=request.getContextPath()%>/views/main/category_crafts.jsp">스테인
						글라스</a></td>
				<td><a
					href="<%=request.getContextPath()%>/views/main/category_beauty.jsp">천연
						화장품</a></td>
				<td><a
					href="<%=request.getContextPath()%>/views/main/category_activity.jsp"></a></td>
			</tr>
		</table>
	</header>

	<%
	if (loginMember == null) {
	%>
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
       const windowWidth = $(window).innerWidth();

       if (isSearchFieldActive) {
         $("form").submit(); 
         return;
       }

       icon.css("visibility", "hidden");
       searchField.css("display", "flex");
       categories.css("visibility", "hidden");
       
       /* 화면크기에따른 돋보기위치이동 */
       if(windowWidth > 1800) {
           $(".i-searchIcon").css("transform", "translateX(-125px)");
       } else if(windowWidth > 1400) {
           $(".i-searchIcon").css("transform", "translateX(-90px)");
       }
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
	<%
	} else {
	%>
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
  const windowWidth = $(window).innerWidth();

  if (isSearchFieldActive) {
    $("form").submit(); // 폼을 제출하여 검색을 실행합니다.
    return;
  }

  icon.css("visibility", "hidden");
  searchField.css("display", "flex");
  categories.css("visibility", "hidden");
  
  if(windowWidth > 1800) {
      $(".i-searchIcon").css("transform", "translateX(-35px)");
  } else if(windowWidth > 1400) {
      $(".i-searchIcon").css("transform", "translateX(-15px)");
  } 
  
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
  
  //알림 클릭시 삭제
  $(".checkbox").change(e=>{
	  var notId = $(e.target).next().find('.i-notId').val();
		
			$.ajax({
				type:"get",
				url:"<%=request.getContextPath()%>/notificationsRemove.do",
				 data: {notId:notId},
				success:data=>{
					
				},
				error:(r,m)=>{
					console.log(r);
					console.log(m);
					if(e.status==404) alert("요청한 페이지가 없습니다");
				}
			})
  })


  
  
</script>
	<%
	}
	%>