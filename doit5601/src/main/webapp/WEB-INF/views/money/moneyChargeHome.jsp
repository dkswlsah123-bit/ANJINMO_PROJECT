<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/charge.css">
<style type="text/css">

body
{
	margin:50px;
	
}
h1
{
	font-size: 25px;
	font-weight: bold;
	text-align: left;
}
.body
{
	margin:auto;
	width: 500px;
	padding: 20px;
	text-align: center;
	margin-bottom: 200px;
	margin-top: 50px;
	border: 1px solid silver;
	border-radius: 7px;
}
.choice
{
	width: 50%;
	margin: 40px 0 60px 0;
	margin-left: auto;
	margin-right: auto;
}
.gg
{
	width: 250px;
	display:flex !important;
}
.btn-group
{
	margin: 5px 0 5px 0;
}
.form-floating
{
	width: 70%;
	margin-left: auto;
	margin-right: auto;
}

.btn-outline-dark
{
	
	width: 200px;
	height: 45px;
	text-align: center;
}
.btn-group
{

	display: block;
}
.btn-outline-secondary
{
	width: 130px;
}

.addmoney
{
	margin: 30px 0 60px 0;
}
.kk{
	display:none !important;
}
.errMsg
{
	margin-top:10px;
	display:block;
}
		.btn-primary {
	background-color: #120e63 !important;
	border-color: #120e63 !important;
}
</style>
</head>
<script type="text/javascript" src="https://stdpay.inicis.com/stdjs/INIStdPay.js"></script>
<script type="text/javascript">
	
	document.addEventListener("DOMContentLoaded",function(){
		document.getElementById("floatingTextarea").addEventListener('input',function(){
			this.value = this.value.replace(/[^0-9]/g,"");
			document.getElementById("adressErr").classList.add("kk");
			if(document.getElementById("floatingTextarea").value > 20000000)
			{
				alert("입력한도를 초과하였습니다");
				this.value = this.value.slice(0,-1);
				document.getElementById("adressErr").classList.remove("kk");
			}
		});
	});
	

	function check(money)
	{
		//alert(money);
		let moneybox = document.getElementById("floatingTextarea");
		
		document.getElementById("adressErr").classList.add("kk");
		
		if(moneybox.value == null || moneybox.value == "")
		{
			moneybox.value = 0;
		}
		
		moneybox.value = parseInt(moneybox.value) + parseInt(money);
		
		if(moneybox.value > 20000000)
		{
			alert("입력한도를 초과하였습니다");
			moneybox.value = parseInt(moneybox.value) - parseInt(money);
			document.getElementById("adressErr").classList.remove("kk");
		}
	}
	
	function trancheck()
	{
		let moneybox = document.getElementById("floatingTextarea");
		let labelbox = document.getElementById("boxlabel");
		
		labelbox.style.color="black";
		
		if(moneybox.value == null || moneybox.value == "")
		{
			labelbox.style.color="red";
			return;
		}
		
		if(moneybox)
		document.moneyForm.submit();
	}
	
	function card()
	{
		INIStdPay.pay("moneyForm");
	}
</script>
<body class="bg-light">
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="body shadow-sm" style="background-color: #fff;">
		<h1>충전하기</h1>
		<hr />
		
		<form action="${pageContext.request.contextPath }/payment/charge" name="moneyForm" id="moneyForm" method="post">
		
		<button type="button" onclick="INIStdPay.pay('moneyForm')"">이니시스</button>
	
    
		  <input type="hidden" name="version" value="1.0" />
    <input type="hidden" name="gopaymethod" value="Card" />
    <input type="hidden" name="mid" value="INIpayTest" />
    <input type="hidden" name="oid" value="DemoTest_1780101953217" />
    <input type="hidden" name="price" value="1000" />
    
    <input type="hidden" name="timestamp" value="1780101953217" />
    
    <input type="hidden" name="use_chkfake" value="Y" />
    
    <input type="hidden" name="signature" value="cc8b53298818817da379103e33e461ccf365d9fcdd92be620958db820422aa98" />
    <input type="hidden" name="mKey" value="3a950306919241e5040e9740ee4ea7d9d70bc081a26a032c3434d482cc364e46" />
    
    <input type="hidden" name="currency" value="WON" />
    <input type="hidden" name="goodname" value="테스트상품" />
    <input type="hidden" name="buyername" value="테스터" />
    <input type="hidden" name="buyertel" value="01012345678" />
    <input type="hidden" name="buyeremail" value="test@test.com" />
    
    <input type="hidden" name="acceptmethod" value="HPP(1):below1000:va_receipt:centerCd(Y)" />
    
    <input type="hidden" name="returnUrl" value="http://localhost:8080${pageContext.request.contextPath}/payment" />
		<div class="choice">
			<div class="btn-group gg" role="group"
				aria-label="Basic radio toggle button group">
				<input type="radio" class="btn-check" name="btnradio" id="btnradio1"
					autocomplete="off" value="1" checked> <label
					class="btn btn-outline-secondary" for="btnradio1">무통장입금</label> <input
					type="radio" class="btn-check" name="btnradio" id="btnradio2"
					autocomplete="off" value="2" onclick="card()"> <label
					class="btn btn-outline-secondary" for="btnradio2">신용카드</label>
			</div>
		</div>
		
		<div class="form-floating">
			<input class="form-control" placeholder="충전 금액"
				id="floatingTextarea" name="chargeMoney" value="" ></input> <label id="boxlabel" for="floatingTextarea">
				충전할 금액을 입력해주세요</label>
				<span class="text-danger ms-1 errMsg kk" id="adressErr">한번에 2천만 원 이상 충전할 수 없습니다.</span>
		</div>
		<div class="addmoney">
			<div class="btn-group" role="group"
				aria-label="Basic outlined example">
				<button type="button" class="btn btn-outline-secondary" value="1000" onclick="check(this.value)">+
					1,000원</button>
				<button type="button" class="btn btn-outline-secondary" value="5000" onclick="check(this.value)">+
					5,000원</button>
				<button type="button" class="btn btn-outline-secondary" value="10000" onclick="check(this.value)">+
					10,000원</button>
			</div>
			<div class="btn-group" role="group"
				aria-label="Basic outlined example">

				<button type="button" class="btn btn-outline-secondary" value="50000" onclick="check(this.value)">+
					50,000원</button>
				<button type="button" class="btn btn-outline-secondary" value="100000" onclick="check(this.value)">+
					100,000원</button>
				<button type="button" class="btn btn-outline-secondary" value="1000000" onclick="check(this.value)">+
					1,000,000원</button>
			</div>
		</div>
		<button type="button" class="btn btn-outline-dark" onclick="trancheck()">충전 하기</button>
		</form>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>