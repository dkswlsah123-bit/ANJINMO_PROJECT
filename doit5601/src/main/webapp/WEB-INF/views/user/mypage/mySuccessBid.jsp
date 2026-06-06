<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>낙찰 상품 - Auction PKG</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resource/css/biditem.css">

<style type="text/css">
html {
	min-height: 100vh !important;
}

body {
	margin-top: 50px;
}
.body
{
	padding: 30px 20px 0 20px;
}
.item:hover {
    box-shadow: 0 10px 20px rgba(0,0,0,0.15) !important;
    transform: translateY(-1px); 
    border-color: #dee2e6 !important; 
}
.up {

	border-radius: 7px;
	border: 1px solid silver;
	font-size: 16px;
	padding: 10px !important;
}

a, a:visited {
	color: black !important;
	text-decoration: none !important;
}

h1 {
	font-size: 20px !important;
	font-weight: bold !important;
}

.box {
	height: 100px;
	width: 90%;
	border-radius: 7px;
	position: relative;
	margin: 30px auto;
	text-align: center;
	background-color:#F8F8F8; 
}

.tot {
	display: flex;
}

.bid {
	padding: 10px;
	height: 100%;
	width: 100%;
	font-family: small;
	font-weight: bold;
}
.bid:hover
{
	border-radius: 40px;
	background-color:#F3F3F3; 
}
.bid hr
{
	margin-top: 7px;
}

.bid>span {
	display: block;
}
.bidcount
{
	width: 100px;
	margin-left:0px;
}
.view {
	height: 70%;
	margin-top: 25px;
}

.box3 {
	border: 1px solid #FAFAFA;
	border-radius: 7px;
	width: 90%;
	text-align: left;
	padding: 30px;
	margin: 0 auto;
}

.item {
	vertical-align: top !important;
	border-radius: 7px !important;
	border: 1px solid silver !important;
	margin: 18px !important;
	display: inline-block !important;
	width: 200px !important;
	height: 260px !important;
}

.itemtext {
	display: block;
	font-weight: bold;
	text-align: center;
	width: 100%;
	padding: 3px;
	margin-top: 3px;
	align-content: center;
	margin-top: 9px;
	height: 70px;
}
.po
{
	margin-top: -1px;
	align-items: center !important;
}

hr {
	margin: 10px;
}

.itemtext span {
	display: inline-block !important;
	display: flex;
}
.itemtext div
{
	display: inline-block !important;
}
.itemtext > div {
    display: flex !important;
    justify-content: space-between; 
    align-items: right;
    font-size:15px;
}
.title {
	display: block;
	height: 46px;
}

.item img {
	border-radius: 5px;
	object-fit: cover;
	width: 100%;
	height: 100%;
}
.position
{
	font-family:small;
	margin-right:8px;
}
.imgwrap {
	width: 100%;
	height: 170px;
	overflow: hidden;
	background-color: #f9f9f9;
}

.sel {
	margin-bottom: 20px;
	width: 850px;
	display: flex;
	margin-left: 50px;
}

.form-select {
	width: 150px !important;
	margin-left: 20px;
}

.btn-dark {
	margin-left: 20px;
	width: 80px !important;
	height: 37px !important;
	font-size: 15px;
	font-weight: bold;
	padding: 1px;
}
</style>

<script type="text/javascript">

function con(userId, bidId) {
	

	if (event) {
        event.stopPropagation();
        event.preventDefault();
	}
	
    if (!confirm("구매를 확정하시겠습니까?")) return;
    fetch("${pageContext.request.contextPath}/user/purchaseConfirmAction?bidId=" + bidId + "&userId=" + userId)
    .then(response => response.text())
    .then(data => {
        if(data.trim() === "success") {
            alert("구매가 확정되었습니다.");
            let container = document.getElementById("confirmContainer_" + bidId);
            container.innerHTML = "<span>구매확정완료</span>";
        } else { alert("처리에 실패했습니다."); }
    }).catch(error => { console.error("Error:", error); });
}
</script>
</head>
<body class="bg-light">

	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<main class="container" style="margin-top: 50px; margin-bottom: 50px;">
		<div class="row">
			<aside class="col-md-3">
				<%@ include file="/WEB-INF/views/common/mypage_layout.jsp"%>
			</aside>

			<section class="col-md-9">
				<div class="up shadow-sm border-0 bg-white p-4" style="width: 100%;">
					<div class="body">
						<h1>낙찰 상품</h1>
						<hr />
						<div class="box shadow-sm">
							<div class="tot">
								<div class="bid">
									<span>낙찰 상품</span>
									<hr />
									<a href=""><span class="view">${winnerCount.total}</span></a>
								</div>
								<div class="bid">
									<span>낙찰포기 상품</span>
									<hr />
									<a href=""><span class="view">${winnerCount.fail}</span></a>
								</div>
								<div class="bid">
									<span>미결제 상품</span>
									<hr />
									<a href=""><span class="view">${winnerCount.unpayment}</span></a>
								</div>
								<div class="bid">
									<span>배송대기 상품</span>
									<hr />
									<a href=""><span class="view">${winnerCount.unshipping}</span></a>
								</div>
								<div class="bid">
									<span>배송완료 상품</span>
									<hr />
									<a href=""><span class="view">${winnerCount.shipping}</span></a>
								</div>
								<div class="bid">
									<span>구매확정완료</span>
									<hr />
									<a href=""><span class="view">${winnerCount.confirm}</span></a>
								</div>
							</div>
						</div>

						<div class="sel">
							<form action="${pageContext.request.contextPath}/user/products">
								<select class="form-select" name="type"
									onchange="this.form.submit()">
									<option value=""
										${param.type == ''|| param.type == 0 ? 'selected' : '' }>낙찰
										상품</option>
									<option value="1" ${param.type == 1 ? 'selected' : '' }>낙찰
										취소</option>
									<option value="2" ${param.type == 2 ? 'selected' : '' }>미
										결제</option>
									<option value="3" ${param.type == 3 ? 'selected' : '' }>배송
										대기</option>
									<option value="4" ${param.type == 4 ? 'selected' : '' }>배송
										완료</option>
									<option value="5" ${param.type == 5 ? 'selected' : '' }>구매
										확정</option>
								</select>
							</form>
							<div class="d-flex align-items-center ms-3">
								<input type="text" class="form-control" placeholder="시작일"
									style="width: 150px;"> <span class="mx-2">~</span> <input
									type="text" class="form-control" placeholder="종료일"
									style="width: 150px;">
								<button type="button" class="btn btn-dark ms-3">검색</button>
							</div>
						</div>

						<div class="box3 shadow-sm">
							<c:forEach var="bid" items="${winnerList}">
								<a
									href="${pageContext.request.contextPath }/product/detail?productId=${bid.productId}">
									<div class="item shadow-sm">
										<div class="imgwrap">
											<img src="${pageContext.request.contextPath}/images/${bid.img}" alt="상품이미지" />
										</div>
										<div class="itemtext">
											<span class="title">${bid.auctionTitle}</span>
											<div class="po">
												<span class="bidcount">${bid.finalPrice} 원</span>
												<div class="position">
													<c:choose>
														<c:when test="${bid.fail == 'Y'}">
															<span style="background-color:#faeceb; border-radius: 5px; padding:3px;">${bid.failType == 1 ? '기한만료' : '낙찰취소'}</span>
														</c:when>
														<c:when test="${bid.confirm == 'Y'}">
															<span style="background-color:#f2f2f2; border-radius: 5px; padding:3px;">확정완료</span>
														</c:when>
														<c:when test="${bid.shipping == 'Y'}">
															<span id="confirmContainer_${bid.winnerBidId}">
																<button type="button" class="btn btn-light btn-sm"
																	onclick="con(${bid.winnerUserId},${bid.winnerBidId})">구매확정</button>
															</span>
														</c:when>
														<c:when
															test="${bid.paymentStat == 'Completed' && bid.shipping == 'N'}">
															<span style="background-color:#f2f2f2; border-radius: 5px; padding:3px;">배송대기</span>
														</c:when>
														<c:when test="${bid.paymentStat == 'Pending'}">
															<a
																href="${pageContext.request.contextPath}/payment.detail?userId=${bid.winnerUserId}&resultId=${bid.winnerBidId}">
																<button type="button" class="btn btn-light btn-sm">결제하기</button>
															</a>
														</c:when>
													</c:choose>
												</div>
											</div>
										</div>
									</div>
								</a>
							</c:forEach>

							<div class="pagecontrol mt-4">
								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center">
										<li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
										<c:forEach var="page" begin="${startPage}" end="${endPage}"
											varStatus="var">
											<li class="page-item"><a class="page-link" href="#">${var.count}</a></li>
										</c:forEach>
										<li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</main>
	
	<c:if test="${param.takefailYN != null }">
		<c:choose>
			<c:when test="${param.takefailYN == 'Y' }">
				<script type="text/javascript">
					alert("낙찰취소가 등록되었습니다\n구매자 패널티가 1점 추가됩니다");
					history.replaceState(null,null,location.pathname);
				</script>
			</c:when>
			<c:when test="${param.takefailYN == 'N' }">
				<script type="text/javascript">
					alert("낙찰취소에 실패했습니다.\n다시 시도해주세요");
					history.replaceState(null,null,location.pathname);
				</script>	
			</c:when>
		</c:choose>
	</c:if>


	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>