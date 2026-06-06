<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상품 수정</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        body { background-color: #e3f2fd; }
        .navbar { background: white; border-bottom: 1px solid #bbdefb; }
        .navbar-brand { color: #1976d2 !important; font-weight: 800; }
        .page-header {
            background: linear-gradient(135deg, #2196f3 0%, #1565c0 100%);
            color: white; padding: 30px 24px; border-radius: 15px; margin-bottom: 30px;
            box-shadow: 0 4px 15px rgba(21, 101, 192, 0.3);
        }
        .card { border: none; border-radius: 15px; box-shadow: 0 5px 20px rgba(0,0,0,0.08); }
        .section-title {
            font-size: 14px; font-weight: 700; color: #1976d2;
            margin-bottom: 15px; padding-left: 10px; border-left: 4px solid #2196f3;
        }
        .upload-box {
            border: 2px dashed #90caf9; border-radius: 12px; padding: 30px;
            text-align: center; background-color: #f8fbff; cursor: pointer; transition: 0.3s;
        }
        .upload-box:hover { border-color: #1976d2; background-color: #e3f2fd; }
        .img-preview { display: flex; gap: 8px; flex-wrap: wrap; margin-top: 10px; }
        .img-preview img { width: 80px; height: 80px; object-fit: cover; border-radius: 8px; border: 1px solid #dee2e6; }
        .form-label { font-size: 13px; color: #37474f; }
        .btn-primary { background-color: #1976d2; border: none; }
        .btn-primary:hover { background-color: #0d47a1; }
        .btn-light { background-color: #cfd8dc; color: #37474f; border: none; }
        .btn-light:hover { background-color: #b0bec5; }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
        <a class="navbar-brand" href="${ctx}/main">경매나라</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-4">
                <li class="nav-item"><a href="${ctx}/auction/list" class="nav-link">경매</a></li>
                <li class="nav-item"><a href="${ctx}/product/list" class="nav-link">컬렉션</a></li>
                <li class="nav-item"><a href="${ctx}/product/myList" class="nav-link fw-bold" style="color:#1976d2;">내 상품</a></li>
            </ul>
        </div>
    </div>
</nav>

<c:if test="${not empty errorMsg}">
    <div class="container mt-3">
        <div class="alert alert-danger">${errorMsg}</div>
    </div>
</c:if>

<div class="container mt-4 mb-5" style="max-width:720px">
    <div class="page-header text-center">
        <h4 class="mb-1 fw-bold">상품 정보 수정</h4>
        <p class="mb-0 small opacity-90">변경할 내용을 입력해주세요.</p>
    </div>

    <div class="card p-4">
        <form action="${ctx}/product/update" method="post" enctype="multipart/form-data">
            <input type="hidden" name="productId" value="${product.productId}">

            <%-- 사진 섹션 --%>
            <p class="section-title">컬렉션 사진</p>
            <div class="mb-4">
                <div class="row g-3">
                    <div class="col-4">
                        <p class="form-label fw-bold text-center mb-1">사진 1 <span class="text-danger">*</span></p>
                        <div class="upload-box" onclick="document.getElementById('img1').click()">
                            <c:choose>
                                <c:when test="${not empty product.imagePath1}">
                                    <img src="${ctx}/images/${product.imagePath1}" style="width:100%;max-height:80px;object-fit:cover;border-radius:6px;">
                                </c:when>
                                <c:otherwise>
                                    <i class="bi bi-camera-fill fs-3" style="color:#1976d2;"></i>
                                    <p class="mb-0 small mt-1">메인 사진</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <input type="file" id="img1" name="productImage1" accept="image/*" class="d-none" onchange="showSinglePreview(this, 'preview1')">
                        <div id="preview1" class="img-preview justify-content-center"></div>
                    </div>
                    <div class="col-4">
                        <p class="form-label fw-bold text-center mb-1">사진 2</p>
                        <div class="upload-box" onclick="document.getElementById('img2').click()">
                            <c:choose>
                                <c:when test="${not empty product.imagePath2}">
                                    <img src="${ctx}/images/${product.imagePath2}" style="width:100%;max-height:80px;object-fit:cover;border-radius:6px;">
                                </c:when>
                                <c:otherwise>
                                    <i class="bi bi-camera-fill fs-3" style="color:#90caf9;"></i>
                                    <p class="mb-0 small mt-1">추가 사진</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <input type="file" id="img2" name="productImage2" accept="image/*" class="d-none" onchange="showSinglePreview(this, 'preview2')">
                        <div id="preview2" class="img-preview justify-content-center"></div>
                    </div>
                    <div class="col-4">
                        <p class="form-label fw-bold text-center mb-1">사진 3</p>
                        <div class="upload-box" onclick="document.getElementById('img3').click()">
                            <c:choose>
                                <c:when test="${not empty product.imagePath3}">
                                    <img src="${ctx}/images/${product.imagePath3}" style="width:100%;max-height:80px;object-fit:cover;border-radius:6px;">
                                </c:when>
                                <c:otherwise>
                                    <i class="bi bi-camera-fill fs-3" style="color:#90caf9;"></i>
                                    <p class="mb-0 small mt-1">추가 사진</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <input type="file" id="img3" name="productImage3" accept="image/*" class="d-none" onchange="showSinglePreview(this, 'preview3')">
                        <div id="preview3" class="img-preview justify-content-center"></div>
                    </div>
                </div>
            </div>

            <p class="section-title">피규어 정보</p>
            <div class="row g-3 mb-4">
                <div class="col-12">
                    <label class="form-label fw-bold">상품 발매명 <span class="text-danger">*</span></label>
                    <input type="text" name="productName" class="form-control" value="${product.productReleaseName}" required>
                </div>

                <div class="col-12">
                    <label class="form-label fw-bold">상품 별칭</label>
                    <input type="text" name="productAlias" class="form-control" value="${product.productAlias}">
                </div>

                <div class="col-md-6">
                    <label class="form-label fw-bold">제조사 <span class="text-danger">*</span></label>
                    <select name="makerId" class="form-select" required>
                        <option value="">선택하세요</option>
                        <c:forEach var="m" items="${makerList}">
                            <option value="${m.manufacturerId}" <c:if test="${product.manufacturerId eq m.manufacturerId}">selected</c:if>>${m.manufacturerName}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="col-md-6">
                    <label class="form-label fw-bold">상품 등급 <span class="text-danger">*</span></label>
                    <select name="gradeCode" class="form-select" required>
                        <option value="">선택하세요</option>
                        <c:forEach var="g" items="${gradeList}">
                            <option value="${g.productGradeId}" <c:if test="${product.productGradeId eq g.productGradeId}">selected</c:if>>${g.productGradeName}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="col-md-6">
                    <label class="form-label fw-bold">장르 <span class="text-danger">*</span></label>
                    <select name="genreCode" class="form-select" required>
                        <option value="">선택하세요</option>
                        <c:forEach var="g" items="${genreList}">
                            <option value="${g.productGenreId}" <c:if test="${product.productGenreId eq g.productGenreId}">selected</c:if>>${g.productGenreName}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="col-md-6">
                    <label class="form-label fw-bold">사이즈/스케일 <span class="text-danger">*</span></label>
                    <select name="sizeCode" class="form-select" required>
                        <option value="">선택하세요</option>
                        <c:forEach var="s" items="${sizeList}">
                            <option value="${s.productSizeId}" <c:if test="${product.productSizeId eq s.productSizeId}">selected</c:if>>${s.productSizeName}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="col-md-6">
                    <label class="form-label fw-bold">작품명</label>
                    <input type="text" name="workName" class="form-control" value="${product.workName}">
                </div>

                <div class="col-md-6">
                    <label class="form-label fw-bold">캐릭터명</label>
                    <input type="text" name="characterName" class="form-control" value="${product.characterName}">
                </div>
            </div>

            <p class="section-title">컬렉션 노트</p>
            <div class="row g-3 mb-4">
                <div class="col-md-6">
                    <label class="form-label fw-bold">구매 연도</label>
                    <%-- 기존 값 앞 4자리(연도)만 추출 --%>
                    <c:set var="currentYear" value="${product.purchaseDateTime != null ? product.purchaseDateTime.substring(0, 4) : ''}" />
                    <select name="purchaseDate" class="form-select">
                        <option value="">선택하세요</option>
                        <c:set var="nowYear"><%= java.time.Year.now().getValue() %></c:set>
                        <c:forEach var="y" begin="0" end="10">
                            <c:set var="year" value="${nowYear - y}" />
                            <option value="${year}" <c:if test="${currentYear eq year.toString()}">selected</c:if>>${year}년</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="col-md-3">
                    <label class="form-label fw-bold">개봉 여부</label>
                    <select name="openedCode" class="form-select">
                        <option value="1" <c:if test="${product.isOpenedName eq '미개봉'}">selected</c:if>>미개봉</option>
                        <option value="0" <c:if test="${product.isOpenedName eq '개봉'}">selected</c:if>>개봉</option>
                    </select>
                </div>

                <div class="col-md-3">
                    <label class="form-label fw-bold">파츠 누락</label>
                    <select name="missingCode" class="form-select">
                        <option value="0" <c:if test="${product.isPartsMissingName eq '정상'}">selected</c:if>>없음</option>
                        <option value="1" <c:if test="${product.isPartsMissingName eq '누락'}">selected</c:if>>있음</option>
                    </select>
                </div>

                <div class="col-md-6">
                    <label class="form-label fw-bold">공개 여부</label>
                    <select name="publicCode" class="form-select">
                        <option value="1" <c:if test="${product.isPublicName eq '공개'}">selected</c:if>>공개</option>
                        <option value="0" <c:if test="${product.isPublicName eq '비공개'}">selected</c:if>>비공개</option>
                    </select>
                </div>

                <div class="col-12">
                    <label class="form-label fw-bold">상세 설명</label>
                    <textarea name="description" class="form-control" rows="5">${product.descriptions}</textarea>
                </div>
            </div>

            <div class="d-flex gap-3 mt-5">
                <button type="button" class="btn btn-light w-50 py-3 fw-bold" onclick="history.back()">돌아가기</button>
                <button type="submit" class="btn btn-primary w-50 py-3 fw-bold shadow">수정하기</button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
function showSinglePreview(input, previewId) {
    var preview = document.getElementById(previewId);
    preview.innerHTML = '';
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            var img = document.createElement('img');
            img.src = e.target.result;
            preview.appendChild(img);
        };
        reader.readAsDataURL(input.files[0]);
    }
}
</script>
</body>
</html>
