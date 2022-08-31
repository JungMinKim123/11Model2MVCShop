<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- 
<%@page import="java.util.*"%>
<%@page import="com.model2.mvc.common.Page"%>
<%@page import="com.model2.mvc.service.domain.Product"%>
<%//@page import="com.model2.mvc.service.purchase.vo.PurchaseVO"%>
<%@page import="com.model2.mvc.common.Search"%>
<%@page import="com.model2.mvc.common.util.CommonUtil"%>

<%
	List<Product> list =(List<Product>)request.getAttribute("list");
	Search search=(Search)request.getAttribute("search");
	Page resultPage = (Page)request.getAttribute("resultPage");
	//Purchase pur = new Purchase();
	String menu = (String)request.getAttribute("menu");
	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
	
%>
--%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="EUC-KR">

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

img {
  width: 300px;
  height: auto;
  object-fit: cover;
}

</style>

<script type="text/javascript">

	function fncGetUserList(currentPage) {
		
		$("#currentPage").val(currentPage);
		$("form").attr("method", "post").attr("action", "/product/listProduct?menu=${menu}").submit();
		//$("form").attr("action", "/product/listProduct?menu=${menu}").submit();
	}
	
	$(function() {
		
		$("input[name='searchKeyword']").bind("keydown", function(key) {
			console.log($("input[name='searchKeyword']").val());
			if(key.keyCode==13){
			//console.log("asdf");
				$("form").attr("method", "post").attr("action", "/product/listProduct?menu=${menu}").submit();
			}
		}); 
		
		$("td.ct_btn01:contains('검색')").bind("click", function() {
			$("form").attr("method", "post").attr("action", "/product/listProduct?menu=${menu}").submit();
		});
		
		$("tbody td").bind("click", function() {
		//alert($("#${prod.prodNo}").val());
			if(${menu=='manage'}){
				
				self.location = "/product/updateProduct?prodNo="+$(this).parent().attr("id").trim()+"&menu=${ menu }";
				
			}
			if(${menu=='search'}){
				
				self.location = "/product/getProduct?prodNo="+$(this).parent().attr("id").trim()+"&menu=${ menu }";
				
				//console.log($(this).parent().attr("id").trim());
				/*
				var prodNo = $(this).parent().attr("id").trim();
				
				$.getJSON("/product/json/getProduct/"+prodNo,
						
						function(JSONData, status) {
					
							//console.log("updateProduct = ? : "+JSONData.prodDetail);
							
							var displayValue = "<h3 id='dialog' title='Basic dialog'>"
													+"상품번호 : "+JSONData.prodNo+"<br/>"
													+"상품명 : "+JSONData.prodName+"<br/>"
													//+"상품이미지 : "+JSONData.fileName+"<br/>"
													+"상품상세정보 : "+JSONData.prodDetail+"<br/>"
													+"제조일자 : "+JSONData.manuDate+"<br/>"
													+"가격 : "+JSONData.price+"<br/>"
													//+"등록일자 : "+JSONData.regDate+"<br/>"
													+"</h3>";
							$("h3").remove();
							
							//$("td[id='"+prodNo+"']").html(displayValue);
							//$("td[id='"+prodNo+"']").accordion();
							$($("td[id='"+prodNo+"']").html(displayValue)).dialog();
							//$(function () {
							//$( $("td[id='"+prodNo+"']").html(displayValue)).dialog({
							//	autoOpen: false,	
							//});
						//		$("h3[id='dialog']").dialog();
						
						//	});
					}
				);
				//*/
			}
			});
		
		$("input[name='respone']").bind("click", function() {
				//console.log('sadfsaf');
				self.location = "/purchase/updateTranCode?prodNo="+$(this).parent().parent().attr("id")+"&tranCode=2";
		});
	});
///*

	$(function() {
		
		$("input[name='searchKeyword']").bind("keyup", function() {
			
		    	//console.log($("input[name='searchKeyword']").val());
		    	
		    	var keyword =  $("input[name='searchKeyword']").val();
		    	
		    	$.getJSON("/product/json/getProdName/"+keyword,
		    			
		    		function(JSONData, status) {
						
		    			console.log("JSONData : "+JSONData);

		    			//var displayValue = JSONData;
						
		    			$("input[name='searchKeyword']").autocomplete({ source : JSONData});
		    	});
		});
	});
	//*/
</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />
	<div class="container">
		<c:if test="${ menu=='manage' }">
			<div class="page-header text-info">
				<h3>판매상품</h3>
			</div>
			<div class="col-md-12 text-right">
				<form class="form-inline" name="detailForm">
					<div class="form-group">
						<select class="form-control" name="searchCondition">
							<option value="1"
								${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "
							" }>상품명</option>
							<option value="100"
								${ ! empty search.searchCondition && search.searchCondition==100 ? "selected" : "
							" }>카테고리</option>
						</select>
					</div>
					<div class="form-group">
						<label class="sr-only" for="searchKeyword">검색어</label> <input
							type="text" class="form-control" id="searchKeyword"
							name="searchKeyword" placeholder="검색어"
							value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
					</div>
					<button type="button" class="btn btn-default">검색</button>
					<input type="hidden" id="currentPage" name="currentPage" value="1" />
				</form>
			</div>
			<br />
			<br />
			<br />

			<div class="row">
				<c:set var="i" value="0" />
				<c:forEach var="prod" items="${list}">
					<c:set var='i' value="${i+1}" />
					<div class="col-md-6 col-md-4" id="${prod.prodNo}">
						<div class="thumbnail">
							<img class="img-fluid" src="/images/uploadFiles/${prod.firstfileName}" />
							<div class="caption">
								<h3>${ prod.prodName }</h3>
								<p>가격 : ${ prod.price }</p>
								<p>
									<a href="#" class="btn btn-primary text-center" role="button">상품수정</a>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<jsp:include page="../common/pageNavigator_new.jsp" />
		</c:if>
	</div>

	<div class="container">
		<c:if test="${ menu=='search'}">

			<div class="page-header text-info">
				<h3>판매상품</h3>
			</div>
			<div class="row">
				<div class="col-md-12 text-right">
					<form class="form-inline" name="detailForm">
						<div class="form-group">
							<select class="form-control" name="searchCondition">
								<option value="1"
									${ !empty search.searchCondition && search.searchCondition == 1 ? "selected" : "" }>상품명</option>
								<option value="100"
									${ ! empty search.searchCondition && search.searchCondition==100 ? "selected" : "
							" }>카테고리</option>
							</select>
						</div>

						<div class="form-group">
							<label class="sr-only" for="searchKeyword">검색어</label> <input
								type="text" class="form-control" id="searchKeyword"
								name="searchKeyword" placeholder="검색어"
								value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
						</div>

						<button type="button" class="btn btn-default">검색</button>

						<input type="hidden" id="currentPage" name="currentPage" value="1" />
					</form>
				</div>
			</div>
			<br />
			<div class="row">

				<c:set var="i" value="0" />
				<c:forEach var="prod" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<div class="col-md-6 col-md-4" id="${prod.prodNo}">
						<div class="thumbnail">
							<img class="img-fluid" src="/images/uploadFiles/${prod.firstfileName}" />
							<div class="caption">
								<h3>${ prod.prodName } </h3>
								<p>가격 : ${ prod.price } </p>
								<br/>
								<p>
									<a href="#" class="btn btn-primary" role="button">상품보기</a> <a
										href="#" class="btn btn-default" role="button">담기</a>
								</p>
										<!-- 	
									<c:if test="${ !empty prod.proTranCode }">
										<c:if test="${ fn:trim(prod.proTranCode)==3 }">
											품절
									</c:if>
									</c:if>
										<c:if test="${ empty prod.proTranCode }">
										판매중
									</c:if>
									 -->
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<jsp:include page="../common/pageNavigator_new.jsp" />
		</c:if>
	</div>
</body>
</html>
