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

			<!-- Tool Bar �� �پ��ϰ� ����ϸ�.... -->
			<ul class="nav navbar-nav">

				<!--  ȸ������ DrowDown -->
				<c:if test="${sessionScope.user.role == 'admin'}">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false"> <span>ȸ������</span>
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu">

							<li><a href="#">ȸ��������ȸ</a></li>

							<li class="divider"></li>
							<li><a href="#">etc...</a></li>
						</ul></li>
				</c:if>

				<!-- �ǸŻ�ǰ���� DrowDown  -->
				<c:if test="${sessionScope.user.role == 'admin'}">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false"> <span>�ǸŻ�ǰ����</span>
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="#">�ǸŻ�ǰ���</a></li>
							<li><a href="#">�ǸŻ�ǰ����</a></li>
							<li class="divider"></li>
							<li><a href="#">etc..</a></li>
						</ul></li>
				</c:if>

				<!-- ���Ű��� DrowDown -->
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false"> <span>ī�װ�</span>
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="#">��ü</a></li>
						<li><a href="#">������ǰ</a></li>
						<li><a href="#">������ǰ</a></li>
						<li><a href="#">��������ǰ</a></li>
						<li><a href="#">��/�Ĺ�/����</a></li>
						<li><a href="#">��ǰ/����/����</a></li>
						<li><a href="#">��Ÿ</a></li>
						<li><a href="#">�̺з�</a></li>

						<!-- <li><a href="#">�ֱٺ���ǰ</a></li> -->
						<li class="divider"></li>
						<li><a href="#">etc..</a></li>
					</ul></li>

				<li><a href="#">etc...</a></li>
			</ul>

			<c:if test="${! empty user }">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">����������</a></li>
					<li><a href="#">�α׾ƿ�</a></li>
				</ul>
			</c:if>

			<c:if test="${ empty user }">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">�α���</a></li>
					<li><a href="#">ȸ������</a></li>
				</ul>
			</c:if>
		</div>
		<!-- dropdown hover END -->

	</div>
</div>
<!-- ToolBar End /////////////////////////////////////-->



<script type="text/javascript">
	//============= logout Event  ó�� =============	
	$(function() {
		//==> �߰��Ⱥκ� : "addUser"  Event ����
		$("a[href='#' ]:contains('ȸ������')").on("click", function() {
			self.location = "/user/addUser"
		});
	});

	//============= �α��� ȭ���̵� =============
	$(function() {
		//==> �߰��Ⱥκ� : "addUser"  Event ����
		$("a[href='#' ]:contains('�α���')").on("click", function() {
			self.location = "/user/login"
		});
	});
	
	$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a:contains('�α׾ƿ�')").on("click", function() {
			$(self.location).attr("href", "/user/logout");
			//self.location = "/user/logout"
		});
	});

	//============= ȸ��������ȸ Event  ó�� =============	
	$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a:contains('ȸ��������ȸ')").on("click", function() {
			//$(self.location).attr("href","/user/logout");
			self.location = "/user/listUser"
		});
	});

	//=============  ����������ȸȸ Event  ó�� =============	
	$("a:contains('����������')").on(
			"click",
			function() {
				//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$(self.location).attr("href",
						"/user/getUser?userId=${sessionScope.user.userId}");
			});

	$("a:contains('�ǸŻ�ǰ���')").bind("click", function() {

		$(self.location).attr("href", "../product/addProductView.jsp");
	});

	$(function() {

		$($("a:contains('�ǸŻ�ǰ����')")[1]).bind("click", function() {
			self.location = "/product/listProduct?menu=manage"
		});
	});

	$(function() {
		$("a:contains('��ü')").bind("click", function() {
			console.log("��ü");
			self.location = "/product/listProduct?menu=search"
		});
	});
	
	$(function() {
		$("a:contains('������ǰ')").bind("click", function() {
			console.log("������ǰ");
			self.location = "/product/listProduct?menu=search&searchCondition=100&searchKeyword=������ǰ"
		});
	});
	
	$(function() {
		$("a:contains('������ǰ')").bind("click", function() {
			console.log("������ǰ");
			self.location = "/product/listProduct?menu=search&searchCondition=100&searchKeyword=������ǰ"
		});
	});
	
	$(function() {
		$("a:contains('��������ǰ')").bind("click", function() {
			console.log("��������ǰ");
			self.location = "/product/listProduct?menu=search&searchCondition=100&searchKeyword=��������ǰ"
		});
	});
	
	$(function() {
		$("a:contains('��/�Ĺ�/����')").bind("click", function() {
			console.log("��/�Ĺ�/����");
			self.location = "/product/listProduct?menu=search&searchCondition=100&searchKeyword=��/�Ĺ�/����"
		});
	});
	
	$(function() {
		$("a:contains('��ǰ/����/����')").bind("click", function() {
			console.log("��ǰ/����/����");
			self.location = "/product/listProduct?menu=search&searchCondition=100&searchKeyword=��ǰ/����/����"
		});
	});
	
	$(function() {
		$("a:contains('��Ÿ')").bind("click", function() {
			console.log("��Ÿ");
			self.location = "/product/listProduct?menu=search&searchCondition=100&searchKeyword=��Ÿ"
		});
	});
	
	$(function() {
		$("a:contains('�̺з�')").bind("click", function() {
			console.log("�̺з�");
			self.location = "/product/listProduct?menu=search&searchCondition=100&searchKeyword=�̺з�"
		});
	});
	
	$(function() {
		$("a:contains('�ֱٺ���ǰ')").bind("click", function() {
			self.location = "../history.jsp"
		});
	});
</script>
