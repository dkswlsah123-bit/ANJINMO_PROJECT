<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">

<style type="text/css">
.btn-primary {
	background-color: #120e63 !important;
	border-color: #120e63 !important;
}
</style>
</head>
<body class="bg-light">
<%@ include file="/WEB-INF/views/common/header.jsp" %>


	<div class="container" style="margin-top: 50px; margin-bottom: 50px;">
		<div class="row">
			<aside class="col-md-3">
					<%@ include file="/WEB-INF/views/common/mypage_layout.jsp" %>
			</aside>
			<section class="col-md-9">
				<div class="card shadow-sm border-0 bg-white p-4">
					<div
						class="card-header bg-white py-3 d-flex justify-content-between align-items-center border-bottom">
						<h5 class="mb-0 fw-bold">내 관심 상품</h5>
						<span class="text-muted small">찜한 상품 <span
							class="text-primary fw-bold">${dataCount }</span>건
						</span>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table align-middle">
								<thead class="table-light">
									<tr class="text-center">
										<th style="width: 5%">번호</th>
										<th style="width: 40%">상품 정보</th>
										<th style="width: 20%">경매 상태</th>
										<th style="width: 20%">관리</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="dto" items="${list }" varStatus="status">
								
									<tr>
										<td class="text-center">${status.count }</td>
										<td>
											<div class="d-flex align-items-center">
												<img
											src="${pageContext.request.contextPath}/${dto.imagePath1 }"
											class="rounded shadow-sm" alt="상품" style="width: 60px; height: 60px; object-fit: cover;">
												<div class="ms-3">
													<div class="fw-bold">${dto.productReleaseName }</div>
												</div>
											</div>
										</td>
										<td class="text-center"><span
											class="badge mb-1 ${dto.auctionId==null?'bg-success': dto.isFinished=='진행중'?'bg-danger':'bg-secondary' }">${dto.auctionId==null?'경매 진행 전': dto.isFinished=='진행중'? '경매 진행중': '마감' }</span>
									
										<td class="text-center">
											<div class="d-grid gap-2">
												<a class="btn btn-sm btn-outline-secondary" href="${pageContext.request.contextPath}/user/product/wishlist/delete?wishId=${dto.wishlistId}"
												onclick="return confirm('정말 찜 해제하시겠습니까?');">찜
													해제</a>
											</div>
										</td>
									</tr>
								</c:forEach>
								
								</tbody>
							</table>
						</div>

				<div class="d-flex justify-content-center mt-4">
							${actualCount == 0? "등록된 게시물이 없습니다.": paging }
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>

  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>