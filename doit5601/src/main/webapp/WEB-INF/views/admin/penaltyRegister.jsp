<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 - 패널티 부여</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    .wf-input { background-color: #f8f9fa; border: 1px solid #ced4da; padding: 12px; border-radius: 4px; width: 100%; }
    .wf-label { font-weight: bold; margin-bottom: 8px; display: block; }
    .btn-wf-action { background-color: #dc3545; color: #fff; padding: 12px 40px; font-weight: bold; border: none; }
</style>
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-6 card p-4 shadow-sm border-danger-subtle">
            <h4 class="fw-bold mb-4 text-danger">패널티 부여 등록</h4>
            <form method="POST" action="${ pageContext.request.contextPath }/admin/penalty/register">
            
            	<%-- 이전 페이지 URL --%>
            	<input type="hidden" name="url" value="${ url }">
            
                <div class="mb-3">
                    <label class="wf-label">부여 대상 유저</label>
                    <input type="text" class="wf-input" value="${ userId }" name="userId" readonly>
                </div>
                <div class="mb-3">
                    <label class="wf-label">부여 점수 선택</label>
                    <select class="form-select wf-input" name="penaltyScore">
                        <option value="1">1점</option>
                        <option value="2">2점</option>
                        <option value="3">3점</option>
                        <option value="4">4점</option>
                    </select>
                </div>
                <%--
                <div class="mb-4">
                    <label class="wf-label">부여 사유</label>
                    <textarea class="wf-input" name="penaltyReason" rows="4" placeholder="상세 사유를 입력하세요."></textarea>
                </div>
                --%>
                <div class="d-flex gap-2">
                    <button type="submit" class="btn btn-wf-action flex-grow-1">패널티 등록</button>
                    <button type="reset" class="btn btn-outline-secondary">초기화</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>