<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Small us ☺</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/host/h-header.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/host/h-main.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypage/mypage.css">
    <!-- fullcalendar css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
    <!-- fullcalendar 언어 설정관련 script -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
    <style>
    	    /* 전체페이지 스타일 */
    * {
        margin: 0;
        padding: 0;
        color: #555555;
        list-style-type: none;
        text-decoration: none;
        font-family: 'GmarketSansMedium';
    }

    /*폰트 */
    @font-face {
        font-family: "GmarketSansLight";
        src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff") format("woff");
        font-weight: normal;
        font-style: normal;
    }

    @font-face {
        font-family: "GmarketSansMedium";
        src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff") format("woff");
        font-weight: normal;
        font-style: normal;
    }

    @font-face {
        font-family: "GmarketSansBold";
        src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff") format("woff");
        font-weight: normal;
        font-style: normal;
    }

    /* 전체헤더 */
    header {
        background-color: #FFFBF5;
        width: 100%;
        /* box-shadow: 0 12px rgba(0, 0, 0, 0.3); */
    }

    .icon :first-child {
        cursor: pointer;
    }


    /* 헤더 내용 */
    #headerContainer {
        width: 70%;
        margin: 0 auto;
        display: flex;
        align-items: center;
    }

    /* 로고 */
    #logo {
        width: 90px;
        height: 60px;
        padding: 5px 0 5px 0;
    }


    /* 아이콘 */
    div.h-iconContainer {
        display: flex;
        justify-content: space-between;
        width: 30%;
        margin-left: 70%;
        align-items: center;
        border: 1px solid red;

    }

    .h-iconContainer>a {
        font-size: 1rem;
        height:2rem;
        align-items: center;
        border: 1px solid red;
    }

    /* 알람 아이콘 */
    .h-notification-icon {
        position: relative;
        margin-right: 1em;
        align-items: center;
        border: 1px solid red;
        width:2rem;
        height:2rem;
    }

    /* 알람 갯수 */
    .h-num-count {
        position: absolute;
        user-select: none;
        cursor: default;
        font-size: 0.6rem;
        background: #e74c3c;
        width: 1.2rem;
        height: 1.2rem;
        color: #ffffff;
        display: inline-flex;
        justify-content: center;
        align-items: center;
        border-radius: 50%;
        top: -0.33rem;
        right: -0.66rem;
        box-sizing: border-box;
    }

    /* 알람 내용 */
    .h-notification-container {
        display: none;
        cursor: default;
        position: absolute;
        z-index: 999;
        top: 50px;
        right: 0px;
        width: 400px;
        font-weight: 300;
        box-sizing: border-box;
        box-shadow: 0.5rem 0.5rem 2rem 0 rgba(184, 155, 136, 0.2);
        background-color: #FFFCF5;
    }

    .h-notification {
        box-sizing: border-box;
        background-color: #FFFCF5;
    }

    input.h-checkbox[type=checkbox] {
        display: none;
    }

    input.h-checkbox[type=checkbox]+label {
        display: block;
    }

    /* 알람 세부목록 */
    .h-notification {
        height: 3.25rem;
        padding: 1.125rem 4rem 0.75rem 2rem;
        font-size: 75%;
        border-top: 1px solid rgba(184, 155, 136, 0.3);

    }

    /* 알람 목록 */
    .h-notification-container:before {
        content: "";
        position: absolute;
        top: 1px;
        right: 0;
        width: 0;
        height: 0;
        transform: translate(-1rem, -100%);
        border-left: 0.75rem solid transparent;
        border-right: 0.75rem solid transparent;
        border-bottom: 0.75rem solid #FFFCF5;
        box-shadow: 0.5rem 0.5rem 2rem 0 rgba(184, 155, 136, 0.2);
    }

    .h-move-mypage {
        width: 10rem;
        height: auto;
        align-items: center;
        display: flex;
    }

    .h-move-mypage img {
        width: 2rem;
        height: 2rem;
        margin-right: 1rem;
        background-color: rgb(147, 177, 167);
        border-radius: 1rem;
    }

    /*  */
    .footer {
    width: 100%;
    flex-direction: column;
    background-color: #F3EEE6;
}

.footer div {
    width: 70%;
    margin: 0 auto;
    display: flex;
    /* padding: 1% 0; */
}

.footer>div {
    padding: 1% 0;
}

.usMenu ul {
    width: 100%;
}

.usInfo .copyright {
    width: 160%;
    margin-right: auto;
}

.aside {
    flex-direction: column;
    padding-left: 5%;
}

a {
    color: inherit;

}
    </style>
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
    <!-- menu-category -->
        <section class="h-menu">
            <div>
                <table>
                    <tr>
                        <th>호스트 관리</th>
                        <th>클래스 관리</th>
                        <th>예약 관리</th>
                        <th>고객 센터</th>
                    </tr>
                    <tr>
                        <td><a href="">프로필 수정</a></td>
                        <td><a href="">내 클래스 보기</a></td>
                        <td><a href="">클래스 예약 관리</a></td>
                        <td><a href="">공지사항</a></td>
                    </tr>
                    <tr>
                        <td><a href="">회원 탈퇴</a></td>
                        <td><a href="">클래스 등록하기</a></td>
                        <td><a href="">정산 정보 관리</a></td>
                        <td><a href="">1:1 문의</a></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><a href="">Q&A 관리</a></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><a href="">후기 관리</a></td>
                    </tr>
                </table>
            </div>            
        </section>