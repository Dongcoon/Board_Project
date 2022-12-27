<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kr.co.tj.model.vo.*"%>
<%@ taglib prefix="hc" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="letter" class="kr.co.tj.model.vo.LetterVO"
	scope="request" />
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

<title>쪽지함</title>
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
	overflow-x: hidden !important;
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

#btn-group>li+li::before {
	content: "";
	position: absolute;
	width: 1px;
	height: 12px;
	top: 8px;
	margin-left: 13px;
	border-radius: 0.5px;
	background: #bebbbb;
}

.keep_login::before {
	background-image:
		url(https://ssl.pstatic.net/static/nid/login/m_sp_01_login_008d5216.png);
	background-size: 266px 225px;
	content: '';
	position: absolute;
	top: 4px;
	left: 0;
	background-position: -244px -87px;
	background-repeat: no-repeat;
	width: 18px;
	height: 18px;
	background-color: #fff;
}

.keep_check input:checked+.keep_login::before {
	background-image: url(./img/login-box.png);
	background-size: 266px 225px;
	content: '';
	position: absolute;
	background-position: -244px -167px;
	background-repeat: no-repeat;
	top: 4px;
	left: 0;
	width: 18px;
	height: 18px;
	background-color: #fff;
}

input:hover {
	border: none;
}
</style>
<script type="text/javascript">
        $(function () {
            $('#btn-group > li > a:gt(0)').css('marginLeft', '30px');
        });
    </script>
</head>

<body class="bg03">
	<div class="container">
		<div class="row tm-mt-big">
			<div class="col-12 mx-auto tm-login-col">
				<div class="bg-white tm-block">
					<div class="row" style="margin-top: 15px;">
						<div class="col-12 text-center" style="font-size: 20px;">
							<span
								style="padding-bottom: 5px; border-bottom: 2px solid #999; display: inline-block; width: 100px;">
								쪽지함</span>
						</div>
					</div>
					<div class="row mt-2">
						<div class="col-12">
							<form action="/erp/loginForm.do" method="post" class="loginForm"
								name="loginForm" style="padding: 30px 30px 30px 30px;">
								<div class="input-group" style="display:block!important;">
									<div >
										<div style="margin-bottom: 5px !important;">
											<span style="margin-left: 20px; width: 60px !important;">보낸
												사람</span> <i class="fa-solid fa-user"
												style="position: absolute; top: 3px; left: 0px; opacity: .6;"></i>
											<input name="l_sender" type="text" class="l_sender"
												id="l_sender" value="${letter.l_sender}" readonly
												style="padding-left:5px!important; width: 200px; border: 1px solid #dadada; margin-left: 10px; opacity: .6; cursor: default;">
										</div>
										<div style="margin-bottom: 5px !important;">
											<span style="margin-left: 20px; width: 60px !important;">받은
												사람</span> <i class="fa-solid fa-user"
												style="position: absolute; top: 36px; left: 0px; opacity: .6;"></i>
											<input name="l_receiver" type="text" class="l_receiver"
												id="l_receiver" value="${letter.l_receiver}" readonly
												style="padding-left:5px!important; width: 200px; border: 1px solid #dadada; margin-left: 11px; opacity: .6; cursor: default;">
										</div>
										<div>
											<span
												style="margin-left: 28px; width: 60px !important; text-align: center;">
												<i class="fa-solid fa-pencil"
												style="position: absolute; top: 68px; left: 0px; opacity: .6;"></i>제&nbsp;&nbsp;&nbsp;목</span>
											<input name="l_title" type="text" class="l_title"
												id="l_title" value="${letter.l_title}" readonly
												style="padding-left:5px!important; margin-bottom: 5px !important; width: 200px; border: 1px solid #dadada; margin-left: 23px; opacity: .6; cursor: default;">
										</div>
									</div>
									<textarea name="" id="" cols="100" rows="5"
										style="margin-left: 0px !important; text-align: left !important; width: 100% !important;"
										readonly>${letter.l_content}
	                                    </textarea>
								</div>
								<button class="btn-primary" style="width: 100%; margin-top:10px!important;"
									onClick="self.close();">확인</button>
							</form>
							<div style="">
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>