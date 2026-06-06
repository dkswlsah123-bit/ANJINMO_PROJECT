<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정 페이지</title>
<link rel="stylesheet" href="css/common.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function(){
		$(".pwdUpdateBtn").click(function(){

			let userPwd = $("#userPwd").val();
			let changePwd = $("#changePwd").val();
			let changePwd2 = $("#changePwd2").val();
			
			if(!userPwd){
				$("#userPwd+.errMsg1").css("display","inline-block");
				$("#userPwd").focus();
			}else{
				$("#userPwd+.errMsg1").css("display","none");
				if(!changePwd){
					$("#changePwd+.errMsg1").css("display","inline-block");
					$("#changePwd").focus();
					
				}else{
					$("#changePwd+.errMsg1").css("display","none");
					if(!changePwd2){
						$("#changePwd2+.errMsg1").css("display","inline-block");
						$("#changePwd2").focus();
						
					}else{
						$("#changePwd2+.errMsg1").css("display","none");
						if(changePwd!=changePwd2){
							alert("변경할 비밀번호가 일치하지 않습니다.");
							$("#changePwd").focus();
						}else{
							$("#changePwdForm").submit();
						}
					}
				}
			}	
			
		});
		
		<c:if test="${not empty result}">
        	alert("${result}");
	    </c:if>
	});
</script>
<style type="text/css">
.errMsg{
	display: none;
}
    .btn-primary{
    	background-color: #120e63 !important;
    	border-color: #120e63 !important;
    }
</style>
</head>
<body class="bg-light">
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container" style="margin-top: 50px; margin-bottom: 50px;">
		<div class="row">
			<aside class="col-md-3">
				<%@ include file="/WEB-INF/views/common/mypage_layout.jsp" %>
			</aside>
<section class="col-md-9">
<div class="d-flex justify-content-center">
		<div class="shadow-sm col-md-12 card p-4 pb-5 border-0" >
			<div class="card-header bg-white py-3 border-bottom text-dark">
						<h5 class="mb-0 fw-bold">비밀번호 수정</h5>
					</div>
			<div class="d-flex justify-content-center">
			<div class="col-md-7 card p-4 pb-5 border-0 mt-5">
			<form action="${pageContext.request.contextPath }/user/my/info/change-pw-action" method="post" id="changePwdForm">
				<div class="mb-2">
					<label for="userPwd" class="form-label ms-1">현재 비밀번호<span class="text-danger">*</span></label> 
					<input type="password" class="form-control w-75" id="userPwd" name="userPwd">
					<span class="text-danger ms-1 errMsg errMsg1">비밀번호를 입력해주세요.</span>
					<span class="text-danger ms-1 errMsg errMsg2">비밀번호를 확인해주세요.</span>
				</div>
				<div class="mb-2">
					<label for="userPwd" class="form-label ms-1">변경할 비밀번호<span class="text-danger">*</span></label> 
					<input type="password" class="form-control w-75" id="changePwd" name="changePwd">
					<span class="text-danger ms-1 errMsg errMsg1">비밀번호를 입력해주세요.</span>
					<span class="text-danger ms-1 errMsg errMsg2">8~16글자 사이로 입력해주세요.</span>
				</div>
				<div class="mb-2">
					<label for="userPwd" class="form-label ms-1">변경할 비밀번호 확인<span class="text-danger">*</span></label> 
					<input type="password" class="form-control w-75" id="changePwd2" name="changePwd2">
					<span class="text-danger ms-1 errMsg errMsg1">비밀번호를 입력해주세요.</span>
					<span class="text-danger ms-1 errMsg errMsg2">비밀번호가 일치하지 않습니다.</span>
				</div>
				
				<div class="d-flex justify-content-center g-3 mt-4 ">
					<button type="button" class="btn btn-dark py-2 me-2 w-25 pwdUpdateBtn">정보 수정</button>
					 <button type="reset" class="btn btn-outline-dark py-2">취소</button>
				</div>
			</form>
			</div>
		</div>
		</div>
		</div>
	</section>
		</div>
	</div>

  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>