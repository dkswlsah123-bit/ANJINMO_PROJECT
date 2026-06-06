<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${product.productReleaseName} | 쌍용피규어마켓</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
<style>
    .navbar-brand { font-weight: 700; color: #4F46E5 !important; }
    .main-img   { width: 100%; height: 360px; object-fit: cover; border-radius: 8px; }
    .thumb-img  { width: 70px; height: 70px; object-fit: cover; border-radius: 6px; border: 2px solid transparent; cursor: pointer; }
    .thumb-img.active { border-color: #0d6efd; }
</style>
</head>
<body class="bg-light">
<%-- <jsp:include page="/common/header.jsp"></jsp:include> --%>

<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom shadow-sm">
    <div class="container">
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto ms-3">
                <li class="nav-item"><a class="nav-link fw-semibold" href="${ctx}/product/list">컬렉션</a></li>
                <li class="nav-item"><a class="nav-link" href="${ctx}/auction/list">경매</a></li>
                <li class="nav-item"><a class="nav-link" href="${ctx}/product/myList">내 상품</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container py-4">

    <%-- 신고 완료 안내 --%>
    <c:if test="${param.reportOk eq '1'}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            신고가 접수되었습니다.
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>

    <nav aria-label="breadcrumb" class="mb-3">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="${ctx}/main">홈</a></li>
            <li class="breadcrumb-item"><a href="${ctx}/product/list">컬렉션</a></li>
            <li class="breadcrumb-item active">${product.productReleaseName}</li>
        </ol>
    </nav>

    <div class="row g-4">
        <%-- 이미지 영역 --%>
        <div class="col-md-6">
            <c:set var="mainImg" value="${not empty product.imagePath1 ? product.imagePath1 : null}" />

            <c:choose>
                <c:when test="${not empty mainImg}">
                    <img src="${ctx}/images/${mainImg}" class="main-img" id="mainImg" alt="${product.productReleaseName}">
                </c:when>
                <c:otherwise>
                    <img src="https://placehold.co/360x360/e9ecef/6c757d?text=No+Image"
                         class="main-img" id="mainImg" alt="이미지 없음">
                </c:otherwise>
            </c:choose>

            <div class="d-flex gap-2 mt-2 flex-wrap">
                <%-- imagePath1 ~ imagePath10 까지 있는 것만 썸네일로 표시 --%>
                <c:forEach var="i" begin="1" end="10">
                   <%--  <c:set var="img" value="${product['imagePath'.concat(i)]}" />
                    <c:if test="${not empty img}">
                        <img src="${ctx}/images/${img}"
                             class="thumb-img ${i == 1 ? 'active' : ''}"
                             onclick="changeImg(this)" alt="">
                    </c:if> --%>
                </c:forEach>
            </div>
        </div>

        <%-- 상품 정보 --%>
        <div class="col-md-6">
            <div class="bg-white rounded-3 p-4 shadow-sm">
                <div class="mb-2">
                    <span class="badge bg-secondary me-1">${product.productGradeName}</span>
                    <span class="text-muted small">${product.manufacturerName}</span>
                </div>
                <h4 class="fw-bold">${product.productReleaseName}</h4>
                <c:if test="${not empty product.productAlias}">
                    <p class="text-muted mb-1 small">${product.productAlias}</p>
                </c:if>
                <p class="text-muted mb-3 small">
                    ${product.productSizeName}
                    <c:if test="${not empty product.productGenreName}"> · ${product.productGenreName}</c:if>
                </p>

                <hr>
                <table class="table table-sm table-borderless">
                    <c:if test="${not empty product.workName}">
                        <tr>
                            <th class="text-muted fw-normal" style="width: 100px">작품명</th>
                            <td>${product.workName}</td>
                        </tr>
                    </c:if>
                    <c:if test="${not empty product.characterName}">
                        <tr>
                            <th class="text-muted fw-normal">캐릭터</th>
                            <td>${product.characterName}</td>
                        </tr>
                    </c:if>
                    <c:if test="${not empty product.productCountryName}">
                        <tr>
                            <th class="text-muted fw-normal">제조국</th>
                            <td>${product.productCountryName}</td>
                        </tr>
                    </c:if>
                    <tr>
                        <th class="text-muted fw-normal">개봉 여부</th>
                        <td>${product.isOpenedName}</td>
                    </tr>
                    <tr>
                        <th class="text-muted fw-normal">부품 상태</th>
                        <td>${product.isPartsMissingName}</td>
                    </tr>
                    <c:if test="${not empty product.purchaseDateTime}">
                        <tr>
                            <th class="text-muted fw-normal">구매일</th>
                            <td>${product.purchaseDateTime}</td>
                        </tr>
                    </c:if>
                    <tr>
                        <th class="text-muted fw-normal">등록일</th>
                        <td>${product.createdAt}</td>
                    </tr>
                </table>

                <c:if test="${not empty product.descriptions}">
                    <p class="small" style="white-space: pre-line;">${product.descriptions}</p>
                </c:if>

                <hr>

                <%-- 찜 버튼 (로그인 시 표시) --%>
                <c:if test="${not empty loginUserId}">
                    <c:choose>
                        <c:when test="${isWishlisted > 0}">
                            <a href="${ctx}/user/product/wishlist/add?productId=${product.productId}"
                               class="btn w-100 mb-2 fw-bold"
                               style="background-color:#fff;color:#dc3545;border:1px solid #dc3545;border-radius:8px;">
                                ♥ 관심상품 해제
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="${ctx}/user/product/wishlist/add?productId=${product.productId}"
                               class="btn w-100 mb-2 fw-bold"
                               style="background-color:#dc3545;color:#fff;border:none;border-radius:8px;">
                                ♡ 관심상품 등록
                            </a>
                        </c:otherwise>
                    </c:choose>
                </c:if>

                <%-- 찜 완료/해제 안내 --%>
                <c:if test="${param.wish eq 'ok'}">
                    <div class="alert alert-success py-2 small mb-2">관심상품에 등록되었습니다!</div>
                </c:if>
                <c:if test="${param.wish eq 'cancel'}">
                    <div class="alert alert-secondary py-2 small mb-2">관심상품에서 해제되었습니다.</div>
                </c:if>

                <%-- 본인 상품이면 수정/삭제, 아니면 신고 버튼 --%>
                <c:choose>
                    <c:when test="${not empty loginUserId and product.userId eq loginUserId}">
                        <div class="d-flex gap-2">
                            <a href="${ctx}/product/update?productId=${product.productId}"
                               class="btn w-50 py-2 fw-bold"
                               style="background-color:#f1f1f1;color:#333;border:1px solid #ddd;border-radius:8px;">수정</a>
                            <a href="${ctx}/product/delete?productId=${product.productId}"
                               class="btn w-50 py-2 fw-bold"
                               style="background-color:#212529;color:#fff;border:none;border-radius:8px;">삭제</a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="text-end">
                            <a href="${ctx}/product/report?productId=${product.productId}"
                               class="btn btn-link btn-sm text-muted">신고하기</a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>

<%-- <jsp:include page="/common/footer.jsp"></jsp:include> --%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function changeImg(el) {
        document.getElementById('mainImg').src = el.src;
        document.querySelectorAll('.thumb-img').forEach(function(t) {
            t.classList.remove('active');
        });
        el.classList.add('active');
    }
</script>
</body>
</html>
