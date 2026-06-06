<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 - 회원 상세 정보</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    .info-card { background-color: #ffffff; border: 1px solid #ced4da; border-radius: 4px; overflow: hidden; }
    .info-header { font-weight: bold; background-color: #f8f9fa; border-bottom: 1px solid #ced4da; padding: 15px 20px; }
    .info-row { display: flex; border-bottom: 1px solid #dee2e6; align-items: stretch; }
    .info-row:last-child { border-bottom: none; }
    .info-item { display: flex; width: 50%; align-items: center; }
    .info-label { background-color: #f1f3f5; font-weight: bold; width: 140px; padding: 12px 20px; border-right: 1px solid #ced4da; flex-shrink: 0; }
    .info-value { padding: 12px 20px; flex-grow: 1; background-color: #fff; }
    .btn-wf { background-color: #e9ecef; border: 1px solid #ced4da; padding: 8px 30px; font-weight: bold; color: #212529; transition: all 0.2s; text-decoration: none; display: inline-block; }
    .btn-wf:hover { background-color: #dee2e6; border-color: #adb5bd; color: #000; }
    @media (max-width: 768px) {
        .info-row { flex-direction: column; }
        .info-item { width: 100%; border-bottom: 1px solid #dee2e6; }
        .info-item:last-child { border-bottom: none; }
    }
</style>
</head>
<body class="bg-light">

<div class="container mt-5 mb-5">
    <div class="row mb-4">
        <div class="col-12">
            <h1 class="fw-bold">회원 상세 정보</h1>
        </div>
    </div>

    <div class="info-card shadow-sm mb-4">
        <div class="info-header">기본 계정 정보</div>
        <div class="info-body p-0">
            <div class="info-row">
                <div class="info-item">
                    <div class="info-label">회원고유키</div>
                    <div class="info-value">${user.userKey}</div>
                </div>
                <div class="info-item border-start">
                    <div class="info-label">아이디</div>
                    <div class="info-value">${user.userId}</div>
                </div>
            </div>
            
            <div class="info-row">
                <div class="info-item">
                    <div class="info-label">이름</div>
                    <div class="info-value">${user.userName}</div>
                </div>
                <div class="info-item border-start">
                    <div class="info-label">주민번호</div>
                    <div class="info-value">${user.userSsn}</div>
                </div>
            </div>
            
            <div class="info-row">
                <div class="info-item">
                    <div class="info-label">이메일</div>
                    <div class="info-value">${user.userEmail}</div>
                </div>
                <div class="info-item border-start">
                    <div class="info-label">전화번호</div>
                    <div class="info-value">${user.userTel}</div>
                </div>
            </div>

            <div class="info-row">
                <div class="info-label">주소</div>
                <div class="info-value">${user.userAddress}</div>
            </div>

            <div class="info-row">
                <div class="info-item">
                    <div class="info-label">가입일시</div>
                    <div class="info-value">${user.userCreated}</div>
                </div>
                <div class="info-item border-start">
                    <div class="info-label">계정 상태</div>
                    <div class="info-value">
                        <c:choose>
                            <c:when test="${user.userStatus == '제재중'}">
                                <span class="badge bg-danger">제재 중</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge bg-primary">정상 활동 중</span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="d-flex justify-content-end mt-4">
        <a href="${pageContext.request.contextPath}/admin/show-all-users" class="btn btn-wf">돌아가기</a>
    </div>
</div>

</body>
</html>