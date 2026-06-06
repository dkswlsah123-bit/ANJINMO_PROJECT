<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 - 통합 신고 관리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<style>
    /* 공통 스타일 가이드 */
    .section-title { border-left: 5px solid #212529; padding-left: 15px; margin-bottom: 20px; font-weight: bold; }
    .table-container { background-color: #ffffff; border: 1px solid #dee2e6; border-radius: 4px; overflow: hidden; }
    
    /* 테이블 행 호버 효과 */
    .report-row { cursor: pointer; transition: background-color 0.2s; }
    .report-row:hover { background-color: #f8f9fa; }
    
    /* 상태 배지 스타일 커스텀 */
    .bg-pending { background-color: #fff3cd; color: #856404; border: 1px solid #ffeeba; } /* 미확인/처리중 */
    .bg-completed { background-color: #e2e3e5; color: #383d41; } /* 처리완료 */
    
    .btn-action { padding: 4px 12px; font-size: 0.85rem; font-weight: bold; }

	/* 페이지네이션 디자인 통일 */
	.pagination .page-link {
	    color: #212529;             /* 기본 글자색: 검정 */
	    border-color: #dee2e6;
	    padding: 8px 16px;
	}
	
	.pagination .page-item.active .page-link {
	    background-color: #212529 !important; /* 활성 페이지: 검정 배경 */
	    border-color: #212529 !important;
	    color: #ffffff !important;            /* 활성 페이지: 흰색 글자 */
	}
	
	.pagination .page-link:hover {
	    background-color: #f1f3f5;  /* 마우스 호버 시 연한 회색 */
	    color: #212529;
	}
	
	/* 처음으로/마지막으로 버튼 너비 조정 */
	.page-item .page-link span {
	    font-size: 0.9rem;
	}
</style>
</head>
<body class="bg-light">
    <div class="container-fluid py-4">
        <h4 class="fw-bold mb-4">신고 통합 관리</h4>

        <div class="mb-5">
            <div class="d-flex justify-content-between align-items-end mb-3">
                <h5 class="section-title text-primary mb-0">접수된 신고 <span class="badge bg-primary ms-2">${pendingList.size()}</span></h5>
                <div class="btn-group btn-group-sm">
                    <button type="button" class="btn btn-outline-secondary active">전체</button>
                    <button type="button" class="btn btn-outline-secondary">미확인</button>
                    <button type="button" class="btn btn-outline-secondary">처리중</button>
                </div>
            </div>
            
            <div class="table-container shadow-sm">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-light">
                        <tr class="text-center">
                            <th style="width: 80px;">번호</th>
                            <th style="width: 150px;">카테고리</th>
                            <th>신고 제목</th>
                            <th style="width: 120px;">신고자</th>
                            <th style="width: 180px;">신고일</th>
                            <th style="width: 100px;">상태</th>
                            <th style="width: 100px;">관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty pendingList}">
                                <c:forEach var="report" items="${pendingList}">
                                <tr class="report-row text-center" onclick="location.href='reportsProcess.jsp?id=${report.id}'">
                                    <td>${report.id}</td>
                                    <td><span class="badge bg-secondary">${report.category}</span></td>
                                    <td class="text-start text-truncate" style="max-width: 300px;">${report.title}</td>
                                    <td>${report.reporterName}</td>
                                    <td>${report.regDate}</td>
                                    <td>
                                        <c:if test="${report.status eq '미확인'}"><span class="badge bg-danger">미확인</span></c:if>
                                        <c:if test="${report.status eq '처리중'}"><span class="badge bg-warning text-dark">처리중</span></c:if>
                                    </td>
                                    <td><button class="btn btn-action btn-outline-primary">처리</button></td>
                                </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr><td colspan="7" class="text-center py-5 text-muted">새로 접수된 신고가 없습니다.</td></tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row mt-4 mb-5">
		    <div class="col-12 d-flex justify-content-center">
		        <nav aria-label="Page navigation">
		            <ul class="pagination">
		                <li class="page-item">
		                    <a class="page-link" href="#" aria-label="First">
		                        <span aria-hidden="true">처음으로</span>
		                    </a>
		                </li>
		                
		                <li class="page-item"><a class="page-link" href="#">11</a></li>
		                <li class="page-item"><a class="page-link" href="#">12</a></li>
		                
		                <li class="page-item active" aria-current="page">
		                    <span class="page-link">13</span>
		                </li>
		                
		                <li class="page-item"><a class="page-link" href="#">14</a></li>
		                <li class="page-item"><a class="page-link" href="#">15</a></li>
		                <li class="page-item"><a class="page-link" href="#">16</a></li>
		                <li class="page-item"><a class="page-link" href="#">17</a></li>
		                <li class="page-item"><a class="page-link" href="#">18</a></li>
		                <li class="page-item"><a class="page-link" href="#">19</a></li>
		                <li class="page-item"><a class="page-link" href="#">20</a></li>
		
		                <li class="page-item">
		                    <a class="page-link" href="#" aria-label="Last">
		                        <span aria-hidden="true">마지막으로</span>
		                    </a>
		                </li>
		            </ul>
		        </nav>
		    </div>
		</div>

        <div>
            <div class="d-flex justify-content-between align-items-end mb-3">
                <h5 class="section-title text-secondary mb-0">최근 처리 이력</h5>
                <div class="d-flex gap-2">
                    <input type="date" class="form-control form-control-sm" style="width: 150px;">
                    <button class="btn btn-sm btn-dark">이력 검색</button>
                </div>
            </div>

            <div class="table-container shadow-sm">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-light">
                        <tr class="text-center">
                            <th style="width: 80px;">번호</th>
                            <th>신고 제목</th>
                            <th style="width: 120px;">신고자</th>
                            <th style="width: 120px;">처리자</th>
                            <th style="width: 180px;">처리일</th>
                            <th style="width: 120px;">결과</th>
                        </tr>
                    </thead>
                    <tbody class="text-muted">
                        <c:choose>
                            <c:when test="${not empty historyList}">
                                <c:forEach var="history" items="${historyList}">
                                <tr class="report-row text-center" onclick="location.href='myReportDetail.jsp?id=${history.id}'">
                                    <td>${history.id}</td>
                                    <td class="text-start">${history.title}</td>
                                    <td>${history.reporterName}</td>
                                    <td>${history.adminName}</td>
                                    <td>${history.processDate}</td>
                                    <td><span class="text-success fw-bold">처리완료</span></td>
                                </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr><td colspan="6" class="text-center py-5">처리된 이력이 없습니다.</td></tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row mt-4 mb-3">
            <div class="col-12 d-flex justify-content-center">
                <nav aria-label="Page navigation">
                    <ul class="pagination mb-0">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="First">
                                <span aria-hidden="true">처음으로</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">11</a></li>

                        <li class="page-item active" aria-current="page">
		                    <span class="page-link">12</span>
		                </li>

                        <li class="page-item"><a class="page-link" href="#">13</a></li>
                        <li class="page-item"><a class="page-link" href="#">14</a></li>
		                <li class="page-item"><a class="page-link" href="#">15</a></li>
		                <li class="page-item"><a class="page-link" href="#">16</a></li>
		                <li class="page-item"><a class="page-link" href="#">17</a></li>
		                <li class="page-item"><a class="page-link" href="#">18</a></li>
		                <li class="page-item"><a class="page-link" href="#">19</a></li>
		                <li class="page-item"><a class="page-link" href="#">20</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Last">
                                <span aria-hidden="true">마지막으로</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>

        <div class="d-flex justify-content-center mt-0 py-5">
            <button type="button" class="btn btn-secondary px-5 fw-bold" onclick="location.href='mainDashBoard.jsp'">
                대시보드로 돌아가기
            </button>
        </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>