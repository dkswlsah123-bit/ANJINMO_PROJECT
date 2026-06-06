<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
<style>
        .navbar-brand { font-weight: 700; color: #4F46E5 !important; }
        .main-img { width: 100%; height: 360px; object-fit: cover; border-radius: 8px; }
        .thumb-img { width: 70px; height: 70px; object-fit: cover; border-radius: 6px; border: 2px solid transparent; cursor: pointer; }
        .thumb-img.active { border-color: #0d6efd; }
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
function updateCount(el) {
    document.getElementById('charCount').textContent = el.value.length;
}
</script>    
</head>
<body class="bg-light">
<%-- 네비게이션 바 --%>
<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="${ctx}/main/">AUCTION GO</a>
        </div>
    </div>
</nav>

<%-- Servlet에서 에러 메시지 전달 시 표시 --%>
<c:if test="${not empty errorMsg}">
    <div class="container mt-3">
        <div class="alert alert-danger">${errorMsg}</div>
    </div>
</c:if>

<%-- Servlet에서 request.setAttribute("auction", auctionVO) 전달 --%>
<div class="container py-4">
    <div class="bg-white rounded-3 p-4 shadow-sm" style="max-width: 520px; margin: 0 auto;">
        <div class="d-flex align-items-center gap-2 mb-4">          
            <h5 class="fw-bold mb-0">경매 신고</h5>
        </div>

        <%-- 신고 대상 경매 표시 --%>
        <div class="alert alert-light border mb-4">
            <p class="mb-0 text-muted small">신고 대상 경매</p>
            <p class="fw-semibold mb-0">${auction.auctionTitle}</p>
        </div>

        <%-- POST /auction/report 로 전송 (Servlet에서 처리) --%>
<form action="${ctx}/auction/report" method="post">
    <input type="hidden" name="auctionId" value="${auction.auctionId}">

    <%-- 신고 유형 --%>
    <div class="mb-3">
        <label class="form-label fw-semibold">신고 유형 <span class="text-danger">*</span></label>
        <select name="reportTypeId" class="form-select" required>
            <option value="">선택하세요</option>
            
            <%-- [실제 운영 시] Servlet에서 데이터를 보내줄 때 활성화 --%>
            <c:forEach var="t" items="${reportTypeList}">
                <option value="${t.typeId}">${t.typeName}</option>
            </c:forEach>

            <%-- [테스트/수동 추가용] --%>
            <c:if test="${empty reportTypeList}">
                <option value="1">도배</option>
                <option value="2">광고</option>
                <option value="3">개인정보기재</option>
                <option value="4">기타</option>
            </c:if>
        </select>
    </div>

            <%-- 신고 사유 (최대 500자) --%>
            <div class="mb-4">
                <label class="form-label fw-semibold">신고 사유 <span class="text-danger">*</span></label>
                <textarea name="reportContent" id="reportContent" class="form-control" rows="5"
                          required maxlength="500"
                          placeholder="구체적인 신고 사유를 입력해 주세요 (최대 500자)"
                          oninput="updateCount(this)"></textarea>
                <p class="text-end text-muted small mt-1"><span id="charCount">0</span> / 500</p>
            </div>

            <div class="d-flex gap-2">
                <button type="button" onclick="history.back()" class="btn btn-outline-secondary w-50">취소</button>
                <button type="submit" class="btn btn-danger w-50">
                   신고 제출
                </button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
