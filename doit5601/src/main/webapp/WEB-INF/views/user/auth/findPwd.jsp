<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function(){
		
		$('.findPwdBtn').click(function(){
			let findPwId = $('#findPwId').val();
			let findPwName = $('#findPwName').val();
			let findPwEmail = $('#findPwEmail').val();
			
			if(!findPwId){
				$('#findPwId+.errMsg').css('display','inline-block');
				$('#findPwId').focus();
			}else{
				$('#findPwId+.errMsg').css('display','none');
				if(!findPwName){
					$('#findPwName+.errMsg').css('display','inline-block');
					$('#findPwName').focus();
				}else{
					$('#findPwName+.errMsg').css('display','none');
					if(!findPwEmail){
						$('#findPwEmail+.errMsg').css('display','inline-block');
						$('#findPwEmail').focus();
					}else{
						$('#findPwEmail+.errMsg').css('display','none');
						$('#findPwdForm').submit();
					}
				}
			}
		});	
	});
	
	const findPw = "${findPw}";
	const errMessage = "${errMsg}";
	
	if(errMessage && errMessage.length>0){
		alert(errMessage);
	}else if(findPw && findPw.length>0){
		alert("회원님의 비밀번호는 "+findPw+"입니다.");
	}
	
</script>
<style type="text/css">
.errMsg{display: none;}
</style>
</head>
<body class="bg-light">
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<main class="container">
	<section class="row justify-content-center mt-5 mb-5">
		<div class="col-md-5 card p-4">		
			<h2>비밀번호 찾기</h2>
			<p>회원가입 시 등록한 정보를 입력해주세요.</p>
			<form action="${pageContext.request.contextPath }/user/auth/find-pw-action" method="post" id="findPwdForm">
				<div class="mb-3">
					<label for="findPwId" class="form-label">아이디  <span class="text-danger">*</span></label>
					<input type="text" id="findPwId" class="form-control" name="findPwId" />
					<span class="text-danger ms-1 errMsg">아이디를 입력해주세요.</span>
				</div>
				<div class="mb-3">
					<label for="findPwName" class="form-label">이름 <span class="text-danger">*</span></label>
					<input type="text" id="findPwName" class="form-control" name="findPwName" />
					<span class="text-danger ms-1 errMsg">이름을 입력해주세요.</span>
				</div>
				<div class="mb-3">
					<label for="findPwEmail" class="form-label">이메일 <span class="text-danger">*</span></label>
					<input type="email" class="form-control me-1" id="findPwEmail" name="findPwEmail">				
				<span class="text-danger ms-1 errMsg">이메일을 입력해주세요.</span>
				</div>
				<div class="mb-3">
					<button type="button" class="btn btn-dark w-100 findPwdBtn">확인</button>
				</div>
			</form>
		</div>
	
	</section>
</main>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>