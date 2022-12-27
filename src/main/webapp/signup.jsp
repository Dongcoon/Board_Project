<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--아이콘-->
<script src="https://kit.fontawesome.com/3d5c8b13e4.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="shortcut icon" href="./img/2team.png" type="image/x-icon">
<!-- 구글 웹폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script type="text/javascript" href="./js/popup.js"></script>
<title>회원 가입</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Noto Sans KR', sans-serif;
	letter-spacing: .5px;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

a {
	list-style: none;
	text-decoration: none;
	color: #777;
}

li {
	list-style: none;
	display: inline-block;
}

input {
	font-size: 14px;
}

.input_box {
	padding: 5px 5px 5px 10px;
	width: 100%;
}

.join_row {
	width: 100%;
	margin-bottom: 20px;
}

.email_position {
	margin-bottom: 20px;
}

.per_info {
	margin-bottom: 20px;
}

.btn-light:hover {
	background-color: #b61028;
	color: #fff !important;
}

input {
	border: 1px solid #dadada;
	opacity: .8;
}

.btn-primary {
	/* background-color: #59585d94 !important;
            border: 1px solid #59585d94 !important; */
	
}

.btn-primary:hover {
	/* background-color: #59585d !important;
            border: 1px solid #59585d !important; */
	
}
</style>
<script>
    function selfCloseSubmit(){
		var f= document.forms.signupForm;
		opener.name = "parentPage";
	 	f.target = opener.name;
	 	f.submit();
	 	self.close();
	}
        $(document).ready(function () {
            $("#email_addr").on("change", function () {
                var $selected = $(this).val();
                if ($selected == "직접 입력") {
                    $("#email").prop("disabled", false);
                    $("#email").val("");
                } else {
                    $("#email").val($selected);
                    $("#email").prop("disabled", true);
                }

            })
        });
    </script>
</head>
<body id="" class="">
	<div class="container" id="home">
		<div class="container" style="width: 450px !important;">
			<div class="row tm-mt-big">
				<div class="col-12 mx-auto tm-login-col">
					<div class="bg-white tm-block">
						<div class="row" style="margin: 15px 0;">
							<div class="col-12 text-center">
								<img alt="logo" src="./img/logo1.png"
									onclick="location.replace('/erp/loginForm.do')" class="logo">
							</div>
							<div class="table-responsive col-12" style="">
								<form action="userSignupAction.do" name="signupForm" style="">
									<div class="join_row">
										<h6>아이디</h6>
										<input type="text" class="uid input_box" name="u_id" size=15 required
											onchange="changeid();" placeholder="4~15자 이내로 입력해주세요" style="width: 60%;">
										<input type="hidden" name="chkid" value="0">
										<button type="button" class="btn btn-small btn-primary"
											name="uid_cheak" size=15 onclick="checkid();"
											style="float: right; font-size: 14px; margin-top: 0px; margin-right: 10px;">아이디
											중복 확인</button>
									</div>
									<div class="join_row" style="clear: both;">
										<h6>비밀번호</h6>
										<input type="password" class="pwd input_box" name="u_pw" required
											onkeyup="chkpwd();" size=15 placeholder="영문, 숫자 조합"
											style="width: 100%; margin-bottom: 20px;">
										<h6>비밀번호 재확인</h6>
										<input type="password" class="pwd_chk input_box"
											name="pwd_chk" onkeyup="chkpwd();" size=15 required
											placeholder="비밀번호 재확인" style="width: 100%; margin-top: 0px;">
									</div>
									<input type="hidden" name="pwdchk" value="0">
									<div class="divpwd"></div>
									<div class=email_position style="">
										<div class=email_position1>
											<h6>이메일</h6>
											<input type="text" class="email_fr input_box" id="email" name="u_email1" size=15 required
                                                placeholder="java@script.kr" style="width:100%;">
										</div>
										<div class=email_mark></div>
									</div>
									<input type="hidden" class="email" name="email">
									<div class="per_info">
										<h6>이름</h6>
										<input type="text" class="name input_box" name="u_name" required
											size=15 placeholder="홍길동">
									</div>
									<div class="per_info">
										<h6>닉네임</h6>
										<input type="text" class="nickname input_box" required
											name="u_nickname" size=15 placeholder="15자 이내로 입력해주세요.">
									</div>
									<div class="per_info">
										<div class="jumin1">
											<h6>주민번호</h6>
											<input type="text" class="jumin_num1 input_box"
												name="u_jumin1" maxlength=6 size=10 placeholder="주민번호 앞 6자리" required
												style="width: 45%; float: left;"> 
												<span style="position: absolute; font-size: 25px; margin-left: 15px;">-</span>
										</div>
										<div class="jumin2"></div>
										<div class="jumin3" style="margin-bottom: 10px;">
											<input type="password" class="jumin_num2 input_box" required
												name="u_jumin2" maxlength=7 size=10 placeholder="주민번호 뒷 7자리"
												style="width: 45%; float: right;">
										</div>
										<input type="hidden" class="jumin_num" name="u_jumin2">
									</div>
									<div class="confirm_box"
										style="margin-top: 20px; float: right;">
										<button type="button" class="btn btn-small btn-light"
											style="margin-right: 10px;" onClick="self.close()">취소</button>
										<button type="submit" class="btn btn-small btn-primary"
											onclick="selfCloseSubmit()">가입하기</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$('.input_id').focusout(function(){
			let userId = $('.input_id').val(); // input_id에 입력되는 값
			
			console.log(userId);
			
			$.ajax({
				url : "idCheckAction.do", //던질 URL
				type : "post", // 방식
				data : {userId: userId}, //던지는 파라미터
				dataType : 'json',
				success : function(result){ // 성공시 result에 값이 들어옵니다.
					if(result == 0){
						$("#checkId").html('사용할 수 없는 아이디입니다.');
						$("#checkId").attr('color','red');
					} else{
						$("#checkId").html('사용할 수 있는 아이디입니다.');
						$("#checkId").attr('color','green');
					} 
				},
				error : function(){
					alert("서버요청실패");
				}
			});
		});
	
		$('.pw').keyup(function(){
			
			let pass1 = $("#pwd_lbl").val(); // input_id에 입력되는 값
			let pass2 = $("#pwd2_lbl").val(); // input_id에 입력되는 값
		
			if(pass1 != "" || pass2 != ""){
				if(pass1==pass2){
					$("#checkPw").html('비밀번호가 일치합니다.');
					$("#checkPw").attr('color','green');
				}else{
					$("#checkPw").html('비밀번호가 일치하지 않습니다.');
					$("#checkPw").attr('color','red');
				}
			}
				
		})
    </script>
</body>

</html>