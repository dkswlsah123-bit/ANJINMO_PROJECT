<%@ page contentType="text/html; charset=UTF-8"%>
<%--
    [DB연결 후 추가]
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FigureAuction</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body { background-color: #f0f7ff; }
    .navbar { background: white; border-bottom: 1px solid #e3f2fd; }
    .navbar-brand { color: #1565c0 !important; font-weight: 900; font-size: 20px; }
    .nav-link { color: #444 !important; font-size: 14px; font-weight: 500; }
    .nav-link:hover, .nav-link.active { color: #1565c0 !important; }
    .navbar .search-input { border-radius: 20px 0 0 20px; border: 1.5px solid #90caf9; font-size: 13px; width: 240px; }
    .navbar .search-btn { border-radius: 0 20px 20px 0; background-color: #1565c0; border: none; }
    .hero { background: linear-gradient(135deg, #1565c0 0%, #1976d2 60%, #42a5f5 100%); color: white; padding: 52px 0 44px; }
    .hero h1 { font-size: 30px; font-weight: 900; line-height: 1.35; }
    .hero-search input { border-radius: 12px 0 0 12px; border: none; padding: 13px 18px; font-size: 14px; }
    .hero-search button { border-radius: 0 12px 12px 0; background-color: #0d47a1; border: none; padding: 13px 22px; font-weight: bold; }
    .tag-chip { background: rgba(255,255,255,0.18); color: white; border: 1px solid rgba(255,255,255,0.3); border-radius: 20px; padding: 4px 14px; font-size: 12px; cursor: pointer; text-decoration: none; }
    .tag-chip:hover { background: rgba(255,255,255,0.3); color: white; }
    .section-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 16px; }
    .section-header h6 { font-weight: 800; font-size: 16px; color: #1a1a1a; margin: 0; }
    .section-header a { font-size: 13px; color: #1565c0; text-decoration: none; }
    .auction-card { background: white; border-radius: 12px; overflow: hidden; box-shadow: 0 2px 8px rgba(21,101,192,0.07); transition: transform 0.15s; cursor: pointer; }
    .auction-card:hover { transform: translateY(-4px); box-shadow: 0 8px 20px rgba(21,101,192,0.13); }
    .auction-card img { width: 100%; aspect-ratio: 1; object-fit: cover; }
    .timer-pill { background: #fff3e0; color: #e65100; font-size: 11px; font-weight: bold; border-radius: 20px; padding: 2px 10px; }
    .timer-pill.urgent { background: #ffebee; color: #c62828; }
    .current-price { color: #1565c0; font-size: 15px; font-weight: 800; }
    .collection-card { background: white; border-radius: 12px; overflow: hidden; box-shadow: 0 2px 8px rgba(21,101,192,0.07); transition: transform 0.15s; }
    .collection-card:hover { transform: translateY(-4px); box-shadow: 0 8px 20px rgba(21,101,192,0.13); }
    .collection-card img { width: 100%; aspect-ratio: 1; object-fit: cover; cursor: pointer; }
    .owner-avatar { width: 22px; height: 22px; border-radius: 50%; object-fit: cover; }
    .request-btn { font-size: 11px; padding: 3px 11px; border-radius: 20px; }
    .sub-banner { background: white; border-radius: 14px; padding: 22px 28px; border: 1px solid #bbdefb; }
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<%-- [DB연결 후] href를 ${ctx}/main, ${ctx}/product/list, ${ctx}/product/myList 로 변경 --%>
<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
        <a class="navbar-brand" href="main.jsp">경매나라</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navMenu">
            <ul class="navbar-nav me-auto ms-4 gap-1">
                <li class="nav-item"><a class="nav-link active" href="main.jsp">경매</a></li>
                <li class="nav-item"><a class="nav-link" href="productList.jsp">컬렉션</a></li>
                <li class="nav-item"><a class="nav-link" href="productMyList.jsp">내 상품</a></li>
            </ul>
            <div class="d-flex me-3">
                <input type="text" class="form-control form-control-sm search-input" placeholder="피규어 검색...">
                <button class="btn btn-primary btn-sm search-btn px-3">검색</button>
            </div>
            <div class="d-flex gap-2">
                <a href="#" class="btn btn-outline-primary btn-sm">로그인</a>
                <a href="#" class="btn btn-primary btn-sm">회원가입</a>
            </div>
        </div>
    </div>
</nav>

<section class="hero">
    <div class="container">
        <h1 class="mb-2">내 컬렉션을 전시하고<br>경매로 연결하세요</h1>
        <p class="mb-4 opacity-75" style="font-size:14px">피규어를 보관·전시하고, 원하는 피규어의 경매를 요청해보세요.</p>
        <div class="input-group hero-search mb-4" style="max-width:460px">
            <input type="text" class="form-control" placeholder="원하는 피규어를 검색해보세요">
            <button class="btn btn-dark">검색</button>
        </div>
        <div class="d-flex flex-wrap gap-2">
            <a href="#" class="tag-chip"># VOCALOID</a>
            <a href="#" class="tag-chip"># 원피스</a>
            <a href="#" class="tag-chip"># 귀멸의칼날</a>
            <a href="#" class="tag-chip"># 굿스마일</a>
            <a href="#" class="tag-chip"># 미개봉</a>
        </div>
    </div>
</section>

<section class="container mt-5">
    <div class="section-header">
        <h6>지금 진행중인 경매</h6>
        <a href="auctionList.jsp">전체보기 →</a>
    </div>
    <div class="row row-cols-2 row-cols-md-4 g-3">

        <%--
            DB연결 c:forEach로 
            <c:forEach var="a" items="${auctionList}">
            <div class="col">
                <div class="auction-card" onclick="location.href='${ctx}/auction/detail?auctionId=${a.auctionId}'">
                    <img src="${ctx}${a.imgUrl}" alt="">
                    <div class="p-3">
                        <div class="d-flex justify-content-between align-items-center mb-1">
                            <span class="timer-pill">${a.remainTime}</span>
                            <span class="badge" style="background:#e3f2fd;color:#1565c0;font-size:10px">${a.grade}급</span>
                        </div>
                        <p class="fw-bold small mb-1">${a.auctionName}</p>
                        <p class="text-muted mb-1" style="font-size:11px">${a.makerName}</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="current-price"><fmt:formatNumber value="${a.currentPrice}" pattern="#,###"/>원</span>
                            <span class="text-muted" style="font-size:11px">입찰 ${a.bidCount}회</span>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
        --%>

        <div class="col">
            <div class="auction-card" onclick="location.href='auctionDetail.jsp?auctionId=A001'">
                <img src="https://placehold.co/300x300/e3f2fd/1565c0?text=Miku+1%2F7" alt="">
                <div class="p-3">
                    <div class="d-flex justify-content-between align-items-center mb-1">
                        <span class="timer-pill">23:14:05</span>
                        <span class="badge" style="background:#e3f2fd;color:#1565c0;font-size:10px">S급</span>
                    </div>
                    <p class="fw-bold small mb-1" style="line-height:1.3">하츠네 미쿠 1/7 스케일 피규어</p>
                    <p class="text-muted mb-1" style="font-size:11px">굿스마일컴퍼니</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="current-price">35,000원</span>
                        <span class="text-muted" style="font-size:11px">입찰 3회</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="auction-card" onclick="location.href='auctionDetail.jsp?auctionId=A002'">
                <img src="https://placehold.co/300x300/fce4ec/c62828?text=Racing+Miku" alt="">
                <div class="p-3">
                    <div class="d-flex justify-content-between align-items-center mb-1">
                        <span class="timer-pill">47:30:12</span>
                        <span class="badge" style="background:#e3f2fd;color:#1565c0;font-size:10px">A급</span>
                    </div>
                    <p class="fw-bold small mb-1" style="line-height:1.3">하츠네 미쿠 Racing Miku 2023</p>
                    <p class="text-muted mb-1" style="font-size:11px">굿스마일컴퍼니</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="current-price">28,000원</span>
                        <span class="text-muted" style="font-size:11px">입찰 1회</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="auction-card" onclick="location.href='auctionDetail.jsp?auctionId=A003'">
                <img src="https://placehold.co/300x300/fff3e0/e65100?text=Luffy+Gear5" alt="">
                <div class="p-3">
                    <div class="d-flex justify-content-between align-items-center mb-1">
                        <span class="timer-pill urgent">01:22:44</span>
                        <span class="badge" style="background:#e3f2fd;color:#1565c0;font-size:10px">S급</span>
                    </div>
                    <p class="fw-bold small mb-1" style="line-height:1.3">몽키 D. 루피 기어5 피규어</p>
                    <p class="text-muted mb-1" style="font-size:11px">반다이</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="current-price">62,000원</span>
                        <span class="text-muted" style="font-size:11px">입찰 7회</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="auction-card" onclick="location.href='auctionDetail.jsp?auctionId=A004'">
                <img src="https://placehold.co/300x300/f3e5f5/7b1fa2?text=Nendoroid" alt="">
                <div class="p-3">
                    <div class="d-flex justify-content-between align-items-center mb-1">
                        <span class="timer-pill">71:05:30</span>
                        <span class="badge" style="background:#e3f2fd;color:#1565c0;font-size:10px">A급</span>
                    </div>
                    <p class="fw-bold small mb-1" style="line-height:1.3">하츠네 미쿠 넨도로이드 #33</p>
                    <p class="text-muted mb-1" style="font-size:11px">굿스마일컴퍼니</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="current-price">18,000원</span>
                        <span class="text-muted" style="font-size:11px">입찰 2회</span>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>

<section class="container mt-5">
    <div class="sub-banner d-flex justify-content-between align-items-center flex-wrap gap-3">
        <div>
            <h6 class="fw-bold mb-1" style="color:#1565c0">갖고 싶은 피규어가 있나요?</h6>
            <p class="mb-0 text-muted small">다른 유저의 컬렉션에서 원하는 피규어를 발견했다면 경매 요청을 보내보세요.</p>
        </div>
        <a href="productList.jsp" class="btn btn-primary btn-sm px-4">컬렉션 둘러보기 →</a>
    </div>
</section>

<section class="container mt-5 mb-5">
    <div class="section-header">
        <h6>유저 컬렉션 구경하기</h6>
        <a href="productList.jsp">전체보기 →</a>
    </div>
    <div class="row row-cols-2 row-cols-md-4 g-3">

        <%--
            DB연결 c:forEach로 교체
            <c:forEach var="p" items="${collectionList}">
            <div class="col">
                <div class="collection-card">
                    <img src="${ctx}${p.imgUrl}" onclick="location.href='${ctx}/product/detail?productId=${p.productId}'" alt="">
                    <div class="p-3">
                        <p class="fw-bold small mb-1">${p.productName}</p>
                        <p class="text-muted mb-2" style="font-size:11px">${p.makerName} · ${p.grade}급 · ${p.openedYn eq 'N' ? '미개봉' : '개봉'}</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <span style="font-size:11px;color:#666">${p.memberNickname}</span>
                            <button class="btn btn-outline-primary request-btn">경매 요청</button>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
        --%>

        <div class="col">
            <div class="collection-card">
                <img src="https://placehold.co/300x300/e3f2fd/1565c0?text=Miku+1%2F7" alt=""
                     onclick="location.href='productDetail.jsp?productId=P001'">
                <div class="p-3">
                    <p class="fw-bold small mb-1" style="line-height:1.3">하츠네 미쿠 1/7 스케일 피규어</p>
                    <p class="text-muted mb-2" style="font-size:11px">굿스마일컴퍼니 · S급 · 미개봉</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <span style="font-size:11px;color:#666">miku_fan</span>
                        <button class="btn btn-outline-primary request-btn">경매 요청</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="collection-card">
                <img src="https://placehold.co/300x300/fce4ec/c62828?text=Racing+Miku" alt=""
                     onclick="location.href='productDetail.jsp?productId=P002'">
                <div class="p-3">
                    <p class="fw-bold small mb-1" style="line-height:1.3">하츠네 미쿠 Racing Miku 2023</p>
                    <p class="text-muted mb-2" style="font-size:11px">굿스마일컴퍼니 · A급 · 개봉</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <span style="font-size:11px;color:#666">racing_col</span>
                        <button class="btn btn-outline-primary request-btn">경매 요청</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="collection-card">
                <img src="https://placehold.co/300x300/fff3e0/e65100?text=Luffy+Gear5" alt=""
                     onclick="location.href='productDetail.jsp?productId=P003'">
                <div class="p-3">
                    <p class="fw-bold small mb-1" style="line-height:1.3">몽키 D. 루피 기어5 피규어</p>
                    <p class="text-muted mb-2" style="font-size:11px">반다이 · S급 · 미개봉</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <span style="font-size:11px;color:#666">onepiece_kr</span>
                        <button class="btn btn-outline-primary request-btn">경매 요청</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="collection-card">
                <img src="https://placehold.co/300x300/f3e5f5/7b1fa2?text=Nendoroid" alt=""
                     onclick="location.href='productDetail.jsp?productId=P004'">
                <div class="p-3">
                    <p class="fw-bold small mb-1" style="line-height:1.3">하츠네 미쿠 넨도로이드 #33</p>
                    <p class="text-muted mb-2" style="font-size:11px">굿스마일컴퍼니 · A급 · 개봉</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <span style="font-size:11px;color:#666">nendo_shop</span>
                        <button class="btn btn-outline-primary request-btn">경매 요청</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>

</body>
</html>
