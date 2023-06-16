<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Small us ☺</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminHeader.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminMainStyle.css">
</head>
<body>
    <header>
        <div id="headerContainer">
            <a href="/"><img src="<%=request.getContextPath() %>/img/main.png" alt="" id="logo"></a>
            <div class="h-iconContainer">
                <a href="" class="h-move-mypage"><img src="<%=request.getContextPath() %>/img/마이페이지.png" alt="" >alter 님</a>
                <!-- <div class="icon"><a href=""><img src="./img/마이페이지.png" alt="" width="25px" height="25px"></a></div>  -->
                <a href="" class="h-logout">로그아웃</a>
                <div class="h-notification-icon">
                    <div class="icon"><img src="<%=request.getContextPath() %>/img/알림.png" alt="">
                        <span class="h-num-count">13</span>
                    </div>
                    <div class="h-notification-container">
                        <input class="h-checkbox" type="checkbox" id="size_1" value="small" checked />
                        <label class="h-notification" for="size_1"><a href=""><span>[1:1] </span>1:1문의에대한 답변이등록되었습니다.</a></label>
                        <input class="h-checkbox" type="checkbox" id="size_2" value="small" checked />
                        <label class="h-notification" for="size_2"><a href=""><span>[Q&A] </span>Q&A에대한 답변이 등록되었습니다.</a></label>    
                        <input class="h-checkbox" type="checkbox" id="size_3" value="small" checked/>
                        <label class="h-notification" for="size_3"><a href=""><span>[클래스 승인] </span>이노의안되면된느거하라 클래스 승인되었습니다.</a></label>    
                        <input class="h-checkbox" type="checkbox" id="size_4" value="small" checked/>
                        <label class="h-notification" for="size_4"><a href=""><span>[클래스 승인] </span>이노의성공하는법 클래스 승인이거절당했습니다.</a></label>    
                        <input class="h-checkbox" type="checkbox" id="size_5" value="small" checked/>
                        <label class="h-notification" for="size_5"><a href=""><span>[클래스 문의] </span>이게배송왜안옴 문의글에 답변이달렸습니다.</a></label>
                    </div>
                </div>
            </div>
            
        </div>
    </header>
	<div class="m-navContainer">
	    <table class="m-nav">
			<tr>
				<th>회원관리</th>
				<th>승인관리</th>
				<th>고객센터</th>
			</tr>
			<tr>
				<td>일반회원관리</td>
				<td>클래스승인</td>
				<td>공지사항</td>
			</tr>
			<tr>
				<td>호스트회원관리</td>
				<td>정산승인</td>
				<td>1:1문의</td>
			</tr>
	    </table>
	</div>

</body>
</html>