<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>경매나라 - 실시간 경매</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
<style>
    /* 전체 레이아웃 */
    body { background-color: #f8fafd; font-family: 'Pretendard', sans-serif; }
    .navbar-brand { font-weight: 700; color: #1565c0 !important; }
    
    /* 헤더 영역  */
    .page-header { background: #f8f9fa; /* 첫 번째 코드의 bg-light 색상 */
    padding: 3rem 0 2rem 0; /* 적절한 상하 여백 */ }
    .header-title { font-weight: 800; color: #222;}
    
    /* 필터 영역 */
    .filter-bar { background: white; border-bottom: 1px solid #e3f2fd; padding: 12px 0; margin-bottom: 30px; }
    
    /* 경매 카드 스타일 */
    .auction-card { border: none; border-radius: 12px; overflow: hidden; background: white; transition: all 0.2s ease; box-shadow: 0 2px 10px rgba(0,0,0,0.05); height: 100%; cursor: pointer; }
    .auction-card:hover { transform: translateY(-5px); box-shadow: 0 10px 20px rgba(21,101,192,0.1); }
    .auction-card img { aspect-ratio: 1/1; object-fit: cover; width: 100%; }
    
    /* 경매 정보 요소 */
    .badge-grade { background: #e3f2fd; color: #1565c0; font-size: 11px; padding: 3px 8px; border-radius: 4px; font-weight: 600; }
    .timer-badge { background: #fff3e0; color: #e65100; font-size: 11px; font-weight: 700; padding: 3px 8px; border-radius: 4px; }
    .item-name { font-size: 15px; font-weight: 700; color: #333; margin: 10px 0 4px 0; height: 42px; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; }
    .item-maker { font-size: 12px; color: #888; margin-bottom: 10px; }
    .price-label { font-size: 12px; color: #666; }
    .current-price { font-size: 18px; font-weight: 800; color: #1565c0; }
    .bid-count { font-size: 11px; color: #999; }
</style>
</head>
<body>

<%-- <jsp:include page="/common/header.jsp"></jsp:include> --%>

<%-- 상단 헤더 --%>
<div class="page-header text-center">
    <div class="container">
        <h2 class="header-title">실시간 경매</h2>
        <p class="text-muted mb-0 small">지금 참여하고 최고의 컬렉션을 소유하세요!</p>
    </div>
</div>

<%-- 검색/필터 바 (productList 스타일) --%>
<div class="filter-bar shadow-sm">
    <div class="container">
        <form method="get" action="auctionList.jsp" class="row g-2 align-items-center">
            <div class="col-auto">
                <select name="genre" class="form-select form-select-sm">
                    <option value="">장르 전체</option>
                    <option value="1">애니메이션</option>
                    <option value="2">게임</option>
                </select>
            </div>
            <div class="col-auto">
                <select name="size" class="form-select form-select-sm">
                    <option value="">사이즈 전체</option>
                    <option value="1">1/7</option>
                    <option value="2">1/8</option>
                </select>
            </div>
            <div class="col-auto">
                <input type="text" name="keyword" class="form-control form-control-sm" placeholder="경매명 검색">
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-primary btn-sm px-3">검색</button>
            </div>
            <div class="col-auto ms-auto">
                <select class="form-select form-select-sm" style="width:130px">
                    <option>마감임박순</option>
                    <option>최신등록순</option>
                    <option>입찰수높은순</option>
                </select>
            </div>
        </form>
    </div>
</div>

<%-- 경매 목록 --%>
<div class="container pb-5">
    <p class="text-muted mb-3 small">총 <strong>2</strong>개의 경매 진행 중</p>
    
    <div class="row row-cols-2 row-cols-md-4 g-4">
        
        <%-- 아이템 1 --%>
        <div class="col">
            <div class="auction-card card" onclick="location.href='auctionDetail.jsp'">
                <img src="https://placehold.co/300x300/e3f2fd/1565c0?text=Miku+1%2F7" alt="">
                <div class="card-body p-3">
                    <div class="d-flex justify-content-between align-items-center mb-1">
                        <span class="timer-badge"><i class="bi bi-clock me-1"></i>23:14:05</span>
                        <span class="badge-grade">S급</span>
                    </div>
                    <div class="item-name">하츠네 미쿠 1/7 스케일 피규어</div>
                    <div class="item-maker text-truncate">굿스마일컴퍼니</div>
                    <div class="d-flex justify-content-between align-items-end mt-2">
                        <div>
                            <div class="price-label">현재 입찰가</div>
                            <div class="current-price">35,000원</div>
                        </div>
                        <div class="bid-count">입찰 3회</div>
                    </div>
                </div>
            </div>
        </div>

        <%-- 아이템 2 --%>
        <div class="col">
            <div class="auction-card card" onclick="location.href='auctionDetail.jsp'">
                <img src="https://placehold.co/300x300/fce4ec/c62828?text=Racing+Miku" alt="">
                <div class="card-body p-3">
                    <div class="d-flex justify-content-between align-items-center mb-1">
                        <span class="timer-badge text-danger" style="background:#ffebee;"><i class="bi bi-clock me-1"></i>02:10:12</span>
                        <span class="badge-grade">A급</span>
                    </div>
                    <div class="item-name">하츠네 미쿠 Racing Miku 2023</div>
                    <div class="item-maker text-truncate">굿스마일컴퍼니</div>
                    <div class="d-flex justify-content-between align-items-end mt-2">
                        <div>
                            <div class="price-label">현재 입찰가</div>
                            <div class="current-price">28,000원</div>
                        </div>
                        <div class="bid-count">입찰 1회</div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<%-- <jsp:include page="/common/footer.jsp"></jsp:include> --%>
</body>
</html>