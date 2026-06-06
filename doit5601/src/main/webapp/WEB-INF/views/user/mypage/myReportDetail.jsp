<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>신고 상세 정보</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .wf-input { background-color: #e9ecef; border: none; padding: 12px; border-radius: 5px; min-height: 48px; }
        .wf-label { font-weight: bold; margin-bottom: 8px; display: block; color: #333; }
        .btn-wf { background-color: #e9ecef; border: 1px solid #ced4da; padding: 10px 40px; font-weight: bold; }
        .section-title { border-left: 5px solid #ced4da; padding-left: 15px; margin-bottom: 25px; font-weight: bold; }
        .process-box { border: 2px solid #ced4da; border-radius: 10px; padding: 25px; margin-top: 40px; }
    </style>
</head>
<body class="bg-light">
<div class="container mt-5 mb-5">
    <div class="row justify-content-center">
        <div class="col-lg-10 bg-white p-5 border shadow-sm">
            <h4 class="section-title">신고 정보</h4>
            
            <div class="row mb-4">
                <div class="col-md-3">
                    <label class="wf-label">종류</label>
                    <div class="wf-input">${empty dto.reportType ? '미분류' : dto.reportType}</div>
                </div>
                <div class="col-md-3">
                    <label class="wf-label">카테고리</label>
                    <div class="wf-input">${dto.category}</div>
                </div>
                <div class="col-md-6">
                    <label class="wf-label">신고 대상 이름</label>
                    <div class="wf-input">${dto.targetName}</div>
                </div>
            </div>

            <div class="mb-4">
                <label class="wf-label">신고일자</label>
                <div class="wf-input">${dto.createdAt}</div>
            </div>

            <div class="mb-4">
                <label class="wf-label">신고 상세 내용</label>
                <div class="wf-input" style="min-height: 150px; white-space: pre-wrap;">${dto.reportReason}</div>
            </div>

            <%-- 처리 결과 섹션 (데이터가 있을 때만 출력) --%>
            <c:choose>
                <c:when test="${not empty dto.status && dto.status != '대기'}">
                    <div class="process-box bg-white">
                        <h5 class="fw-bold mb-3">처리 결과: ${dto.status}</h5>
                        <div class="mb-3">
                            <label class="wf-label">처리 사유</label>
                            <p class="mb-0">${dto.processReason}</p>
                        </div>
                        <div class="text-muted small">처리 일시: ${dto.processAt}</div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="process-box bg-light text-center">
                        <h5 class="fw-bold text-muted mb-0">⏳ 현재 처리 대기 중입니다.</h5>
                    </div>
                </c:otherwise>
            </c:choose>

            <div class="d-flex justify-content-center mt-5">
                <button type="button" class="btn btn-wf" onclick="history.back();">목록으로 돌아가기</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>