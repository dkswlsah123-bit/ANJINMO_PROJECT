<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정 페이지</title>
<link rel="stylesheet" href="css/common.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function(){
		$(".infoUpdateBtn").click(function(){
			let userPwd = $("#userPwd").val();
			let userEmail = $("#userEmail").val();
			let userPhone1 = $("#userPhone1").val();
			let userPhone2 = $("#userPhone2").val();
			let userPhone3 = $("#userPhone3").val();
			let zipcode = $("#zipcode").val();
			let addr1 = $("#addr1").val();
			let addr2 = $("#addr2").val();
			
			if(!userPwd){
				$("#userPwd+.errMsg").css("display","inline-block");
				$("#userPwd").focus();
			}else{
				$("#userPwd+.errMsg").css("display","none");
				if(!userEmail){
					$("#userEmail+.errMsg").css("display","inline-block");
					$("#userEmail").focus();
				}else{
					$("#userEmail+.errMsg").css("display","none");
					if(!userPhone1||!userPhone2||!userPhone3){
						$(".phoneBox+.errMsg").css("display","inline-block");
						$("#userPhone1").focus();
					}else{
						$(".phoneBox+.errMsg").css("display","none");
						if(!addr2){
							$(".addrMsg").css("display","inline-block");
							$("#addr2").focus();
						}else{
							$(".addrMsg").css("display","none");
							$("#changeInfoForm").submit();
						}
					}
				}
			}
			
		});
		
		$("#addrBtn").click(function(){
			execDaumPostcode();
			
		});
		function execDaumPostcode() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을 때 실행할 코드를 작성하는 부분입니다.

		            // 도로명 주소 변수
		            var fullAddr = ''; 
		            // 참고항목 변수
		            var extraAddr = ''; 

		            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		            if (data.userSelectedType === 'R') { // 도로명 주소
		                fullAddr = data.roadAddress;
		            } else { // 지번 주소
		                fullAddr = data.jibunAddress;
		            }

		            // 제이쿼리를 사용하여 HTML 필드에 값 할당
		            $("#zipcode").val(data.zonecode); // 우편번호
		            $("#addr1").val(fullAddr);       // 기본주소
		            
		            // 상세주소 필드로 포커스 이동
		          	$("#addr2").val("");
		            $("#addr2").focus();
		        }
		    }).open({
		        left: (window.screen.width / 2) - (500 / 2),
		        top: (window.screen.height / 2) - (600 / 2),
		        popupName: 'postcodePopup' // 팝업 이름을 설정하면 새 탭 방지에 도움이 됩니다.
		    });
		}
		
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
		<div class="shadow-sm col-md-12 card p-4 pb-5 border-0 " >
			<div class="card-header bg-white py-3 border-bottom text-dark">
						<h5 class="mb-0 fw-bold">회원 정보 수정</h5>
					</div>
			<div class="d-flex justify-content-center">
			<div class="col-md-7 card p-4 pb-5 border-0 mt-4">
			<form action="${pageContext.request.contextPath }/user/my/changeInfo-action" method="post" id="changeInfoForm">
				<div class="mb-3">
					<label for="userId" class="form-label ms-1">아이디 <span class="text-danger">*</span></label> 
					<div class="d-flex ">
						<input type="email" class="form-control w-50" id="userId" aria-describedby="emailHelp" value="${sessionScope.loginUser.userLoginId }" disabled="disabled">
					</div>
				</div>
				<div class="mb-3">
					<label for="userPwd" class="form-label ms-1">비밀번호 확인 <span class="text-danger">*</span></label> 
					<input type="password" class="form-control w-75" id="userPwd" name="userPwd">
					<span class="text-danger ms-1 errMsg">비밀번호를 입력해주세요.</span>
				</div>
				<div class="mb-3">
					<label for="userName" class="form-label ms-1">이름 <span class="text-danger">*</span></label> 
					<input type="text" class="form-control w-50" id="userName" value="${sessionScope.loginUser.userName }" disabled="disabled">
				</div>
				<div class="mb-3">
					<label>이메일 <span class="text-danger">*</span></label>
					<input type="email" class="form-control me-1 w-75" id="userEmail" value="${sessionScope.loginUser.userEmail}" name="userEmail">				
				<span class="text-danger ms-1 errMsg">이메일을 입력해주세요.</span>
				</div>
				<div class="mb-3">
					<label>전화번호 <span class="text-danger">*</span></label>
					<div class="d-flex phoneBox">
						<input type="text" class="form-control me-1 w-25" id="userPhone1" maxlength="3" value="${fn:substring(sessionScope.loginUser.userPhone, 0, 3)}" name="userPhone1">
						<span class="mt-2 ms-2 me-2"> - </span>
						<input type="text" class="form-control ms-1 w-25" id="userPhone2" maxlength="4" value="${fn:substring(sessionScope.loginUser.userPhone, 3, 7)}" name="userPhone2">
						<span class="mt-2 ms-2 me-2"> - </span>
						<input type="text" class="form-control ms-1 w-25" id="userPhone3" maxlength="4" value="${fn:substring(sessionScope.loginUser.userPhone, 7, 11)}" name="userPhone3">					
					</div>					
					<span class="text-danger ms-1 errMsg">전화번호를 입력해주세요.</span>
				</div>
				<div class="mb-5">
					<label>주소 <span class="text-danger">*</span></label>
					<div class="d-flex justify-content-start mb-2">
						<input type="text" placeholder="우편번호"  class="form-control w-50 me-2" id="zipcode" readonly onfocus="this.blur();" tabindex="-1"  value="${sessionScope.loginUser.userZipcode }" name="userZipcode">
						<button type="button" class="btn btn-outline-dark ms-2" id="addrBtn">주소검색</button>
					</div>	
					<div class="mb-2">
						<input type="text" class="form-control" placeholder="기본주소" readonly onfocus="this.blur();" tabindex="-1" id="addr1" value="${sessionScope.loginUser.userAddress }" name="userAddr1"/>
					</div>
					<div class="mb-2">
						<input type="text" class="form-control" placeholder="상세주소" id="addr2" value="${sessionScope.loginUser.userAddressDetail }" name="userAddr2" />
					</div>
					<span class="text-danger ms-1 errMsg addrMsg">주소를 입력해주세요.</span>
				</div>
				<div class="d-flex justify-content-center g-3 mt-4 ">
					<button type="button" class="btn btn-dark py-2 me-2 w-25 infoUpdateBtn">정보수정</button>
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