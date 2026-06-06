<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 - 경매 상세 조회</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    .info-card { background: #fff; border: 1px solid #ced4da; border-radius: 4px; overflow: hidden; }
    .info-header { font-weight: bold; background: #f8f9fa; border-bottom: 1px solid #ced4da; padding: 15px 20px; }
    .info-row { display: flex; border-bottom: 1px solid #dee2e6; }
    .info-label { width: 180px; background-color: #f8f9fa; padding: 15px; font-weight: bold; border-right: 1px solid #dee2e6; }
    .info-value { flex: 1; padding: 15px; }
    .detail-img { max-width: 250px; border: 1px solid #dee2e6; border-radius: 4px; }
</style>
</head>
<body class="bg-light">
<div class="container py-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h4 class="fw-bold">경매 상세 정보</h4>
        <div>
            <button class="btn btn-outline-dark me-2">경매 중지 및 비공개</button>
            <button class="btn btn-danger">삭제 및 패널티 부여</button>
        </div>
    </div>
    
    <div class="info-card shadow-sm mb-4">
        <div class="info-header">상품 및 경매 정보</div>
        <div class="info-row">
            <div class="info-label">상품 이미지</div>
            <div class="info-value text-center"><img src="${ pageContext.request.contextPath }/images/tempFigureImage.png" class="detail-img"></div>
        </div>
        <div class="info-row">
            <div class="info-label">상품명 / 별칭</div>
            <div class="info-value">하츠네 미쿠 한정판 / 비싼 피규어</div>
        </div>
        <div class="info-row">
            <div class="info-label">현재가</div>
            <div class="info-value text-primary fw-bold">165,000원</div>
        </div>
        <div class="info-row">
            <div class="info-label">경매 종료 예정</div>
            <div class="info-value">2026-04-25 18:55 (남은시간: 4일 12시간)</div>
        </div>
    </div>

    <div class="info-card shadow-sm">
        <div class="info-header">상세 설명</div>
        <div class="p-4" style="min-height: 150px;">
            예약 구매로 구매해서 6개월 만에 받은 피규어입니다. 장식장 전시품이라 상태 최상입니다.
        </div>
    </div>
</div>
</body>
</html>