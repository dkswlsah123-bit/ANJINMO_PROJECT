<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 - 패널티 취소</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    .wf-input { background-color: #f8f9fa; border: 1px solid #ced4da; padding: 12px; border-radius: 4px; width: 100%; }
    .wf-label { font-weight: bold; margin-bottom: 8px; display: block; color: #333; }
    .btn-wf-action { background-color: #212529; color: #fff; padding: 10px 40px; font-weight: bold; border: none; }
</style>
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-6 card p-4 shadow-sm">
            <h4 class="fw-bold mb-4 border-bottom pb-2">패널티 취소 처리</h4>
            <form action="">
                <input type="hidden" value="회원 고유키">
                <div class="mb-3">
                    <label class="wf-label">대상 유저</label>
                    <input type="text" class="wf-input" value="회원1" disabled>
                </div>
                <div class="row mb-3">
                    <div class="col-md-4">
                        <label class="wf-label">기존 점수</label>
                        <input type="text" class="wf-input text-danger fw-bold text-center" value="2" disabled>
                    </div>
                    <div class="col-md-8">
                        <label class="wf-label">기존 부여 사유</label>
                        <input type="text" class="wf-input" value="광고 행위" disabled>
                    </div>
                </div>
                <div class="mb-4">
                    <label class="wf-label text-primary">취소 사유 입력</label>
                    <textarea class="wf-input" rows="3" placeholder="패널티를 취소하는 명확한 근거를 입력하세요."></textarea>
                </div>
                <div class="d-flex gap-2">
                    <button type="submit" class="btn btn-wf-action flex-grow-1">취소 등록</button>
                    <button type="button" class="btn btn-outline-secondary" onclick="history.back()">뒤로가기</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>