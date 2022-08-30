<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar  navbar-inverse navbar-fixed-top">

	<div class="container">

		<a class="navbar-brand" href="/index.jsp">Model2
			MVC Shop</a>

		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
			<button class="navbar-toggle collapsed" data-toggle="collapse"
				data-target="#target">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<!-- toolBar Button End //////////////////////// -->

		<!--  dropdown hover Start -->
		<div class="collapse navbar-collapse" id="target"
			data-hover="dropdown"
			data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">

			<!-- Tool Bar 를 다양하게 사용하면.... -->
			<ul class="nav navbar-nav">

				<!--  회원관리 DrowDown -->
				<c:if test="${sessionScope.user.role == 'admin'}">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false"> <span>회원관리</span>
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu">

							<li><a href="#">회원정보조회</a></li>

							<li class="divider"></li>
							<li><a href="#">etc...</a></li>
						</ul></li>
				</c:if>

				<!-- 판매상품관리 DrowDown  -->
				<c:if test="${sessionScope.user.role == 'admin'}">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false"> <span>판매상품관리</span>
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="#">판매상품등록</a></li>
							<li><a href="#">판매상품관리</a></li>
							<li class="divider"></li>
							<li><a href="#">etc..</a></li>
						</ul></li>
				</c:if>

				<!-- 구매관리 DrowDown -->
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false"> <span>카테고리</span>
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="#">전체</a></li>
						<li><a href="#">전자제품</a></li>
						<li><a href="#">가전제품</a></li>
						<li><a href="#">스포츠용품</a></li>
						<li><a href="#">꽃/식물/정원</a></li>
						<li><a href="#">식품/과자/음료</a></li>
						<li><a href="#">기타</a></li>
						<li><a href="#">미분류</a></li>

						<!-- <li><a href="#">최근본상품</a></li> -->
						<li class="divider"></li>
						<li><a href="#">etc..</a></li>
					</ul></li>

				<li><a href="#">etc...</a></li>
			</ul>

			<c:if test="${! empty user }">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">내정보관리</a></li>
					<li><a href="#">로그아웃</a></li>
				</ul>
			</c:if>

			<c:if test="${ empty user }">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">로그인</a></li>
					<li><a href="#">회원가입</a></li>
				</ul>
			</c:if>
		</div>
		<!-- dropdown hover END -->

	</div>
</div>
<!-- ToolBar End /////////////////////////////////////-->



<script type="text/javascript">
	//============= logout Event  처리 =============	
	$(function() {
		//==> 추가된부분 : "addUser"  Event 연결
		$("a[href='#' ]:contains('회원가입')").on("click", function() {
			self.location = "/user/addUser"
		});
	});

	//============= 로그인 화면이동 =============
	$(function() {
		//==> 추가된부분 : "addUser"  Event 연결
		$("a[href='#' ]:contains('로그인')").on("click", function() {
			self.location = "/user/login"
		});
	});
	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a:contains('로그아웃')").on("click", function() {
			$(self.location).attr("href", "/user/logout");
			//self.location = "/user/logout"
		});
	});

	//============= 회원정보조회 Event  처리 =============	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a:contains('회원정보조회')").on("click", function() {
			//$(self.location).attr("href","/user/logout");
			self.location = "/user/listUser"
		});
	});

	//=============  개인정보조회회 Event  처리 =============	
	$("a:contains('내정보관리')").on(
			"click",
			function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$(self.location).attr("href",
						"/user/getUser?userId=${sessionScope.user.userId}");
			});

	$("a:contains('판매상품등록')").bind("click", function() {

		$(self.location).attr("href", "../product/addProductView.jsp");
	});

	$(function() {

		$($("a:contains('판매상품관리')")[1]).bind("click", function() {
			self.location = "/product/listProduct?menu=manage"
		});
	});

	$(function() {
		$("a:contains('전체')").bind("click", function() {
			console.log("전체");
			self.location = "/product/listProduct?menu=search"
		});
	});
	
	$(function() {
		$("a:contains('전자제품')").bind("click", function() {
			console.log("전자제품");
			self.location = "/product/listProduct?menu=search&searchCondition=100&searchKeyword=전자제품"
		});
	});
	
	$(function() {
		$("a:contains('가전제품')").bind("click", function() {
			console.log("가전제품");
			self.location = "/product/listProduct?menu=search&searchCondition=100&searchKeyword=가전제품"
		});
	});
	
	$(function() {
		$("a:contains('스포츠용품')").bind("click", function() {
			console.log("스포츠용품");
			self.location = "/product/listProduct?menu=search&searchCondition=100&searchKeyword=스포츠용품"
		});
	});
	
	$(function() {
		$("a:contains('꽃/식물/정원')").bind("click", function() {
			console.log("꽃/식물/정원");
			self.location = "/product/listProduct?menu=search&searchCondition=100&searchKeyword=꽃/식물/정원"
		});
	});
	
	$(function() {
		$("a:contains('식품/과자/음료')").bind("click", function() {
			console.log("식품/과자/음료");
			self.location = "/product/listProduct?menu=search&searchCondition=100&searchKeyword=식품/과자/음료"
		});
	});
	
	$(function() {
		$("a:contains('기타')").bind("click", function() {
			console.log("기타");
			self.location = "/product/listProduct?menu=search&searchCondition=100&searchKeyword=기타"
		});
	});
	
	$(function() {
		$("a:contains('미분류')").bind("click", function() {
			console.log("미분류");
			self.location = "/product/listProduct?menu=search&searchCondition=100&searchKeyword=미분류"
		});
	});
	
	$(function() {
		$("a:contains('최근본상품')").bind("click", function() {
			self.location = "../history.jsp"
		});
	});
</script>
