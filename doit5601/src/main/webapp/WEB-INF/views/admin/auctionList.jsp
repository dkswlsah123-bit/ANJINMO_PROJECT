<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 - 전체 경매 관리</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<style>
	/* productList.jsp와 동일한 스타일 적용 [cite: 144, 145] */
	.wf-header {
		font-weight: bold;
		background-color: #f8f9fa;
		border-bottom: 2px solid #ced4da;
	}
	
	.table-container {
		border: 1px solid #ced4da;
		background-color: #ffffff;
		min-height: 600px;
	}
	
	.product-thumb {
		width: 60px;
		height: 60px;
		object-fit: cover;
		border-radius: 4px;
		border: 1px solid #dee2e6;
	}
	
	th, td {
		padding: 12px !important;
		vertical-align: middle;
		text-align: center;
	}
	
	/* 페이지네이션 디자인 통일 [cite: 148, 150, 152] */
	.pagination .page-link {
		color: #212529;
		border-color: #dee2e6;
		padding: 8px 16px;
	}
	
	.pagination .page-item.active .page-link {
		background-color: #212529 !important;
		border-color: #212529 !important;
		color: #ffffff !important;
	}
	
	.pagination .page-link:hover {
		background-color: #f1f3f5;
		color: #212529;
	}
	
	.page-item .page-link span {
		font-size: 0.9rem;
	}
	
	/* 필터 버튼 스타일 커스텀 [cite: 155, 156, 157] */
	.filter-container {
		background-color: #ffffff;
		padding: 15px 20px;
		border: 1px solid #ced4da;
		border-radius: 4px;
		margin-bottom: 20px;
	}
	
	.btn-check:checked+.btn-outline-dark {
		background-color: #212529;
		color: #ffffff;
	}
	
	.btn-outline-dark {
		border-color: #ced4da;
		color: #495057;
		font-size: 0.95rem;
		padding: 6px 20px;
	}
	
	.btn-outline-dark:hover {
		background-color: #f8f9fa;
		color: #212529;
		border-color: #212529;
	}
	
	/* 관리 버튼 공통 스타일 [cite: 159, 160, 161] */
	.btn-admin-custom {
		width: 80px !important;
		padding: 4px 0 !important;
		font-size: 0.85rem !important;
		text-align: center;
		display: inline-block;
	}
	
	/* 비활성화 버튼 스타일 [cite: 162, 165, 166] */
	.btn-action-disabled {
		opacity: 0.6;
		cursor: not-allowed !important;
		pointer-events: none;
		background-color: #e9ecef !important;
		border: 1px solid #dee2e6 !important;
		color: #6c757d !important;
	}
	
	
	
	/* 제목 클릭용 링크 스타일 */
	.product-link {
	    text-decoration: none;    /* 밑줄 제거 */
	    color: inherit;           /* 부모(td)의 글자색 상속 */
	    display: inline-block;    /* 클릭 영역 확보 */
	    transition: all 0.2s ease; /* 부드러운 변화 효과 */
	}
	
	.product-link:hover {
	    color: #0d6efd;           /* 호버 시 강조 색상 (부트스트랩 기본 파란색) */
	    text-decoration: underline; /* 호버 시에만 밑줄 표시 */
	    cursor: pointer;          /* 마우스 커서 포인터로 변경 */
	}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("input[name='statusFilter']").on("change", function() {
			let url = "${ pageContext.request.contextPath }/admin/auction/list";
			url = url + "?" + "auctionStatus=" + $(this).val();
			location.href = url;
		});
	});

	
	/*
	function viewDetail(auctionId) {
		location.href = "${ pageContext.request.contextPath }/admin/auction/detail?auctionId="
				+ auctionId;
	}
	*/
</script>
</head>
<body class="bg-light">
	<div class="container-fluid py-4">
		<h4 class="fw-bold mb-4">전체 경매 관리</h4>

		<div
			class="filter-container d-flex align-items-center justify-content-between">
			<div class="d-flex align-items-center">
				<span class="fw-bold me-3"><i class="bi bi-funnel-fill"></i>
					상태 필터</span>
				<div class="btn-group" role="group"
					aria-label="Auction Status Filter">
					<input type="radio" class="btn-check" name="statusFilter" value="all"
						id="filterAll" <c:if test="${empty auctionStatus || auctionStatus == 'all'}">checked</c:if>>
					<label class="btn btn-outline-dark" for="filterAll">전체</label>
					
					<input type="radio" class="btn-check" name="statusFilter" value="active"
						id="filterActive" <c:if test="${auctionStatus == 'active'}">checked</c:if>>
					<label class="btn btn-outline-dark" for="filterActive">진행 중</label>

					<input type="radio" class="btn-check" name="statusFilter" value="closed"
						id="filterClosed" <c:if test="${auctionStatus == 'closed'}">checked</c:if>>
					<label class="btn btn-outline-dark" for="filterClosed">종료</label>
				</div>
			</div>
			<div class="text-muted">
				총 <span class="fw-bold text-dark">${ auctionTotalCount }</span>개의 경매
			</div>
		</div>

		<div class="table-container shadow-sm">
			<table class="table table-hover mb-0">
				<thead class="wf-header">
					<tr>
						<th>이미지</th>
						<th>등록 회원</th>
						<th>경매 상태</th>
						<th class="text-start">경매 상품명</th>
						<th>현재가/낙찰가</th>
						<th>최고 입찰가</th>
						<th>입찰 횟수</th>
						<th>종료(예정)일</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="auctionDto" items="${ auctionList }">
						<tr>
							<td>
								<img src="${ pageContext.request.contextPath }/${ auctionDto.imagePath1 }"
								class="product-thumb">
							</td>
							<td>${ auctionDto.userId }</td>
							<td>
								<c:choose>
									<c:when test="${ auctionDto.isFinished == '진행중' }">
										<span
											class="badge rounded-pill bg-primary-subtle text-primary border border-primary-subtle">
											<i class="bi bi-play-fill"></i> 진행 중
										</span>
									</c:when>
									<c:otherwise>
										<span
											class="badge rounded-pill bg-secondary-subtle text-secondary border border-secondary-subtle">
											<i class="bi bi-stop-fill"></i> 마감
										</span>
									</c:otherwise>
								</c:choose>
							</td>
							<!-- 경매명 -->
							<td class="text-start">
								<a href="" class="product-link">
									${ auctionDto.auctionTitle }
								</a>
								<br>
								<small class="text-muted">ID: ${ auctionDto.auctionId }</small>
							</td>
							<td>
								<span class="fw-bold text-primary">${ auctionDto.bidCurrentPrice }원</span>
							</td>
							<td>
								<span class="text-danger fw-bold">${ auctionDto.bidMaxPrice }원</span>
							</td>
							<td>
								<span class="badge bg-light text-dark border">${ auctionDto.bidCount }회</span>
							</td>
							<td><small>${ auctionDto.auctionEndDate }</small></td>
							<td>
								<button type="button"
									class="btn btn-sm btn-outline-dark btn-admin-custom"
									onclick="viewDetail('${ auctionDto.auctionId }')">상세관리</button>
							</td>
						</tr>
					</c:forEach>

					<%-- 테스트용 하드코딩 데이터 --%>
					<%--
					<c:if test="${ empty auctionList }">
						<tr>
							<td><img
								src="${ pageContext.request.contextPath }/images/tempFigureImage.png"
								class="product-thumb"></td>
							<td>회원A</td>
							<td><span
								class="badge rounded-pill bg-primary-subtle text-primary border border-primary-subtle">
									<i class="bi bi-play-fill"></i> 진행 중
							</span></td>
							<td class="text-start">하츠네 미쿠 피규어 (진행중)<br>
							<small class="text-muted">ID: AUC-1001</small></td>
							<td><span class="fw-bold text-primary">165,000원</span></td>
							<td><span class="text-danger fw-bold">180,000원</span></td>
							<td><span class="badge bg-light text-dark border">12회</span></td>
							<td><small>2026-04-30 14:00</small></td>
							<td>
								<button type="button"
									class="btn btn-sm btn-outline-dark btn-admin-custom">상세관리</button>
							</td>
						</tr>
					</c:if>
					--%>
				</tbody>
			</table>
		</div>

		<div class="row mt-4 mb-3">
			<div class="col-12 d-flex justify-content-center">
				<nav aria-label="Page navigation">
					${ pageElement }
					<%-- 테스트용 하드 코딩 --%>
					<%-- 
                    <ul class="pagination mb-0">
                        <li class="page-item"><a class="page-link" href="#">처음으로</a></li>
                        <li class="page-item active"><span class="page-link">1</span></li>
                        <li class="page-item"><a class="page-link" href="#">마지막으로</a></li>
                    </ul>
                    --%>
				</nav>
			</div>
		</div>

		<div class="d-flex justify-content-center mt-0 py-5">
			<button type="button" class="btn btn-secondary px-5 fw-bold"
				onclick="location.href='${ pageContext.request.contextPath }/admin'">
				대시보드로 돌아가기</button>
		</div>
	</div>
</body>
</html>