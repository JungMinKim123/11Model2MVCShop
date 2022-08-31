<%-- <%@page import="com.model2.mvc.service.domain.Product"%>--%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--<% Product vo = (Product)request.getAttribute("update"); --%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<style>
body {
	padding-top: 50px;
}
</style>
<script type="text/javascript">
	$(function() {
		$("form").attr("method", "POST");
	})

	$(function() {

		$("button").bind("click", function() {
			self.location = "/product/listProduct?menu=manage";
		});
	});
</script>
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />
	<form class="form-horizontal">
		<div class="container">
			<div class="page-header text-info">
				<h3>상품수정 완료</h3>
			</div>

			<div class="row">
				<div class="col-xs-4 col-md-2">
					<strong>상품번호</strong>
				</div>
				<div class="col-sm-4">${ update.prodNo }</div>
			</div>
			<hr />

			<div class="row">
				<div class="col-xs-4 col-md-2">
					<strong>상품명</strong>
				</div>
				<div class="col-sm-4">${ update.prodName }</div>
			</div>
			<hr />

			<div class="row">
				<div class="col-xs-4 col-md-2">
					<strong>상품상세정보</strong>
				</div>
				<div class="col-sm-4">${ update.prodDetail }</div>
			</div>
			<hr />

			<div class="row">
				<div class="col-xs-4 col-md-2">
					<strong>제조일자</strong>
				</div>
				<div class="col-sm-4">${ update.manuDate }</div>
			</div>
			<hr />

			<div class="row">
				<div class="col-xs-4 col-md-2">
					<strong>가격</strong>
				</div>
				<div class="col-sm-4">${ update.price }</div>
			</div>
			<hr />

			<div class="row">
				<div class="col-xs-4 col-md-2">
					<strong>분류</strong>
				</div>
				<div class="col-sm-4">${update.role }</div>
			</div>
			<hr />

			<div class="row">
				<div class="col-xs-4 col-md-2">
					<strong>상품이미지</strong>
				</div>
				<div class="col-sm-4">
					<c:forEach var="file" items="${ list }">
						<img src="/images/uploadFiles/${file}" />
					</c:forEach>
				</div>
			</div>
			<hr />

			<div class="row">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary">확 &nbsp;인</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>