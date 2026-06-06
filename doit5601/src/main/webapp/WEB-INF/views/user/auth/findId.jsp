<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function(){
		
		$('.findIdBtn').click(function(){
			let findIdName = $('#findIdName').val();
			let findIdEmail = $('#findIdEmail').val();
			
			if(!findIdName){
				$('#findIdName+.errMsg').css('display','inline-block');
				$('#findIdName').focus();
			}else{
				$('#findIdName+.errMsg').css('display','none');
				if(!findIdEmail){
					$('#findIdEmail+.errMsg').css('display','inline-block');
					$('#findIdEmail').focus();
				}else{
					$('#findIdEmail+.errMsg').css('display','none');
					$('#findIdForm').submit();
				}
			}
		});	
	});
	
	const findId = "${findId}";
	const errMessage = "${errMsg}";
	
	if(errMessage && errMessage.length>0){
		alert(errMessage);
	}else if(findId && findId.length>0){
		alert("회원님의 아이디는 "+findId+"입니다.");
	}
	
</script>
<style type="text/css">
	.errMsg{
		display: none;
	}
</style>
</head>
<body class="bg-light">

 <%@ include file="/WEB-INF/views/common/header.jsp" %>

<main class="container">
	<section class="row justify-content-center mt-5 mb-5">
		<div class="col-md-5 card p-4">		
			<h2>아이디 찾기</h2>
			<p>회원가입 시 등록한 정보를 입력해주세요.</p>
			<form action="${pageContext.request.contextPath }/user/auth/find-id-action" method="post" id="findIdForm">
				<div class="mb-3">
					<label for="findIdName" class="form-label">이름  <span class="text-danger">*</span></label>
					<input type="text" id="findIdName" class="form-control" name="findIdName"/>
					<span class="text-danger ms-1 errMsg">이름을 입력해주세요.</span>
				</div>
				<div class="mb-3">
					<label for="findIdEmail" class="form-label">이메일 <span class="text-danger">*</span></label>
					<input type="email" class="form-control me-1" id="findIdEmail" name="findIdEmail">				
					<span class="text-danger ms-1 errMsg">이메일을 입력해주세요.</span>
				</div>
				<div class="mb-3">
					<button type="button" class="btn btn-dark w-100 findIdBtn">확인</button>
				</div>
			</form>
		</div>
	
	</section>
</main>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>