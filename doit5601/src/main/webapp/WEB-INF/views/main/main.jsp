<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AuctionGo - 개인 컬렉션 & 경매</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    /* 전체 레이아웃 Sticky Footer 설정 */
    body { display: flex; flex-direction: column; min-height: 100vh; }
    main { flex: 1; 
    display: flex; 
    flex-direction: column;}

    /* 히어로 섹션: 윈도우 너비 전체 차지 */
    .hero-section {
        background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), 
                    url('https://images.unsplash.com/photo-1550751827-4bd374c3f58b?auto=format&fit=crop&q=80&w=1920');
        background-size: cover;
        background-position: center;
        padding: 120px 0;
        color: white;
        flex: 1; 
    display: flex;
    align-items: center; 
    justify-content: center; 
    background-size: cover;
    background-position: center;
    color: white;
    }

    /* 카드 공통 호버 효과 */
    .custom-card {
        transition: all 0.3s cubic-bezier(.25,.8,.25,1);
        border: none !important;
        border-radius: 15px;
    }
    .custom-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 30px rgba(0,0,0,0.1) !important;
    }

    /* 찜하기 버튼 스타일 */
    .btn-wish {
        position: absolute;
        top: 15px;
        left: 15px;
        z-index: 10;
        background: rgba(255,255,255,0.8);
        border-radius: 50%;
        width: 38px;
        height: 38px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #ff4757;
        transition: 0.2s;
    }
    .btn-wish:hover { background: #ff4757; color: white; }

    .text-truncate-2 {
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
    }
    .hero-section{
    	background-image: url('${pageContext.request.contextPath}/images/main.jpeg') !important;
    }
    .btn-primary{
    	background-color: #120e63 !important;
    	border-color: #120e63 !important;
    }
</style>
</head>
<body class="bg-light">
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<main>
    <section class="hero-section text-center">
        <div class="container">
            <h1 class="display-3 fw-bold mb-3 txtColor" style="text-shadow: 2px 2px 10px rgba(0,0,0,0.5);">나만의 컬렉션, 특별한 경매</h1>
            <p class="lead mb-5 opacity-75 text-dark fw-bold">당신의 소장품을 뽐내고, 경매로 가치를 더하세요!</p>
            <div class="d-flex justify-content-center gap-3">
                <a href="${pageContext.request.contextPath}/auction/list" class="btn btn-primary btn-lg px-5 py-3 rounded-pill fw-bold">경매 입장</a>
                <a href="${pageContext.request.contextPath}/product/list" class="btn btn-outline-dark btn-lg px-5 py-3 rounded-pill fw-bold">컬렉션 구경</a>
            </div>
        </div>
    </section>

<%--     <div class="container">
        <section class="mb-5">
            <div class="d-flex justify-content-between align-items-end mb-4">
                <div>
                    <h2 class="fw-bold m-0"><i class="bi bi-fire text-danger me-2"></i>마감 임박 경매</h2>
                    <p class="text-muted mb-0">시간이 얼마 남지 않았습니다 어서 서두르세요!</p>
                </div>
                <a href="${pageContext.request.contextPath}/gangmyeongcheol_jsp/auctionList.jsp"" class="btn btn-outline-dark rounded-pill px-4">더보기</a>
            </div>
            
            <div class="row g-4">
                <c:forEach var="i" begin="1" end="3">
                <div class="col-md-4">
                    <div class="card h-100 shadow-sm custom-card position-relative overflow-hidden">
                        <div class="badge bg-danger position-absolute top-0 end-0 m-3 py-2 px-3 shadow-sm">00:15:32</div>
                        <img src="https://placehold.jp/24/444444/ffffff/400x320.png?text=Collection+Item+${i}" class="card-img-top" alt="경매상품">
                        
                        <div class="card-body">
                            <h5 class="fw-bold mb-3">레트로 리미티드 에디션 #${i}</h5>
                            <div class="bg-light p-3 rounded-3">
                                <div class="d-flex justify-content-between align-items-center">
                                    <span class="small text-muted">현재 낙찰 예정가</span>
                                    <span class="fw-bold text-danger fs-5">155,000원</span>
                                </div>
                            </div>
                            <a href="${pageContext.request.contextPath}/gangmyeongcheol_jsp/auctionDetail.jsp?auctionId=A002" class="stretched-link"></a>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </section>

        <section class="mb-5 py-5 border-top">
            <div class="d-flex justify-content-between align-items-end mb-4">
                <div>
                    <h2 class="fw-bold m-0"><i class="bi bi-box2-heart me-3 txtColor"></i>새로운 소장품</h2>
                </div>
                <a href="${pageContext.request.contextPath}/gangmyeongcheol_jsp/productList.jsp" class="btn btn-outline-dark rounded-pill px-4">갤러리 전체보기</a>
            </div>

            <div class="row g-4">
                <c:forEach var="i" begin="1" end="3">
                <div class="col-md-4">
                    <div class="card h-100 shadow-sm custom-card">

                        <button class="btn btn-wish border-0" onclick="event.preventDefault();">
                            <i class="bi bi-heart-fill"></i>
                        </button>
                        
                        <img src="https://placehold.jp/24/666666/ffffff/400x320.png?text=New+Gallery+${i}" class="card-img-top" alt="갤러리상품">
                        
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-start mb-2">
                                <span class="badge bg-warning-subtle text-danger px-2 py-1">new</span>
                                <span class="text-muted small"><i class="bi bi-eye me-1"></i>124</span>
                            </div>
                            <h5 class="fw-bold">개인 소장용 피규어 시리즈 #${i}</h5>
                            <a href="${pageContext.request.contextPath}/gangmyeongcheol_jsp/productDetail.jsp?productId=P001" class="stretched-link"></a>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </section>
    </div> --%>
</main>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<%-- <jsp:include page="footer.jsp"></jsp:include> --%>
</body>
</html>
