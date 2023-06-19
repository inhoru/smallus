<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/mainHeader.jsp"%>
<%int coupon=(int)request.getAttribute("countCoupon"); %>
 <div id="mainOpacity">
        <section class="i-tablecontent">
            <table class="i-mypageCategories">
                <tr>
                    <td class="i-myInfo i-my">내정보</td>
                    <td class="i-info">클래스정보</td>
                    <td class="i-customerService i-cu">고객센터</td>
                </tr>
                <tr>
                    <td class="i-myInfo"><a href="<%=request.getContextPath()%>/memberprofile.do">프로필관리</a></td>
                    <td><a href="<%=request.getContextPath()%>/mypagePayment.html">결제내역</a></td>
                    <td class="i-customerService"><a href="">공지사항</a></td>
                </tr>
                <tr>
                    <td class="i-myInfo"><a href="<%=request.getContextPath()%>/withdrawal.do">회원탈퇴</a></td>
                    <td><a href="<%=request.getContextPath()%>/mypageWishlist.html">찜관리</a></td>
                    <td class="i-customerService"><a href="">1:1 문의</a></td>
                </tr>
                <tr>
                    <td class="i-myInfo"><a href="<%=request.getContextPath()%>/mypageCoupon.do">쿠폰관리</a></td>
                    <td><a href="">후기관리</a></td>
                    <td class="i-customerService"><a href="">Q&A</a></td>
                </tr>
            </table>
        </section>
        <div class="i-mypagetotal">
        <section id="i-main">
            <div id="i-proFile">
                <div id="i-proFileImg">
                    <img src="<%=request.getContextPath()%>/upload/mypageprofile/<%=infoMember.getMemberImg()%>" alt="" >
                    <div id="i-proFileInfo">
                        <h1><%=infoMember.getMemberNickname() %></h1>
                        <p><%=infoMember.getMemberEmail() %></p>
                    </div>
                </div>
                <div id="i-additional">
                    <div class="i-additional-item">
                        <img src="<%=request.getContextPath()%>/img/mypage/쿠폰.png" alt="" class="i-cs">
                        <img src="<%=request.getContextPath()%>/img/mypage/마이페이지하트.png" alt="" class="i-cs">
                        <img src="<%=request.getContextPath()%>/img/mypage/후기.png" alt="" class="i-cs">
                    </div>
                    <div class="i-additional-span">
                        <span class="i-hs i-hs1">쿠폰</span>
                        <span class="i-hs i-hs2">찜</span>
                        <span class="i-hs i-hs3">후기</span>
                    </div>
                    <div class="i-additional-a">
                        <a href="<%=request.getContextPath()%>/mypageCoupon.html" class="i-as1"><%=coupon %></a>
                        <a href="<%=request.getContextPath()%>/mypageWishlist.html" class="i-as2">2</a>
                        <a href="" class="i-as3">3</a>
                    </div>
                </div>
            </div>
             <h1 class="i-reservationh2">예약내역</h1>
                <div id="i-reservation">
                    <input type="radio" name="slide" id="slide01" checked>
                    <input type="radio" name="slide" id="slide02">
                    <input type="radio" name="slide" id="slide03">
                    <ul class="slidelist">
                        <li>
                            <div class="i-reservationListTotal">
                                <span id="i-reservationSlick2">
                                    <label for="slide03" class="left"><img src="<%=request.getContextPath()%>/img/부등호.png" alt="" width="20px"
                                            height="20px"></label>
                                </span>
                                <div class="i-reservationList">
                                    <div class="i-reservation-details">
                                        <div class="bs2"><span class="i-reservation-payment"> 결제완료</span>
                                            <span class="i-reservation-day">2023-06-04</span>
                                        </div>
                                        <div class="i-bs">
                                            <a href=""><span class="i-reservation-title">이노의 안되면 되는거 해라</span></a>
                                        </div>
                                        <div class="i-bs1">
                                            <span class="i-reservation-reservationDay">2023.5.19 | 10:40~11:30</span>
                                            <span class="i-reservation-peopleNum">인원 : 1</span>
                                        </div>
                                    </div>
                                    <img src="<%=request.getContextPath()%>/img/mypage/타이틀이미지.png" alt="">
                                </div>
                                <div class="i-reservationList">
                                    <div class="i-reservation-details">
                                        <div class="i-bs2"><span class="i-reservation-payment"> 결제완료</span>
                                            <span class="i-reservation-day">2023-06-04</span>
                                        </div>
                                        <div class="i-bs">
                                            <a href=""><span class="i-reservation-title">이노의 안되면 되는거 해라</span></a>
                                        </div>
                                        <div class="i-bs1">
                                            <span class="i-reservation-reservationDay">2023.5.19 | 10:40~11:30</span>
                                            <span class="i-reservation-peopleNum">인원 : 1</span>
                                        </div>
                                    </div>
                                    <img src="<%=request.getContextPath()%>/img/mypage/타이틀이미지.png" alt="">
                                </div>
                                <span id="i-reservationSlick">
                                    <label for="slide02" class="right"><img src="<%=request.getContextPath()%>/img/부등호.png" alt="" width="20px"
                                            height="20px"></label>
                                </span>
                            </div>
                        </li>
                        <li>
                            <div class="i-reservationListTotal">
                                <span id="i-reservationSlick2">
                                    <label for="slide02" class="left"><img src="<%=request.getContextPath()%>/img/부등호.png" alt="" width="20px"
                                            height="20px"></label>
                                </span>
                                <div class="i-reservationList">
                                    <div class="i-reservation-details">
                                        <div class="bs2"><span class="i-reservation-payment"> 결제완료</span>
                                            <span class="i-reservation-day">2023-06-04</span>
                                        </div>
                                        <div class="i-bs">
                                            <a href=""><span class="i-reservation-title">이노의 안되면 되는거 해라</span></a>
                                        </div>
                                        <div class="i-bs1">
                                            <span class="i-reservation-reservationDay">2023.5.19 | 10:40~11:30</span>
                                            <span class="i-reservation-peopleNum">인원 : 1</span>
                                        </div>
                                    </div>
                                    <img src="<%=request.getContextPath()%>/img/mypage/타이틀이미지.png" alt="">
                                </div>
                                <div class="i-reservationList">
                                    <div class="i-reservation-details">
                                        <div class="i-bs2"><span class="i-reservation-payment"> 결제완료</span>
                                            <span class="i-reservation-day">2023-06-04</span>
                                        </div>
                                        <div class="i-bs">
                                            <a href=""><span class="i-reservation-title">이노의 안되면 되는거 해라</span></a>
                                        </div>
                                        <div class="i-bs1">
                                            <span class="i-reservation-reservationDay">2023.5.19 | 10:40~11:30</span>
                                            <span class="i-reservation-peopleNum">인원 : 1</span>
                                        </div>
                                    </div>
                                    <img src="<%=request.getContextPath()%>/img/mypage/타이틀이미지.png" alt="">
                                </div>
                                <span id="i-reservationSlick">
                                    <label for="slide03" class="right"><img src="<%=request.getContextPath()%>/img/부등호.png" alt="" width="20px"
                                            height="20px"></label>
                                </span>
                            </div>
                        </li>
                        <li>
                            <div class="i-reservationListTotal">
                                <span id="i-reservationSlick2">
                                    <label for="slide02" class="left"><img src="<%=request.getContextPath()%>/img/부등호.png" alt="" width="20px"
                                            height="20px"></label>
                                </span>
                                <div class="i-reservationList">
                                    <div class="i-reservation-details">
                                        <div class="bs2"><span class="i-reservation-payment"> 결제완료</span>
                                            <span class="i-reservation-day">2023-06-04</span>
                                        </div>
                                        <div class="i-bs">
                                            <a href=""><span class="i-reservation-title">이노의 안되면 되는거 해라</span></a>
                                        </div>
                                        <div class="i-bs1">
                                            <span class="i-reservation-reservationDay">2023.5.19 | 10:40~11:30</span>
                                            <span class="i-reservation-peopleNum">인원 : 1</span>
                                        </div>
                                    </div>
                                    <img src="<%=request.getContextPath()%>/img/mypage/타이틀이미지.png" alt="">
                                </div>
                                <div class="i-reservationList">
                                    <div class="i-reservation-details">
                                        <div class="bs2"><span class="i-reservation-payment"> 결제완료</span>
                                            <span class="i-reservation-day">2023-06-04</span>
                                        </div>
                                        <div class="i-bs">
                                            <a href=""><span class="i-reservation-title">이노의 안되면 되는거 해라</span></a>
                                        </div>
                                        <div class="i-bs1">
                                            <span class="i-reservation-reservationDay">2023.5.19 | 10:40~11:30</span>
                                            <span class="i-reservation-peopleNum">인원 : 1</span>
                                        </div>
                                    </div>
                                    <img src="<%=request.getContextPath()%>/img/mypage/타이틀이미지.png" alt="">
                                </div>


                                <span id="i-reservationSlick">
                                    <label for="slide01" class="right"><img src="<%=request.getContextPath()%>/img/부등호.png" alt="" width="20px"
                                            height="20px"></label>
                                </span>
                            </div>
                        </li>
                    </ul>
                </div>

                <h1 class="i-wishListh2">찜</h1>
                <div class="i-wishList">
                    <input type="radio" name="wishslide" id="wishListSlide01" checked>
                    <input type="radio" name="wishslide" id="wishListSlide02">
                    <input type="radio" name="wishslide" id="wishListSlide03">
                    <ul class="wishslidelist">
                        <li>
                            <div class="i-wishListTotal">
                                <span class="i-wishListSlick2">
                                    <label for="wishListSlide03"><img src="<%=request.getContextPath()%>/img/부등호.png" alt="" width="20px"
                                            height="20px"></label>
                                </span>
                                <section class="h-imgContainer">
                                    <div class="h-img-list">
                                        <a href=""> <img src="<%=request.getContextPath()%>/img/img-slide2-3.png" alt="no img">
                                            <h4>class-title</h4>
                                            <h5>category | location</h5>
                                        </a>
                                        <div class="h-wish-container">
                                            <input type="checkbox" checked="checked" id="i-favorite1"
                                                name="favorite-checkbox" value="favorite-button">
                                            <label for="i-favorite1" class="i-container">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
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
                                        <a href=""> <img src="<%=request.getContextPath()%>/img/img-slide2-3.png" alt="no img">
                                            <h4>class-title</h4>
                                            <h5>category | location</h5>
                                        </a>
                                        <div class="h-wish-container">
                                            <input type="checkbox" checked="checked" id="i-favorite2"
                                                name="favorite-checkbox" value="favorite-button">
                                            <label for="i-favorite2" class="i-container">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
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
                                        <a href=""> <img src="<%=request.getContextPath()%>/img/img-slide2-3.png" alt="no img">
                                            <h4>class-title</h4>
                                            <h5>category | location</h5>
                                        </a>
                                        <div class="h-wish-container">
                                            <input type="checkbox" checked="checked" id="i-favorite3"
                                                name="favorite-checkbox" value="favorite-button">
                                            <label for="i-favorite3" class="i-container">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
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
                                        <a href=""> <img src="<%=request.getContextPath()%>/img/img-slide2-3.png" alt="no img">
                                            <h4>class-title</h4>
                                            <h5>category | location</h5>
                                        </a>
                                        <div class="h-wish-container">
                                            <input type="checkbox" checked="checked" id="i-favorite4"
                                                name="favorite-checkbox" value="favorite-button">
                                            <label for="i-favorite4" class="i-container">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
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
                                <span class="i-wishListSlick">
                                    <label for="wishListSlide02"><img src="<%=request.getContextPath()%>/img/부등호.png" alt="" width="20px"
                                            height="20px"></label>
                                </span>
                            </div>
                        </li>
                        <li>
                            <div class="i-wishListTotal">
                                <span class="i-wishListSlick2">
                                    <label for="wishListSlide01"><img src="<%=request.getContextPath()%>/img/부등호.png" alt="" width="20px"
                                            height="20px"></label>
                                </span>
                                <section class="h-imgContainer">
                                    <div class="h-img-list">
                                        <a href=""> <img src="<%=request.getContextPath()%>/img/img-slide2-3.png" alt="no img">
                                            <h4>class-title</h4>
                                            <h5>category | location</h5>
                                        </a>
                                        <div class="h-wish-container">
                                            <input type="checkbox" checked="checked" id="i-favorite5"
                                                name="favorite-checkbox" value="favorite-button">
                                            <label for="i-favorite5" class="i-container">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
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
                                        <a href=""> <img src="<%=request.getContextPath()%>/img/img-slide2-3.png" alt="no img">
                                            <h4>class-title</h4>
                                            <h5>category | location</h5>
                                        </a>
                                        <div class="h-wish-container">
                                            <input type="checkbox" checked="checked" id="i-favorite6"
                                                name="favorite-checkbox" value="favorite-button">
                                            <label for="i-favorite6" class="i-container">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
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
                                        <a href=""> <img src="<%=request.getContextPath()%>/img/img-slide2-3.png" alt="no img">
                                            <h4>class-title</h4>
                                            <h5>category | location</h5>
                                        </a>
                                        <div class="h-wish-container">
                                            <input type="checkbox" checked="checked" id="i-favorite7"
                                                name="favorite-checkbox" value="favorite-button">
                                            <label for="i-favorite7" class="i-container">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
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
                                        <a href=""> <img src="<%=request.getContextPath()%>/img/img-slide2-3.png" alt="no img">
                                            <h4>class-title</h4>
                                            <h5>category | location</h5>
                                        </a>
                                        <div class="h-wish-container">
                                            <input type="checkbox" checked="checked" id="i-favorite8"
                                                name="favorite-checkbox" value="favorite-button">
                                            <label for="i-favorite8" class="i-container">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
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
                                <span class="i-wishListSlick">
                                    <label for="wishListSlide03"><img src="<%=request.getContextPath()%>/img/부등호.png" alt="" width="20px"
                                            height="20px"></label>
                                </span>
                            </div>
                        </li>
                        <li>
                            <div class="i-wishListTotal">
                                <span class="i-wishListSlick2">
                                    <label for="wishListSlide02"><img src="<%=request.getContextPath()%>/img/부등호.png" alt="" width="20px"
                                            height="20px"></label>
                                </span>
                                <section class="h-imgContainer">
                                    <div class="h-img-list">
                                        <a href=""> <img src="<%=request.getContextPath()%>/img/img-slide2-3.png" alt="no img">
                                            <h4>class-title</h4>
                                            <h5>category | location</h5>
                                        </a>
                                        <div class="h-wish-container">
                                            <input type="checkbox" checked="checked" id="i-favorite9"
                                                name="favorite-checkbox" value="favorite-button">
                                            <label for="i-favorite9" class="i-container">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
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
                                        <a href=""> <img src="<%=request.getContextPath()%>/img/img-slide2-3.png" alt="no img">
                                            <h4>class-title</h4>
                                            <h5>category | location</h5>
                                        </a>
                                        <div class="h-wish-container">
                                            <input type="checkbox" checked="checked" id="i-favorite10"
                                                name="favorite-checkbox" value="favorite-button">
                                            <label for="i-favorite10" class="i-container">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
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
                                <span class="i-wishListSlick">
                                    <label for="wishListSlide01"><img src="<%=request.getContextPath()%>/img/부등호.png" alt="" width="20px"
                                            height="20px"></label>
                                </span>
                            </div>
                    </ul>
            </section>
        </div>

    </div>

<%@ include file="/views/common/footer.jsp"%>