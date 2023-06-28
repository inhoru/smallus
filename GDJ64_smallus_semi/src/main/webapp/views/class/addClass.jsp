<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/hostHeader.jsp"%>
<%-- <%@ include file="/views/common/mainHeader.jsp"%> --%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/class/addClass.css" />
	
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<div id="mainOpacity">
	<section id="d-addClass">
	<form action="<%=request.getContextPath() %>/host/addClassEnd.do" method="post" enctype="multipart/form-data">
		<br> <br>
		<h3>클래스 등록하기 </h3>
		<hr>
		<div id="inputs">
			<p>클래스 이름</p>
			<input type="text" name="classTitle" placeholder="등록하실 클래스명을 입력해주세요." required>
			<p>등록할 사진</p>
				<!--<img src="https://img.freepik.com/free-icon/add-button-with-plus-symbol-in-a-black-circle_318-48599.jpg"
				width="200" height="200" alt=""> -->
				<input type="file" name="classThumbnail" required><button>추가</button><button>삭제</button>
			<p>※첫번째 사진이 썸네일로 등록됩니다.</p>
			<br>
			<p>카테고리</p>
			<select name="category">
				<option value="COO">요리</option>
				<option value="CRA">공예</option>
				<option value="BEA">뷰티</option>
				<option value="EXE">운동</option>
			</select>
			<p>클래스 회당 인원제한</p>
			<input type="number" name="classPersonnel" placeholder="최대 인원수를 입력해주세요." required>명
			<p>1인당 클래스 금액</p>
			<input type="number" name="classPrice" placeholder="금액을 입력해주세요." required>원
			<p>주소</p>
			<!-- <input type="text" id="sample4_postcode" placeholder="우편번호"> -->
			<input type="button" onclick="sample4_execDaumPostcode()" value="주소 찾기"><br>
			<input type="text" id="sample4_roadAddress" name="classAddress" placeholder="주소 입력(버튼 이용)" readonly required>
			<!-- <input type="text" id="sample4_jibunAddress" placeholder="지번주소"> -->
			<span id="guide" style="color:#999;display:none"></span>
			<input type="text" id="sample4_detailAddress" name="classAddressDetail" placeholder="상세주소">
			<!-- <input type="text" id="sample4_extraAddress" placeholder="참고항목"> -->
			
			<p>제공사항</p>
			<input type="text" name="classOffer" placeholder="제공사항을 입력해주세요." required>
			<p>유의사항</p>
			<input type="text" name="classNotice" placeholder="유의사항을 입력해주세요." required>
			<p>준비물</p>
			<input type="text" name="classSupplies" placeholder="준비물을 입력해주세요.">
			<p>상세 내용</p>
			<textarea name="classDetail" id="" cols="80" rows="10"
				placeholder="글자는 최대 500자까지 작성 가능합니다."></textarea>
			<p>스케쥴 등록</p>
			<div id="AddSchedule-calendar">
					<input type="text" name="datetimes" readonly/><button>추가</button><button>삭제</button> <br>
					<input type="text" name="datetimes" readonly/><button>추가</button><button>삭제</button> <br>
					<input type="text" name="datetimes" readonly/><button>추가</button><button>삭제</button> <br>
					<input type="text" name="datetimes" readonly/><button>추가</button><button>삭제</button> <br>
			</div>
		</div>
		<br> <br> <input type="submit" value="등록하기"> <br>
		<br> <br> <br>
		</form>
		</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(function() {
	  $('input[name="datetimes"]').daterangepicker({
//		  singleDatePicker: true,
		  showDropdowns: true,
	    timePicker: true,
	    startDate: moment().startOf('hour'),
	    endDate: moment().startOf('hour').add(32, 'hour'),
	    locale: {
	      format: 'YYYY-MM-DD HH:mm',
	      "separator": " ~ ",                     // 시작일시와 종료일시 구분자
		    "applyLabel": "확인",                    // 확인 버튼 텍스트
		    "cancelLabel": "취소",                   // 취소 버튼 텍스트
		    "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
		    "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
	    }
	  });
	});

    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다. -> 도로명주소 하나로 통일함. 우편번호 출력x
                /* document.getElementById('sample4_postcode').value = data.zonecode; */
                document.getElementById("sample4_roadAddress").value = roadAddr;
                /* document.getElementById("sample4_jibunAddress").value = data.jibunAddress; */
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    /* document.getElementById("sample4_extraAddress").value = extraRoadAddr; */
                	document.getElementById("sample4_roadAddress").value += extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
               /*  if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block'; 

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                } */
            }
        }).open();
    }    
    
</script>




		<%-- <%@ include file="/views/common/footer.jsp"%> --%>
		<%@ include file="/views/common/hostFooter.jsp"%>