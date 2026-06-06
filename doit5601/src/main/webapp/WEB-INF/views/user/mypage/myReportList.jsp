<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>내 신고 이력 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    /* 기존 스타일 계승 */
    .wf-header {
        font-weight: bold;
        background-color: #f8f9fa;
        border-bottom: 2px solid #ced4da;
        position: sticky; /* 스크롤 내려도 헤더는 고정 */
        top: 0;
        z-index: 10;
    }
    
    .report-row {
        cursor: pointer;
        transition: background-color 0.2s;
    }
    
    .report-row:hover {
        background-color: #f1f3f5;
    }
    
    .btn-wf {
        background-color: #e9ecef;
        border: 1px solid #ced4da;
        padding: 8px 30px;
        font-weight: bold;
    }

    /* 스크롤바 적용 영역 */
    .table-container {
        border: 1px solid #ced4da;
        background-color: #ffffff;
        
        /* 스크롤 핵심 속성 */
        height: 500px;       /* 고정 높이 설정 */
        overflow-y: auto;    /* 세로 내용 많으면 스크롤 생성 */
    }

    /* 테이블 스타일 조정 */
    .table {
        margin-bottom: 0;    /* 테이블 하단 여백 제거 */
    }

    th, td {
        padding: 15px !important;
        vertical-align: middle;
    }

    .status-approve { color: #198754; font-weight: bold; }
    .status-wait { color: #6c757d; font-weight: bold; }
</style>
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row mb-4">
        <div class="col-12">
            <h1 class="fw-bold">내 신고 이력 목록</h1>
        </div>
    </div>

    <div class="table-container">
        <table class="table text-center table-hover">
            <thead class="wf-header">
                <tr>
                    <th>종류</th>
                    <th>유형</th>
                    <th>이름</th>
                    <th>신고일자</th>
                    <th>처리결과</th>
                    <th>처리일자</th>
                </tr>
            </thead>
           <tbody>
    <c:choose>
        <c:when test="${not empty reportList}">
            <c:forEach var="report" items="${reportList}">
                <tr class="report-row" onclick="location.href='${pageContext.request.contextPath}/user/mypage/myreport-detail?reportId=${report.reportId}'">
                    <td>${report.reportType}</td> <td>${report.category}</td>   <td>${report.targetName}</td> <td>${report.createdAt}</td>  <td class="${report.status == '승인' ? 'status-approve' : 'status-wait'}">
                        ${report.status}
                    </td>
                    <td>${empty report.processAt ? '-' : report.processAt}</td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td colspan="6" class="text-center p-5">신고 내역이 존재하지 않습니다.</td>
            </tr>
        </c:otherwise>
    </c:choose>
</tbody>
        </table>
    </div>

    <div class="d-flex justify-content-end mt-4">
        <button type="button" class="btn btn-wf" onclick="history.back();">돌아가기</button>
    </div>
</div>

</body>
</html>