<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link rel="stylesheet" href="css/common.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="https://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
	function subm() {
		let first = document.getElementById("checkIndeterminate");
		let second = document.getElementById("checkmoneyIndeterminate");
		let pass = document.getElementById("inputPassword");

		if (!first.checked) {
			alert("회원 탈퇴 약관을 읽고 동의해주세요.");
			first.focus();
			return;
		}
		if (!second.checked) {
			alert("회원 탈퇴 환불 약관을 읽고 동의해주세요.");
			second.focus();
			return;
		}
		if (pass.value == "") {
			alert("본인 확인을위해 비밀번호를 입력해주세요.");
			pass.focus();
			return;
		}
		
		if(pass.value != "${password}")
		{
			alert("비밀번호가 다릅니다.");
			pass.focus();
			return;
		}
		document.unregisterForm.submit();
	}
	function back() {
		history.back();
	}
</script>

<style type="text/css">
body
{
	background-color:#f7f7f7;
}
/* .body
{
	margin: auto;
	font-size: 16px;
	color: black;
	font-family: "맑은 고딕";
	width: 700px;
	margin-top: 50px;
	border-radius: 8px;
	height: auto;
} */
.body2
{
	margin: auto;
	width: 90%;
}

.big {
	font-weight: bold;
	font-size: 24px;
}

.top {
	margin-bottom: 30px;
}

.name {
	font-weight: bold;
}

.term {
	display: inline-block;
	font-weight: bold;
	font-size: 17px;
	margin-bottom: 5px;
}

.termcontent {
	border: 3px solid #f7f7f7;
	border-radius: 7px;
	height: auto;
	padding: 20px;
}

.form-check {
	margin-top: 25px;
	margin-bottom: 25px;
}
.form-check-label:hover
{
	font-weight: bold;
}
.moneycheck {
	margin-top: 30px;
	margin-bottom: 30px;
}

.last {
	font-size: 15px;
	margin-bottom: 5px;
}
body2 hr
{
	margin-top:30px;
}

.lm {
	width: 100px;
}

.lsm {
	display: inline-block;
	width: 100px;
}

.con {
	display: inline-block;
	margin-bottom: 20px;
}

.moneylist {
	width: 250px;
}

.ownercheck {
	margin: 100px 0 50px 0;
}

.lastbtn {
	margin: 100px 0 200px 0;
	
}
.btn-secondary
{
	height: 50px;
}

#inputPassword {
	width: 150px;
}
.col-md-9
{
	max-height: 75vh;
	overflow: scroll;
	overflow-x:hidden;
}
.p-4
{
	height: 1400px;
}
		.btn-primary {
	background-color: #120e63 !important;
	border-color: #120e63 !important;
}
</style>
</head>
<body class="bg-light">


	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div class="container" style="margin-top: 50px; margin-bottom: 50px;">
		<div class="row">

			<aside class="col-md-3">
				<%@ include file="/WEB-INF/views/common/mypage_layout.jsp"%>
			</aside>

			<section class="col-md-9">
				<div class="d-flex justify-content-center">
					<div class="shadow-sm col-md-12 card p-4 pb-5 border-0">

						<div class="card-header bg-white py-3 border-bottom text-dark">
							<h5 class="mb-0 fw-bold">회원 탈퇴</h5>
						</div>

						<div class="p-4 mt-2">
							<div class="top">
								<div>
									<span class="name">${name }</span>님 회원 탈퇴시 계정 복구 및 재사용이 불가합니다.
								</div>
							</div>

							<div class="body2">
								<div>
									<span class="term">탈퇴 약관</span>
									<div class="termcontent">
										<span class="con">탈퇴시 회원정보 및 서비스 이용 약관 상품등록 경매기록 등은
											보존됩니다</span> <br />
										<ul class="list-group list-group-flush">
											<li class="list-group-item">1.&nbsp;탈퇴시 회원정보는 한달 뒤
												삭제됩니다.</li>
											<li class="list-group-item">2.&nbsp;</li>
											<li class="list-group-item">3.&nbsp;</li>
										</ul>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="checkIndeterminate"> <label
											class="form-check-label" for="checkIndeterminate"> 회원
											탈퇴에 대한 약관을 확인 하였습니다 </label>
									</div>
								</div>
								<hr />
								<div class="moneycheck">
									<ul class="list-group moneylist">
										<li class="list-group-item">현재 소유 금액</li>
										<li class="list-group-item"><span class="lsm">머니</span><span
											class="lm"><fmt:formatNumber value="${money }"/></span>&nbsp;원</li>
									</ul>
								</div>

								<div>
									<span class="term">머니 환불 약관</span>
									<div class="termcontent">
										<span class="con">회원님의 충전된 금액은 환불이 불가합니다</span> <br />
										<ul class="list-group list-group-flush">
											<li class="list-group-item">1.&nbsp;</li>
											<li class="list-group-item">2.&nbsp;</li>
											<li class="list-group-item">3.&nbsp;</li>
										</ul>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="checkmoneyIndeterminate"> <label
											class="form-check-label" for="checkmoneyIndeterminate">
											회원 탈퇴 시 환불 규정에 대한 약관을 확인 하였습니다 </label>
									</div>
								</div>
								<hr />
								<form action="${pageContext.request.contextPath }/unregister/suc" method="post" name="unregisterForm">
									<div class="ownercheck">
										<span style="color: red">*</span>&nbsp;<span>본인 확인을 위해
											내용을 입력해주세요</span><br /> <br />
										<div class="mb-3 row">
											<label for="staticName" class="col-sm-2 col-form-label">이름</label>
											<div class="col-sm-10">
												<input type="text" readonly class="form-control-plaintext"
													id="staticName" value="${name }">
											</div>
										</div>
										<div class="mb-3 row">
											<label for="staticId" class="col-sm-2 col-form-label">ID</label>
											<div class="col-sm-10">
												<input type="text" readonly class="form-control-plaintext"
													id="staticId" value="${fn:substring(userId,0,fn:length(userId)-4) }****">
											</div>
										</div>
										<div class="mb-3 row">
											<label for="inputPassword" class="col-sm-2 col-form-label">PW</label>
											<div class="col-sm-10">
												<input type="password" class="form-control"
													id="inputPassword" name="password" required="required"
													placeholder="비밀번호 확인">
											</div>
										</div>
									</div>
									<div class="d-grid gap-2 col-6 mx-auto lastbtn">
										<span class="last text-center">위 내용을 모두 확인하고 회원을 탈퇴
											합니다.</span>
										<button class="btn btn-secondary" type="button"
											onclick="subm()">회원 탈퇴</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	</main>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>