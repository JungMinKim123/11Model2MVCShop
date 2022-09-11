<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--   jQuery , Bootstrap CDN  -->
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
<script type="text/javascript">
	function fncGetUserList(currentPage) {

		$("#currentPage").val(currentPage);

	}
	
	$(function() {
		$("a:contains('��ǰ����')").bind("click", function() {
			
			self.location = "/product/getProduct?prodNo="
				+ $(this).parent().parent().parent().parent()
				.parent().attr("id").trim();
		});
	});
	
	$(function() {
		$("a:contains('���')").bind("click", function() {
			
		});
	});
	
	$(function() {
		
				//alert("function ����");
		$.ajax( "/product/json/listProduct",
				{
					method : "POST",
					data : JSON.stringify({
						currentPage : fncGetUserList(),
						searchCondition : $("select[name='searchCondition']").val(),
						searchKeyword : $("#searchKeyword").val()
					}),
					
					dataType : "json",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData, status) {
					//	alert("function ����");
						for (var i = 0; i < JSONData.list.length; i++) {
							
							var prodName = JSONData.list[i].prodName;
							var firstFileName = JSONData.list[i].firstfileName;
							var price = JSONData.list[i].price;
							
							console.log(prodName);
							console.log(firstFileName);
							console.log(price);
							
							$($(".top")[i]).html("<img class="+"'img-fluid'"+
									"src='/images/uploadFiles/"+firstFileName+"'/>");
								$($(".prodName")[i]).html(prodName);
								$($(".price")[i]).text("���� : "+price);

								console.log($($(".top")[i]).html());
								console.log($($(".prodName")[i]).html());
								console.log($($(".price")[i]).text());
						}
					}
				}
				
				);
		
	});
	
</script>
<!--  CSS �߰� : ���ٿ� ȭ�� ������ ���� �ذ� :  �ּ�ó�� ��, �� Ȯ��-->
<style>
body {
	padding-top: 70px;
}

img.displayed {
	display: block;
	margin-left: auto;
	margin-right: auto
}

.img-fluid {
	width: 300px;
	height: auto;
	overflow: cover;
}

.caption>h3 {
	font-size: 1.4em;
}

(










"
.carousel ").carousel( {
	interval: 3000
}
)










;
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->


</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
	<div class="contains">
		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img class="img-responsive displayed"
						src="/images/�ϰ�����_��������.jpg/#777:#555/" alt="First slide">
				</div>
				<div class="item">
					<img class="img-responsive displayed"
						src="/images/�ϰ�����_�������.jpg/#777:#555/" alt="Second slide">
				</div>
				<div class="item">
					<img class="img-responsive displayed"
						src="/images/�ϰ�����_�̺�Ʈ����.jpg/#777:#555/" alt="Third slide">
				</div>
			</div>

			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<hr />

	<div class="contains">
		<div class="page-header text-info">
			<h3>�ǸŻ�ǰ</h3>
		</div>
		<div class="row">
			<div class="col-md-12 text-right">
				<form class="form-inline" name="detailForm">
					<div class="form-group">
						<select class="form-control" name="searchCondition">
							<option value="1"
								${ !empty search.searchCondition && search.searchCondition == 1 ? "selected" : "" }>��ǰ��</option>
							<option value="100"
								${ ! empty search.searchCondition && search.searchCondition==100 ? "selected" : "
							" }>ī�װ�</option>
						</select>
					</div>

					<div class="form-group">
						<label class="sr-only" for="searchKeyword">�˻���</label> <input
							type="text" class="form-control" id="searchKeyword"
							name="searchKeyword" placeholder="�˻���"
							value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
					</div>

					<button type="button" class="btn btn-default">�˻�</button>

					<input type="hidden" id="currentPage" name="currentPage" value="1" />
				</form>
			</div>
		</div>
		<br /> <input type="hidden" id="currentPage" name="currentPage"
			value="1" />
		<div class="row">
			<c:set var="i" value="0" />
			<c:forEach var="prod" items="${list}">
				<c:set var="i" value="${ i+1 }" />
				<div class="col-md-6 col-md-4" id="${prod.prodNo}">
					<div class="thumbnail">
						<div class="top" style="width: 50%; height: 300px;">
						</div>
						<div class="bottom" style="width: 50%">
							<div class="caption">
								<h3 class="prodName"></h3>
								<p class="price"></p>
								<br />
								<p>
									<a href="#" class="btn btn-primary" role="button">��ǰ����</a> <a
										href="#" class="btn btn-default" role="button">���</a>
								</p>
								<!-- 	
									<c:if test="${ !empty prod.proTranCode }">
										<c:if test="${ fn:trim(prod.proTranCode)==3 }">
											ǰ��
									</c:if>
									</c:if>
										<c:if test="${ empty prod.proTranCode }">
										�Ǹ���
									</c:if>
									 -->
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<jsp:include page="/common/pageNavigator_new.jsp"/>
	</div>
</body>

</html>