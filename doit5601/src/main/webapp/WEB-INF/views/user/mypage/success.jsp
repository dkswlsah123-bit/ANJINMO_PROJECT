<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
	href="${pageContext.request.contextPath }/css/buyauction.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">


body
{	
	
}
h1,h2
{
	font-size: 20px !important;
	font-weight: bold !important;
}
h2{
	margin-bottom: 20px;
}
.body
{
	margin:50px auto 95px auto;
	width:760px;
	border: 2px; solid silver;
	border-radius: 7px;
	box-shadow: 0 0 3px rgba(0,0,0,0.4);
	padding: 30px;
	height:660px;
	
}
.body div
{
	display: inline-block;
}

.box
{
	width:100%;
	margin:auto;
	position: relative;

}
.itemimg
{
	vertical-align: middle;
	display: inline-block;
	width: 350px;
	height: 350px;
	background-color: silver;
	margin: 0 20px 0 0; 
}
.itemimg img
{
	width: 350px;
	height: 350px;
	object-fit: cover;
	object-position: center;
}

hr
{
	margin-bottom: 30px;
}
.item
{
	padding: 20px 30px 30px 30px;
	border: 1px solid F6F6F6;
	border-radius: 7px;
	width: 700px;
	height: 500px;	
	display: block;
	margin-bottom: 20px;
	box-shadow: 0 0 3px rgba(0,0,0,0.4);
}



.itemtext
{
	vertical-align: middle;	
	width: 250px;
	height: 350px;;
	display: flex;
	flex-direction: column;
}
.date
{
	font-size:24px;
	margin-top:auto;
	margin-bottom: 30px;
}

.title
{
	font-size: 30px;
	font-weight: bold;
	vertical-align: top;
}
.tt
{
	display:inline-block;
	width: 120px;
	font-weight: bold;
	vertical-align: bottom;
	font-size:15px;
	
	
}
.infoD
{
	margin-left:10px;
}
.infoD>span
{
	font-size:20px;
}

.condition
{
	color: silver;
	margin-top:10px;
	font-family: small;
	font-weight: bold;
}
a
{
	margin-top:auto;
	
}
.btn-dark
{
	width: 90%;
    height: 17%;
    margin-top:100px;
    margin-bottom:0px !important;
    margin-left:10px;
    font-weight: bold !important;
}
.infoD h2
{
 	padding:10px; 

}
</style>
</head>
<script type="text/javascript">

</script>
<body>

	<div class="body">
		<div class="box">
		<h1>결제완료</h1>
		<hr />
		<div class="infoD">
		<h2>${massage }</h2>
		</div>
			<div class="item">
				<h1>낙찰 결제 상품</h1>
				<hr />
				<div class="itemimg">
					<img src="${pageContext.request.contextPath }/images/${param.img }" alt="제품이미지" />
				</div>
				<div class="itemtext">
					<span class="title"> ${param.title } </span> <br /> <span class="condition">
						상태: ${grade } / 제조사: ${param.manudacturer} </span><br /> <br /> 
						<br /> <span class="tt">결제금액</span> <span style="font-weight:bold;">${param.price } 원</span><br />
						<span class="date"> <span
						class="tt">결제일</span> <span class="tt"><fmt:formatDate value="${today}" pattern="yyyy년MM월dd일" /></span>
					</span>
					<a href="${pageContext.request.contextPath }/user/products"><button type="button" class="btn btn-dark">확 인</button></a>
				</div>
				
			</div>
		</div> 
	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>