<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".loginBtn").click(function(){
			let userId = $("#userId").val();
			let userPwd = $("#userPwd").val();
			
			if(!userId){
				$("#userId+.errMsg").css("display","inline-block");
				$("#userId").focus();
			}else{
				$("#userId+.errMsg").css("display","none");
				if(!userPwd){
					$("#userPwd+.errMsg").css("display","inline-block");
					$("#userPwd").focus();
				}else{
					$("#userPwd+.errMsg").css("display","none");
					$("#loginForm").submit();
				}
			}
		});
	});
</script>
<style type="text/css">
	.errMsg {
		display: none;
	}
	
	/* 화면 전체 높이를 사용하기 위한 설정 */
	html, body {
		height: 100%;
	}
	
	/* 메인 컨테이너가 헤더를 제외한 나머지 공간을 꽉 채우도록 설정 */
	main.container {
		min-height: calc(100vh - 100px); /* 100vh(전체높이) - 헤더 대략적 높이 */
		display: flex;
		flex-direction: column;
	}
	
	/* 로그인 섹션이 남은 공간의 중앙에 오도록 flex-grow 설정 */
	.login-section {
		flex: 1;
		display: flex;
		align-items: center; /* 세로 중앙 정렬 */
	}
</style>
</head>
<body class="bg-light">

<jsp:include page="/common/loginHeader.jsp"></jsp:include>

<main class="container">
	<section class="row justify-content-center login-section">
		<div class="shadow-sm col-md-5 card p-4">
			<h2 class="text-center mb-4">관리자 로그인</h2>
				<c:if test="${param.error == '1'}">
        			<div class="alert alert-danger p-2 text-center" role="alert" style="font-size: 0.9rem;">
            		아이디 또는 비밀번호가 일치하지 않습니다.
        			</div>
    			</c:if>
			
<form action="${pageContext.request.contextPath}/admin/auth/login" method="post" id="loginForm">
    
    <div class="mb-3">
        <label for="userId" class="form-label ms-1">아이디</label> 
        <input type="text" name="adminId" class="form-control" id="userId" aria-describedby="emailHelp">
        <span class="text-danger ms-1 errMsg">아이디를 입력해주세요.</span>
    </div>
    
    <div class="mb-3">
        <label for="userPwd" class="form-label ms-1">비밀번호</label> 
        <input type="password" name="adminPwd" class="form-control" id="userPwd">
        <span class="text-danger ms-1 errMsg">비밀번호를 입력해주세요.</span>
    </div>
    
    <div class="d-grid gap-2 col-6 mx-auto mt-4">
        <button type="button" class="btn btn-outline-dark loginBtn">로그인</button>
    </div>
    
</form>
		</div>
	</section>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>