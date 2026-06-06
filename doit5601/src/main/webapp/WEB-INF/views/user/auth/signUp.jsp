<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="css/common.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function(){
		let isIdChecked = false;
		
		$(".signUpBtn").click(function() {
			if (!isIdChecked) {
		        alert("아이디 중복 확인은 필수입니다.");
		        $("#idChkBtn").focus(); // 중복확인 버튼으로 포커스 이동
		        return false; // 더 이상 진행하지 않고 중단
		    }
			
			$(".errMsg").hide();
	        let isValid = true;
	        

	        // 2. 필수 입력값(.required) 순회 검증
	        $(".required").each(function() {
	            let $el = $(this);
	            // 부모 또는 형제 요소 중에서 해당 필드의 에러 메시지 찾기
	            let $errorSpan = $el.closest(".mb-3, .mb-5").find(".errMsg");

	            if (!$el.val().trim()) {
	                $errorSpan.show(); // 메시지 표시
	                $el.focus();       // 포커스 이동
	                isValid = false;   // 검증 실패 마킹
	                return false;      // each 루프 중단 (break)
	            }
	        });

	        // 3. 필수값이 다 입력되었다면, 추가 특수 검증 진행
	        if (isValid) {
	            // 비밀번호 일치 확인
	            if ($("#userPwd").val() !== $("#userPwdCheck").val()) {
	                $("#userPwdCheck").closest(".mb-3").find(".errMsg").show();
	                $("#userPwdCheck").focus();
	                return;
	            }

	            // 4. 모든 검증 통과 시 폼 전송
	            $("#signUpForm").submit();
	        }
	    });
		
		
		$("#idChkBtn").click(function(){
			//alert("확인");
			
			let id = $("#userId").val();
			
			if(!id){
				alert("아이디를 입력해주세요.");
				$("#userId").focus();
				return;
			}
		
			$.ajax({
				"type":"POST"
				,"url": "${pageContext.request.contextPath}/user/auth/id-check"
				, "data": {"userId" : id}
				, "success": function(args){
					if (args === "AVAILABLE") {
		                alert("사용 가능한 아이디입니다.");
		                $("#userId").prop("readonly", true); 
		                isIdChecked = true;
		            } else {
		                alert("이미 사용 중인 아이디입니다.");
		                $("#userId").val("").focus();
		            }
				}
				, "error": function(){
					alert("서버 통신 오류가 발생했습니다.");
				}
			});

			
		});
		
		$(".resetBtn").click(function(){
			setTimeout(function() {
		        $("#userId").prop("readonly", false);
				$("#userId").focus();
		    }, 10);
			
		});
		
		$("#addrBtn").click(function(){
			execDaumPostcode();
			
		});
		function execDaumPostcode() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을 때 실행할 코드를 작성하는 부분입니다.

		            // 도로명 주소 변수
		            let fullAddr = ''; 
		            // 참고항목 변수
		            let extraAddr = ''; 

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
		            $("#addr2").focus();
		        }
		    }).open({
		        left: (window.screen.width / 2) - (500 / 2),
		        top: (window.screen.height / 2) - (600 / 2),
		        popupName: 'postcodePopup'
		    });
		}
	
	});
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
		<div class="shadow-sm col-md-5 card p-4 pb-5">
			<h2 class="text-center">회원가입</h2>
			<form action="${pageContext.request.contextPath }/user/auth/sign-up-action" method="post" id="signUpForm">
				<div class="mb-3">
					<label for="userId" class="form-label ms-1">아이디 <span class="text-danger">*</span></label> 
					<div class="d-flex ">
						<input type="text" class="form-control w-50 required" id="userId" aria-describedby="emailHelp" name="userId">
						<button type="button" class="btn btn-outline-dark ms-3" id="idChkBtn" >중복확인</button>						
					</div>
						<span class="text-danger ms-1 errMsg">아이디를 입력해주세요.</span>
						
				</div>
				<div class="mb-3">
					<label for="userPwd" class="form-label ms-1">비밀번호 <span class="text-danger">*</span></label> 
					<input type="password" class="form-control w-75 required" id="userPwd" name="userPwd">
					<span class="text-danger ms-1 errMsg">비밀번호를 입력해주세요.</span>
				</div>
				<div class="mb-3">
					<label for="userPwdCheck" class="form-label ms-1">비밀번호 확인 <span class="text-danger">*</span></label> 
					<input type="password" class="form-control w-75 required" id="userPwdCheck" name="userPwdCheck">
					<span class="text-danger ms-1 errMsg">비밀번호가 일치하지 않습니다.</span>
				</div>
				<div class="mb-3">
					<label for="userName" class="form-label ms-1">이름 <span class="text-danger">*</span></label> 
					<input type="text" class="form-control w-50 required" id="userName" name="userName">
					<span class="text-danger ms-1 errMsg">이름을 입력해주세요.</span>
				</div>
				<div class="mb-3">
					<label for="userSsn1" class="form-label ms-1">주민번호 <span class="text-danger">*</span></label> 
					<div class="d-flex">
						<input type="text" class="form-control me-1 w-25 required" id="userSsn1" maxlength="6" name="userSsn1">
						<span class="mt-2 ms-2 me-2"> - </span>
						<input type="text" class="form-control ms-1 w-25 required" id="userSsn2" maxlength="7" name="userSsn2">					
					</div>
					<span class="text-danger ms-1 errMsg">주민번호를 입력해주세요.</span>
				</div>
				<div class="mb-3">
					<label>이메일 <span class="text-danger">*</span></label>
					<input type="email" class="form-control me-1 w-75 required" id="userEmail" name="userEmail">				
				<span class="text-danger ms-1 errMsg">이메일을 입력해주세요.</span>
				</div>
				<div class="mb-3">
					<label>전화번호 <span class="text-danger">*</span></label>
					<div class="d-flex">
						<input type="text" class="form-control me-1 w-25 required" id="userPhone1" maxlength="3" name="userPhone1">
						<span class="mt-2 ms-2 me-2"> - </span>
						<input type="text" class="form-control ms-1 w-25 required" id="userPhone2" maxlength="4" name="userPhone2">
						<span class="mt-2 ms-2 me-2"> - </span>
						<input type="text" class="form-control ms-1 w-25 required" id="userPhone3" maxlength="4" name="userPhone3">					
					</div>					
				<span class="text-danger ms-1 errMsg">전화번호를 입력해주세요.</span>
				</div>
				<div class="mb-5">
					<label>주소 <span class="text-danger">*</span></label>
					<div class="d-flex justify-content-start mb-2">
						<input type="text" placeholder="우편번호" readonly onfocus="this.blur();" tabindex="-1" class="form-control w-50 me-2 required" id="zipcode" name="zipcode" style="background-color: #eee;">
						<button type="button" class="btn btn-outline-dark ms-2" id="addrBtn">주소검색</button>
					</div>	
					<div class="mb-2">
						<input type="text" class="form-control required" placeholder="기본주소" readonly onfocus="this.blur();" tabindex="-1" id="addr1" name="addr1"  style="background-color: #eee;"/>
					</div>
					<div class="mb-2">
						<input type="text" class="form-control required" placeholder="상세주소" id="addr2" name="addr2" />
					</div>
				<span class="text-danger ms-1 errMsg">주소를 입력해주세요.</span>
				</div>
				<div class="d-flex justify-content-center g-3 mt-4 ">
					<button type="button" class="btn btn-dark py-2 me-2 w-25 signUpBtn">회원가입</button>
					 <button type="reset" class="btn btn-outline-dark py-2 resetBtn">취소</button>
				</div>
			</form>
		</div>
	</section>
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>