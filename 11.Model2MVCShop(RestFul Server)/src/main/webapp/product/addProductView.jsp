<%@ page contentType="text/html; charset=euc-kr"%>

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
	function fncAddProduct() {
		//Form 유효성 검증
		var name = $("input[name='prodName']").val();
		var detail = $("#prodDetail").val();
		var manuDate = $("input[name='manuDate']").val();
		var price = $("input[name='price']").val();
		var fileName = $("input[name='fileUploadName']");

		if (name == null || name.length < 1) {
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}
		if (detail == null || detail.length < 1) {
			alert("상품상세정보는 반드시 입력하여야 합니다.");
			return;
		}
		if (manuDate == null || manuDate.length < 1) {
			alert("제조일자는 반드시 입력하셔야 합니다.");
			return;
		}
		if (price == null || price.length < 1) {
			alert("가격은 반드시 입력하셔야 합니다.");
			return;
		}
		if (fileName[0].files.length > 4) {
			alert("파일첨부는 3개까지 입니다.");
			return;
		}

		//document.detailForm.action='/product/addProduct';
		//document.detailForm.submit();

		$("form").attr("method", "POST").attr("action", "/product/addProduct")
				.attr("enctype", "multipart/form-data").submit();

	}

	$(function() {

		$($("button")[1]).on("click", function() {
			alert("등록");
			alert($("#prodDetail").val());
			fncAddProduct();
		});

	});
	//function resetData(){
	//document.detailForm.reset();
	$(function() {

		$($("button")[2]).on("click", function() {
			alert("취소");
			$("form")[0].reset();
		});
	});
</script>
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />
	<form class="form-horizontal">
		<div class="container">
			<input type="hidden" name="prodNo" value="${ UpdateProdVO.prodNo }" />
			<div class="page-header text-info">
				<h3>상품등록</h3>
			</div>

			<div class="row">
				<div class="col-xs-4 col-md-2">
					<strong>상품명</strong>
				</div>
				<div class="col-sm-4">
					<input class="form-control" id="prodName" name="prodName" value="" />
				</div>
			</div>
			<hr />

			<div class="row">
				<div class="col-xs-4 col-md-2">
					<strong>상품상세정보</strong>
				</div>
				<div class="col-sm-4">
					<textarea class="form-control" rows="3" id="prodDetail"
						name="prodDetail"></textarea>
				</div>
			</div>
			<hr />

			<div class="row">
				<div class="col-xs-4 col-md-2">
					<strong>제조일자</strong>
				</div>
				<div class="col-sm-4">
					<input class="form-control" id="manuDate" readonly="readonly"
						name="manuDate" value="" />
				</div>
			</div>
			<hr />

			<div class="row">
				<div class="col-xs-4 col-md-2">
					<strong>가격</strong>
				</div>
				<div class="col-sm-4">
					<input class="form-control" id="price" name="price" value="" />
				</div>
			</div>
			<hr />

			<div class="row">
				<div class="col-xs-4 col-md-2">
					<strong>상품이미지</strong>
				</div>
				<div class="col-sm-4">
					<input multiple="multiple" type="file"
						name="fileUploadName" value="/images/uploadFiles/.." />
				</div>
			</div>
			<hr />

			<div class="row">
				<div class="col-xs-4 col-md-2">
					<strong>분류</strong>
				</div>
				<div class="col-sm-4">
					<select class="form-control" name="role">
						<option>전자제품</option>
						<option>가전제품</option>
						<option>스포츠용품</option>
						<option>꽃/식물/정원</option>
						<option>식품/과자/음료</option>
						<option>기타</option>
						<option>미분류</option>
					</select>
				</div>
			</div>
			<hr />

			<div class="row">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary">등 &nbsp;록</button>
					<button type="button" class="btn btn-primary">취 &nbsp;소</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
