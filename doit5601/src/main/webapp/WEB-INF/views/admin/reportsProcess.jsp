<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 - 신고 처리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    .wf-input { background-color: #f8f9fa; border: 1px solid #ced4da; padding: 12px; border-radius: 4px; width: 100%; }
    .wf-label { font-weight: bold; margin-bottom: 8px; display: block; color: #333; }
    .info-box { background-color: #fff; border: 1px solid #ced4da; padding: 20px; border-radius: 4px; margin-bottom: 25px; }
    .btn-wf-action { background-color: #212529; color: #fff; padding: 12px 40px; font-weight: bold; border: none; }
    .section-title { border-left: 5px solid #212529; padding-left: 15px; margin-bottom: 20px; font-weight: bold; }
</style>
</head>
<body class="bg-light">
<div class="container py-4">
    <h4 class="fw-bold mb-4 text-center">신고 상세 정보 및 처리</h4>
    
    <form action="">
        <div class="info-box shadow-sm">
            <h5 class="section-title">신고 접수 내용</h5>
            <div class="row mb-3">
                <div class="col-md-4">
                    <label class="wf-label">신고자</label>
                    <div class="wf-input">홍길동</div>
                </div>
                <div class="col-md-8">
                    <label class="wf-label">신고 제목</label>
                    <div class="wf-input">광고글 신고합니다.</div>
                </div>
            </div>
            <div class="mb-3">
                <label class="wf-label">신고 상세 내용</label>
                <div class="wf-input" style="min-height: 120px; white-space: pre-wrap;">광고글 신고합니다. 삭제 처리 해주세요.</div>
            </div>
            <div class="text-end">
                <button type="button" class="btn btn-outline-primary btn-sm">신고 대상 확인(상품/경매)</button>
            </div>
        </div>

        <div class="info-box shadow-sm">
            <h5 class="section-title text-primary">처리 답변 입력</h5>
            <div class="mb-4">
                <label class="wf-label">답변 내용</label>
                <textarea class="wf-input" rows="6" name="reportResponse" placeholder="신고자에게 전달될 처리 결과를 입력하세요."></textarea>
            </div>
            <div class="d-flex gap-2">
                <button type="submit" class="btn btn-wf-action flex-grow-1">처리 완료</button>
                <button type="reset" class="btn btn-outline-secondary">초기화</button>
                <button type="button" class="btn btn-outline-dark" onclick="history.back()">목록으로</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>