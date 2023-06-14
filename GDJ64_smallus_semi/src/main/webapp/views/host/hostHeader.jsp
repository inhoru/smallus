<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Small us ☺</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/host/hostHeader.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/host/hostMainStyle.css">
    <!-- fullcalendar css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
    <!-- fullcalendar 언어 설정관련 script -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

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