<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
    	 body >  div.container{ 
        	border: 0;
        	outline: 0;
            margin-top: 10px;
        }
        
        .button{
      		border: 0;
        	outline: 0;
        }
        
    </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	 window.Kakao.init('59386325ca13cdc634dfe162b470c978');
		
	 function kakaoLogin() {
         window.Kakao.Auth.login({
             scope: 'profile_nickname, account_email, gender, age_range, birthday', //�����׸� �������� �ִ� �������� ��ȣ ���̺��� Ȱ��ȭ�� ID���� �ֽ��ϴ�.
             success: function(response) {
                 console.log(response) // �α��� �����ϸ� �޾ƿ��� ������
                 window.Kakao.API.request({ // ����� ���� �������� 
                     url: '/v2/user/me',
                     success: (res) => {
                         const kakao_account = res.kakao_account;
                         console.log(kakao_account)
                         console.log(kakao_account.profile.nickname)
                         var name = kakao_account.profile.nickname;
                         $(".kakao").val(name);
                         sessionStorage.setItem("user",kakao_account.profile.nickname);
                         
                         console.log(sessionStorage.getItem("user"));
                         console.log($(".kakao").val());
                     }
                 });
                 // window.location.href='/ex/kakao_login.html' //�����̷�Ʈ �Ǵ� �ڵ�
             },
             fail: function(error) {
                 console.log(error);
             }
         });
         
         $("form").attr("method","POST").attr("action","/user/snsLogin").attr("target","_parent").submit();
     }
	 	
	 var clientId = "Ml9RKhaCexgFbiAJLp0cID"
		    var callbackUrl = "http://192.168.0.183:8080/"
		    
		    ...
		    
			var naverLogin = new naver.LoginWithNaverId({
				 clientId: clientId,
				 callbackUrl: callbackUrl,
				 isPopup: true,
				 loginButton: {color: "green", type: 3, height: 50}		 
			});
	 
	 function naverLogin() {
			alert("safd");
			var naver_id_login = new naver_id_login("Ml9RKhaCexgFbiAJLp0c", "http://192.168.0.183:8080/");
		  	var state = naver_id_login.getUniqState();
		  	naver_id_login.setButton("white", 2,40);
		  	naver_id_login.setDomain("http://192.168.0.183:8080/");
		  	naver_id_login.setState(state);
		  	naver_id_login.setPopup();
		  	naver_id_login.init_naver_id_login();
		});
	});
	  
	  	
	 //============= "�α���"  Event ���� =============
		$( function() {
			
			$("#userId").focus();
			
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button").on("click" , function() {
				var id=$("input:text").val();
				var pw=$("input:password").val();
				
				if(id == null || id.length <1) {
					alert('ID �� �Է����� �����̽��ϴ�.');
					$("#userId").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('�н����带 �Է����� �����̽��ϴ�.');
					$("#password").focus();
					return;
				}
				
				$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
			});
		});	
		
		
		//============= ȸ��������ȭ���̵� =============
		$( function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
	</script>		
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/main.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->	
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		<!--  row Start /////////////////////////////////////-->
		<div class="row">
		
			<div class="col-md-6">
					<img src="/images/logo-spring.png" class="img-rounded" width="100%" />
			</div>
	   	 	
	 	 	<div class="col-md-6">
	 	 	
		 	 	<br/><br/>
				
				<div class="jumbotron">	 	 	
		 	 		<h1 class="text-center">�� &nbsp;&nbsp;�� &nbsp;&nbsp;��</h1>

			        <form class="form-horizontal">
		  
					  <div class="form-group">
					    <label for="userId" class="col-sm-4 control-label">�� �� ��</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" name="userId" id="userId"  placeholder="���̵�" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="password" class="col-sm-4 control-label">�� �� �� ��</label>
					    <div class="col-sm-6">
					      <input type="password" class="form-control" name="password" id="password" placeholder="�н�����" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-6 text-center">
					      <button type="button" class="btn btn-primary"  >�� &nbsp;�� &nbsp;��</button>
					      <a class="btn btn-primary btn" href="#" role="button">ȸ &nbsp;�� &nbsp;�� &nbsp;��</a>
					    </div>
					  </div>

					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-6 text-center">
					       <a href="javascript:kakaoLogin();"><img src="/images/ko/kakao_login_medium_narrow.png" alt="īī������ �α���"/></a>
					       <input type="hidden" class="kakao" name="userName" id="userName" value="" >
					    </div>
					  </div>

					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-6 text-center">
					    <div id="naver_id_login">
						   <a id="naverIdLogin_loginButton" href="javascript:naverLogin();">
							<img src="https://static.nid.naver.com/oauth/big_g.PNG?version=js-2.0.1" height="50"></a>
							</div>
					    </div>
					  </div>
		
					</form>
			   	 </div>
			
			</div>
			
  	 	</div>
  	 	<!--  row Start /////////////////////////////////////-->
  	 	
 	</div>
 	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

</html>