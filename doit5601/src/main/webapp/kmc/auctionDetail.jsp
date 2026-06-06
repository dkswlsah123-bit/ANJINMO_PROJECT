<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
<style>
body { background: #f8f9fa; }
.navbar-brand { font-weight: 700; color: #4F46E5 !important; }
.main-img { width: 100%; height: 360px; object-fit: cover; border-radius: 12px; }
.thumb-img { width: 70px; height: 70px; object-fit: cover; border-radius: 8px; border: 2px solid transparent; cursor: pointer; }
.thumb-img.active { border-color: #EF4444; }
.info-card { background: #fff; border-radius: 12px; padding: 24px; box-shadow: 0 2px 8px rgba(0, 0, 0, .08); }
.current-price { color: #EF4444; font-size: 1.6rem; font-weight: 700; }
.notice-box { background: #FEF2F2; border: 1px solid #FCA5A5; border-radius: 8px; padding: 12px 16px; font-size: .85rem; color: #7F1D1D; }
.countdown { font-size: 1.1rem; font-weight: 700; color: #4F46E5; font-variant-numeric: tabular-nums; }
</style>
</head>
<body>

	<%-- 네비게이션 바 --%>
	<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom shadow-sm">
		<div class="container">
			<a class="navbar-brand" href="main.jsp">경매나라</a>
			<div class="collapse navbar-collapse">
				<ul class="navbar-nav me-auto ms-3">
					<li class="nav-item"><a class="nav-link" href="productList.jsp">컬렉션</a></li>
					<li class="nav-item"><a class="nav-link fw-semibold text-primary" href="auctionList.jsp">경매</a></li>
					<li class="nav-item"><a class="nav-link" href="productMyList.jsp">내 상품</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container py-4">
		<nav aria-label="breadcrumb" class="mb-3">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="main.jsp">홈</a></li>
				<li class="breadcrumb-item"><a href="auctionList.jsp">경매</a></li>
				<li class="breadcrumb-item active">${not empty auction ? auction.auctionTitle : '하츠네 미쿠 한정판 경매'}</li>
			</ol>
		</nav>

		<div class="row g-4">
			<%-- 이미지 영역 --%>
			<div class="col-md-6">
				<c:choose>
					<c:when test="${not empty auction}">
						<img src="images/${auction.mainImage}" class="main-img" id="mainImg" alt="${auction.auctionTitle}">
						<div class="d-flex gap-2 mt-2">
							<img src="images/${auction.mainImage}" class="thumb-img active" onclick="changeImg(this)">
							<c:forEach var="img" items="${auction.imageList}">
								<img src="images/${img}" class="thumb-img" onclick="changeImg(this)">
							</c:forEach>
						</div>
					</c:when>
					<c:otherwise>
						<img src="images/miku2.jpg" class="main-img" id="mainImg" alt="하츠네 미쿠 한정판">
						<div class="d-flex gap-2 mt-2">
							<img src="images/miku2.jpg" class="thumb-img active" onclick="changeImg(this)"> 
							<img src="images/miku1.jpg" class="thumb-img" onclick="changeImg(this)">
						</div>
					</c:otherwise>
				</c:choose>
			</div>

			<%-- 경매 정보 카드 --%>
			<div class="col-md-6">
				<div class="info-card">
					<%-- 상단 상태 표시 영역 --%>
					<div class="d-flex align-items-center gap-2 mb-2">
						<c:choose>
							<c:when test="${viewStatus.startsWith('ongoing')}">
								<span class="badge bg-danger">진행중</span>
								<span class="text-muted" style="font-size: .85rem;"> 마감 <span class="countdown" id="countdown">--:--:--</span></span>
							</c:when>
							<c:otherwise>
								<span class="badge bg-secondary">경매 종료</span>
								<span class="text-muted" style="font-size: .85rem;">종료된 경매입니다</span>
							</c:otherwise>
						</c:choose>
					</div>
					
					<h4 class="fw-bold">${not empty auction ? auction.auctionTitle : '하츠네 미쿠 한정판 경매'}</h4>
					<p class="text-muted mb-3" style="font-size: .9rem;">
						시작가: <fmt:formatNumber value="${not empty auction ? auction.startPrice : 100000}" pattern="#,###" />원 · 
						입찰 단위: <fmt:formatNumber value="${not empty auction ? auction.bidUnit : 10000}" pattern="#,###" />원
					</p>
					<p class="text-muted mb-1" style="font-size: .85rem;">현재가 (비크리 방식)</p>
					<p class="current-price mb-3">
						<fmt:formatNumber value="${not empty auction ? auction.currentPrice : 210000}" pattern="#,###" />원
					</p>

					<hr>

					<div class="notice-box mb-4">
						<p class="fw-semibold mb-1"><i class="bi bi-exclamation-circle-fill me-1"></i> 입찰 전 꼭 확인하세요</p>
						<ul class="mb-0 ps-3" style="line-height: 1.8;">
							<li>입찰 시 보증금 <strong>30,000원</strong>이 차감됩니다.</li>
							<li>낙찰 후 <strong>24시간 이내</strong> 결제하지 않으면 보증금이 몰수됩니다.</li>
							<li>입찰자가 있을 시 경매 취소 시 패널티가 부여됩니다.</li>
						</ul>
					</div>

					<%-- 입찰 버튼 및 결과 알림 영역 --%>
					<div class="d-grid gap-2">
						<c:choose>
							<%-- [진행 중] 비회원 --%>
							<c:when test="${viewStatus == 'ongoing_guest'}">
								<a href="${ctx}/user/login" class="btn btn-outline-primary btn-lg">로그인 후 입찰 가능</a>
							</c:when>

							<%-- [진행 중] 회원 --%>
							<c:when test="${viewStatus == 'ongoing_user'}">
								<c:choose>
									<c:when test="${bidCount >= 10}">
										<div class="alert alert-warning text-center py-2 mb-2" style="font-size:.85rem;">
											동시 입찰 참여는 최대 10개까지 가능합니다.
										</div>
										<button class="btn btn-secondary btn-lg" disabled>입찰 참여 불가</button>
									</c:when>
									<c:otherwise>
										<a href="${ctx}/bid/form?auctionId=${auction.auctionId}" class="btn btn-danger btn-lg shadow-sm">
											<i class="bi bi-hammer me-2"></i>입찰 참여
										</a>
									</c:otherwise>
								</c:choose>
							</c:when>

							<%-- [종료됨] 내가 낙찰자 --%>
							<c:when test="${viewStatus == 'finished_winner'}">
								<div class="alert alert-success text-center py-3 mb-0 border-2">
									<h5 class="fw-bold mb-2">축하합니다! 낙찰되셨습니다.</h5>
									<a href="${ctx}/auction/payment?auctionId=${auction.auctionId}" class="btn btn-success w-100 mt-2">
										지금 바로 결제하기
									</a>
								</div>
							</c:when>

							<%-- [종료됨] 입찰 탈락자 --%>
							<c:when test="${viewStatus == 'finished_loser'}">
								<div class="alert alert-light text-center py-3 mb-0 border">
									<h6 class="fw-bold text-muted mb-1">아쉽게도 낙찰되지 않았습니다.</h6>
									<p class="small mb-0 text-muted">보증금은 규정에 따라 환급됩니다.</p>
								</div>
							</c:when>

							<%-- [종료됨] 기타 (입찰 안한 회원/비회원) --%>
							<c:otherwise>
								<div class="alert alert-secondary text-center py-3 mb-0">
									<h6 class="fw-bold mb-1">경매가 마감되었습니다.</h6>
									<p class="small mb-0">최종 낙찰가: <fmt:formatNumber value="${auction.currentPrice}" pattern="#,###" />원</p>
								</div>
							</c:otherwise>
						</c:choose>
					</div>

					<%-- 취소 및 신고 버튼 (진행 중에만 취소 가능하게 처리) --%>
					<div class="text-end mt-4 d-flex justify-content-end gap-3">
						<c:if test="${viewStatus.startsWith('ongoing')}">
							<button type="button" class="btn btn-outline-secondary w-50" data-bs-toggle="modal" data-bs-target="#cancelNoticeModal">경매 취소</button>
						</c:if>
						<a href="auctionReport.jsp?auctionId=${not empty auction ? auction.auctionId : 1}" 
						   class="btn btn-outline-danger ${viewStatus.startsWith('ongoing') ? 'w-50' : 'w-100'}">신고하기</a>
					</div>
				</div>
			</div>
		</div>

		<%-- 상세 설명 영역 --%>
		<div class="bg-white rounded-3 p-4 mt-4 shadow-sm">
			<h6 class="fw-bold mb-3 border-bottom pb-2">경매 상품 설명</h6>
			<p style="font-size: .9rem; line-height: 1.8; color: #374151;">
				${not empty auction ? auction.description : '굿스마일컴퍼니 하츠네 미쿠 1/7 스케일 한정판입니다.'}
			</p>
		</div>
	</div>

	<%-- 모달 영역 (생략 없이 유지) --%>
	<div class="modal fade" id="cancelNoticeModal" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content border-0 shadow">
				<div class="modal-header bg-danger text-white">
					<h5 class="modal-title fw-bold"><i class="bi bi-exclamation-triangle-fill me-2"></i>경매 취소 규정 안내</h5>
					<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body p-4">
					<div class="p-3 bg-light rounded">
						<ul class="list-unstyled mb-0" style="font-size: 0.95rem; line-height: 2;">
							<li><i class="bi bi-check-circle-fill text-danger me-2"></i>입찰자가 존재할 경우 <strong>패널티 점수</strong>가 부여됩니다.</li>
							<li><i class="bi bi-check-circle-fill text-danger me-2"></i>경매 종료 <strong>1시간 전</strong>에는 취소할 수 없습니다.</li>
							<li><i class="bi bi-check-circle-fill text-danger me-2"></i>경매 취소 시 <strong>보증금</strong>은 환급되지 않습니다.</li>
						</ul>
					</div>
				</div>
				<div class="modal-footer bg-light">
					<button type="button" class="btn btn-danger px-4" data-bs-toggle="modal" data-bs-target="#cancelReasonModal">규정 확인 및 취소 진행</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="cancelReasonModal" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content border-0 shadow">
				<div class="modal-header bg-dark text-white">
					<h5 class="modal-title fw-bold">경매 취소 사유 입력</h5>
					<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
				</div>
				<form action="auctionCancel.do" method="post">
					<input type="hidden" name="auctionId" value="${not empty auction ? auction.auctionId : 1}">
					<div class="modal-body p-4">
						<textarea name="cancelReason" class="form-control" rows="4" placeholder="취소 사유를 입력해주세요" required></textarea>
					</div>
					<div class="modal-footer bg-light">
						<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#cancelNoticeModal">이전으로</button>
						<button type="submit" class="btn btn-danger px-4">최종 취소하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
    function changeImg(el) {
        document.getElementById('mainImg').src = el.src;
        document.querySelectorAll('.thumb-img').forEach(t => t.classList.remove('active'));
        el.classList.add('active');
    }

    const totalSeconds = ${not empty auction ? auction.remainSeconds : 9251};
    let remaining = totalSeconds;
    const countdownEl = document.getElementById('countdown');

    function updateTimer() {
        if (remaining <= 0) { 
            countdownEl.textContent = '경매 마감';
           
            if(remaining === 0) location.reload();
            return; 
        }
        const h = String(Math.floor(remaining / 3600)).padStart(2,'0');
        const m = String(Math.floor((remaining % 3600) / 60)).padStart(2,'0');
        const s = String(remaining % 60).padStart(2,'0');
        countdownEl.textContent = h + ':' + m + ':' + s;
        remaining--;
    }
    
    if (countdownEl) {
        updateTimer();
        setInterval(updateTimer, 1000);
    }
	</script>
</body>
</html>