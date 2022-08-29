<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>ȸ�� ��� ��ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

	// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
	   	$("form").attr("method", "POST").attr("action","/user/listUser").submit();		
	}
	
	$(function() {
		$("td.ct_btn01:contains('�˻�')").on("click", function() {
			//alert(  $( "td.ct_btn01:contains('�˻�')" ).html() );
			fncGetUserList(1);
		});
	
	$(".ct_list_pop td:nth-child(3)").on("click", function() {
		//alert(  $( this ).text().trim() );
		//console.log ($($(this).text().trim()).html());
		//self.location = "/user/getUser?userId="+$(this).text().trim();
		///*
		var userId = $(this).text().trim();
		$.getJSON("/user/json/getUser/"+userId,
				
				function (JSONData, status) {
					
					var displayValue = "<h3>"
											+"���̵� : "+JSONData.userId+"<br/>"
											+"��  �� : "+JSONData.userName+"<br/>"
											+"�̸��� : "+JSONData.email+"<br/>"
											+"ROLE : "+JSONData.role+"<br/>"
											+"����� : "+JSONData.rageDateString+"<br/>"
											+"</h3>";
					$("h3").remove();
					$("#"+userId).html(displayValue);
				}
			);
		
		$("#"+userId).dialog();
	//*/
	});
	$(".ct_list_pop td:nth-child(3)").css("color","red");
	$("h7").css("color","red");
	
	$(".ct_list_pop:nth-child(4n+6)").css("background-color", "whitsmoke");
	//console.log ($(".ct_list_pop:nth-child(1)").html());
	//console.log ($(".ct_list_pop:nth-child(2)").html());
	//console.log ($(".ct_list_pop:nth-child(3)").html());
	//console.log ($(".ct_list_pop:nth-child(4)").html());
	//console.log ($(".ct_list_pop:nth-child(5)").html());
	//console.log ($(".ct_list_pop:nth-child(6)").html());
	
	});
</script>

</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////// 
<form name="detailForm" action="/listUser.do" method="post">
////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<form name="detailForm">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37" />
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">ȸ�� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>ȸ��ID</option>
				<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>ȸ����</option>
			</select>
			<input type="text" name="searchKeyword" 
						value="${! empty search.searchKeyword ? search.searchKeyword : ""}"  
						class="ct_input_g" style="width:200px; height:20px" > 
		</td>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23"><img src="/images/ct_btnbg01.gif" width="17" height="23"></td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<!-- ////////////////// jQuery Event ó���� ����� /////////////////////////
						<a href="javascript:fncGetUserList('1');">�˻�</a>
						////////////////////////////////////////////////////////////////////////////////////////////////// -->
						�˻�
					</td>
					<td width="14" height="23"><img src="/images/ct_btnbg03.gif" width="14" height="23"></td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >
			��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
			<!-- ////////////////// jQuery Event ó���� ����� /////////////////////////
		<td class="ct_list_b" width="150">ȸ��ID</td>
		////////////////////////////////////////////////////////////////////////////////////////////////// -->
		<td class="ct_list_b" width="150">
			ȸ��ID<br>
			<h7>(id click:�󼼺���)</h7>
		</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�̸���</td>		
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	<c:set var="i" value="0" />
	<c:forEach var="user" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
			<td align="center">${ i }</td>
			<td></td>
			<td align="left">
				<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				<a href="/getUser.do?userId=${user.userId}">${user.userId}</a></td>
               	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
			
				<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			<a href="/user/getUser?userId=${user.userId}">${user.userId}</a></td>
               	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
				${user.userId}
			</td>
			<td></td>
			<td align="left">${user.userName}</td>
			<td></td>
			<td align="left">${user.email}</td>		
		</tr>
		<tr>
		<td id="${user.userId }" colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	</c:forEach>
</table>


<!-- PageNavigation Start... -->
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
	
			<jsp:include page="../common/pageNavigator.jsp"/>	
			
    	</td>
	</tr>
</table>
<!-- PageNavigation End... -->

</form>
</div>

</body>
</html>