<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 신고</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="${ctx}/css/common.css" />
<script src="https://code.jquery.com/jquery.min.js"></script>
<style>
body {
	background-color: #f8f9fa;
}

.page-title {
	font-weight: 800;
	color: #222;
	font-size: 1.6rem;
}

.report-card {
	background: #fff;
	border: 1px solid #e9ecef;
	border-radius: 12px;
	padding: 32px;
}

.product-summary {
	display: flex;
	align-items: center;
	gap: 16px;
	background-color: #f8f9fa;
	border: 1px solid #e9ecef;
	border-radius: 10px;
	padding: 16px;
	margin-bottom: 24px;
}

.product-summary img {
	width: 60px;
	height: 60px;
	object-fit: cover;
	border-radius: 8px;
	border: 1px solid #dee2e6;
}

.section-title {
	font-size: 13px;
	font-weight: 700;
	color: #555;
	margin-bottom: 12px;
	padding-bottom: 8px;
	border-bottom: 2px solid #eee;
	text-transform: uppercase;
	letter-spacing: 0.5px;
}

.form-label {
	font-size: 13px;
	color: #333;
	font-weight: 600;
}

.form-control, .form-select {
	font-size: 14px;
	border-radius: 8px;
}

.form-control:focus, .form-select:focus {
	box-shadow: none;
	border-color: #adb5bd;
}

.btn-cancel {
	background-color: #fff;
	color: #555;
	border: 1px solid #dee2e6;
	border-radius: 8px;
	font-weight: 600;
	font-size: 15px;
}

.btn-cancel:hover {
	background-color: #f8f9fa;
}

.btn-report {
	background-color: #dc3545;
	color: #fff;
	border: none;
	border-radius: 8px;
	font-weight: 700;
	font-size: 15px;
}

.btn-report:hover {
	background-color: #bb2d3b;
	color: #fff;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div class="container py-5" style="max-width: 620px;">

		<div class="mb-4">
			<h2 class="page-title">상품 신고</h2>
			<p class="text-muted small mb-0">허위 신고 시 본인에게 패널티가 부여될 수 있습니다.</p>
		</div>

		<div class="report-card">

			<%-- 에러 메시지 --%>
			<c:if test="${not empty errorMsg}">
				<div class="alert alert-danger">${errorMsg}</div>
			</c:if>

			<%-- 신고 대상 상품 요약 --%>
			<p class="section-title">신고 대상 상품</p>
			<div class="product-summary mb-4">
				<c:choose>
					<c:when test="${not empty product.imagePath1}">
						<img src="${ctx}/${product.imagePath1}" alt="">
					</c:when>
					<c:otherwise>
						<img src="https://placehold.co/60x60/f8f9fa/adb5bd?text=No" alt="">
					</c:otherwise>
				</c:choose>
				<div>
					<p class="fw-bold mb-0" style="font-size: 15px;">${product.productReleaseName}</p>
					<p class="text-muted small mb-0">${product.manufacturerName}·
						${product.productGradeName}</p>
				</div>
			</div>

			<%-- 신고 폼 --%>
			<p class="section-title">신고 내용</p>
			<form action="${ctx}/product/report" method="post">
				<input type="hidden" name="productId" value="${product.productId}">

				<div class="mb-3">
					<label class="form-label">신고 유형 <span class="text-danger">*</span></label>
					<select name="reportTypeId" class="form-select" required>
						<option value="">선택하세요</option>
						<c:forEach var="t" items="${reportTypeList}">
							<option value="${t.reportTypeId}">${t.reportTypeName}</option>
						</c:forEach>
					</select>
				</div>

				<div class="mb-4">
					<label class="form-label">신고 사유 <span class="text-danger">*</span></label>
					<textarea name="reportContent" class="form-control" rows="5"
						maxlength="500" required placeholder="신고 사유를 상세히 입력해주세요 (최대 500자)"
						oninput="document.getElementById('cnt').innerText=this.value.length"></textarea>
					<div class="text-end text-muted small mt-1">
						<span id="cnt">0</span> / 500
					</div>
				</div>

				<div class="alert small mb-4"
					style="background-color: #fff5f5; border: 1px solid #f5c6cb; color: #842029;">
					신고 내용은 관리자가 검토 후 처리 결과를 알려드립니다.</div>

				<div class="d-flex gap-2">
					<button type="button" class="btn w-50 py-2 fw-bold"
						style="background-color: #f1f1f1; color: #555; border: 1px solid #ddd; border-radius: 8px;"
						onclick="location.href='${ctx}/product/detail?productId=${product.productId}'">취소</button>
					<button type="submit" class="btn w-50 py-2 fw-bold"
						style="background-color: #dc3545; color: #fff; border: none; border-radius: 8px;">신고
						제출</button>
				</div>
			</form>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
