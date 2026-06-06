<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입완료 페이지</title>
<link rel="stylesheet" href="css/common.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body class="bg-light">
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<main class="container">
	<section class="row justify-content-center mt-5 mb-5">
		<div class="shadow-sm col-md-5 card p-4 pb-5">
				<h3>회원가입 실패</h3>
				<div>
				실패 사유: "${errMsg }" 
				</div>
				<!-- 회원가입 버튼 만들어주기  -->
		</div>
	</section>
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>