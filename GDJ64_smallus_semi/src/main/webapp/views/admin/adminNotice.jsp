<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/admin/adminHeader.jsp"%>
<body>
<div id="mainOpacity h-host-main">
        <section class="h-main">
            <div class="h-main-title">
                <h2>공지사항</h2>
                <!-- 공지사항 추가페이지로 이동 -->
                <div class="h-viewList"><a href="<%=request.getContextPath()%>/views/admin/adminEnrollNotice.jsp">+</a></div>
            </div>
        </section>
        <section class="h-main h-main-rsvList">
            <div>
                <table id="h-main-rsv-tbl">
                    <tr>
                    	<th>종류</th>
                        <th>제목</th>
                        <th>작성일</th>
                        <th>작성자</th>
                        <th></th>
                    </tr>
                    <tr>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td><button>삭제</button></td>
                    </tr>
                    <tr>
                        <td colspan="5">등록된 공지사항이 없습니다.</td>
                    </tr>
                </table>
            </div>
        </section>
</body>
<%@ include file="/views/host/hostFooter.jsp"%>