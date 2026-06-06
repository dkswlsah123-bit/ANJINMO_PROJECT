<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title id="pageTitle">신고 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.wf-input {
	background-color: #e9ecef;
	border: none;
	padding: 10px;
}

.wf-label {
	font-weight: bold;
	margin-bottom: 5px;
	display: block;
}

.btn-wf {
	background-color: #e9ecef;
	border: 1px solid #ced4da;
	padding: 10px 30px;
	font-weight: bold;
}
</style>
	<script>
	    window.onload = function() {
        // URL에서 파라미터 가져오기 (예: ?type=auction&name=맥북)
        const urlParams = new URLSearchParams(window.location.search);
        const type = urlParams.get('type'); // 'auction' 또는 'product'
        const name = urlParams.get('name'); // 신고 대상 이름

        const titleText = (type === 'auction') ? '경매' : '상품';
        
        // 화면 글자 바꿔치기
        document.getElementById("pageTitle").innerText = titleText + " 신고";
        document.getElementById("mainHeading").innerText = titleText + " 신고";
        document.getElementById("targetLabel").innerText = titleText + " 이름";
        document.getElementById("targetName").value = name || "";
        document.getElementById("hiddenType").value = type;
    };

    document.getElementById("reportForm").onsubmit = function() {
        const type = document.getElementById("REPORT_TYPE").value;
        const content = document.getElementById("REPORT_CONTENT").value;

        if(!type) {
            alert("신고 유형을 선택해주세요.");
            return false;
        }
        if(!content.trim()) {
            alert("신고 사유를 입력해주세요.");
            return false;
        }
        return confirm("정말로 신고하시겠습니까?");
    };
</script>
</head>
<body>

	<div class="container mt-5">
		<div class="row mb-5">
			<div class="col-12">
				<h1 class="fw-bold" id="mainHeading">신고</h1>
			</div>
		</div>

		<div class="d-flex align-items-start" style="gap: 50px;">
			<div style="flex: 0 0 450px;">
				<div
					class="ratio ratio-1x1 bg-light border d-flex align-items-center justify-content-center">
					<span class="text-muted fw-bold">상품 대표 이미지</span>
				</div>
			</div>

			<div class="flex-grow-1">
				<form id="reportForm"
					action="${pageContext.request.contextPath}/report/report-submit"
					method="post">
					<div class="mb-4">
						<label class="wf-label" id="targetLabel">이름</label> <input
							type="text" id="targetName" name="REPORT_TARGET_NAME"
							class="form-control wf-input" readonly>
					</div>

					<div class="mb-4">
						<label class="wf-label">신고 유형</label> <select name="REPORT_TYPE"
							id="REPORT_TYPE" class="form-select wf-input">
							<option value="" selected disabled>신고 유형을 선택하세요</option>
							<option value="SPAM">도배</option>
							<option value="AD">광고</option>
							<option value="PRIVACY">개인정보 기재</option>
							<option value="ETC">기타</option>
						</select>
					</div>

					<div class="mb-5">
						<label class="wf-label">신고 사유</label>
						<textarea name="REPORT_CONTENT" id="REPORT_CONTENT"
							class="form-control wf-input" rows="8"
							placeholder="상세 사유를 입력하세요."></textarea>
					</div>

					<div class="d-flex justify-content-center" style="gap: 100px;">
						<button type="submit" class="btn btn-wf px-5">신고</button>
						<button type="button" class="btn btn-wf px-5"
							onclick="history.back();">취소</button>
					</div>

					<input type="hidden" name="TYPE" id="hiddenType">
				</form>
			</div>
		</div>
	</div>


</body>
</html>