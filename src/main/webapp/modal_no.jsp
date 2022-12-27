<%@page import="kr.co.tj.model.vo.BoardVO"%>
<%@page import="kr.co.tj.model.dao.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="우리 팀에 딱 맞는 구장을 찾아 편하게 예약해보세요!">
    <meta name="keywords" content="실내풋살장, 풋살장대여, 풋살장, 풋살장예약, 풋살경기장">
    <meta property="og:type" content="website">
    <meta property="og:title" content="풋살장 예약 - 아이엠그라운드">
    <meta property="og:description" content="우리 팀에 딱 맞는 구장을 찾아 편하게 예약해보세요!">
    <meta property="og:image" content="https://www.iamground.kr/img/logos/logo_new.png">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!--아이콘-->
    <script src="https://kit.fontawesome.com/3d5c8b13e4.js" crossorigin="anonymous"></script>
    <title>2조 자바 팀 프로젝트</title>
    <link rel="shortcut icon" href="./img/2team.png" type="image/x-icon">
    <!-- 구글 웹폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/search.min.css">
    <link rel="stylesheet" href="./css/lib.min.css">
    <link rel="stylesheet" href="./css/resv.min.css">
    <link rel="stylesheet" href="./js/style.js">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./js/resv.min.js">

    <script type="text/javascript" href="./js/popup.js"></script>
    <script type="text/javascript">
        $(function () {
            $('.depth1 > li').hover(
                function () {
                    $(this)
                        .find('.depth2')
                        .stop().slideDown(300);
                },
                function () {
                    $(this)
                        .find('.depth2')
                        .stop().slideUp(300);
                });
        });
        function chat_popup() {

            var width = 350;
            var height = 700;

            var top = 0;
            var left = Math.ceil(window.screen.width);

            var windowStatus = 'width=' + width + ', height=' + height + ', top=' + top + ',left=' + left + ',location = no, scrollbars=no, status=no, resizable=no, titlebar=no';

            const url1 = "./chatting.html"

            window.open(url1, "1:1 popup", windowStatus);
        };

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
        document.querySelector("#email").addEventListener("input", function () {
            let email = document.querySelector("#email").value;
            let index = email.indexOf("@") 

            if (index > 0) {
                document.querySelector("#email").classList.add("is-valid");
                document.querySelector("#email").classList.remove("is-valid");
            }
            else {
                document.querySelector("#email").classList.add("is-invalid");
            }
        });

        document.querySelector("#pwd").addEventListener("input", function () {
            let pwd = document.querySelector("#pwd").value;

            let index = pwd.length;

            if (index > 10) {
                document.querySelector("#pwd").classList.add("is-valid");
                document.querySelector("#pwd").classList.remove("is-valid");
            }
            else {
                document.querySelector("#pwd").classList.add("is-invalid");
            }
        });

    </script>
    <style>
        .navbar-nav {
            flex-direction: row !important;
        }

        .modal-dialog {
            top: 50% !important;
            transform: translateY(-50%) !important;
        }

        .nav-item {
            margin: 10px 0 10px 25px !important;
        }

        .nav-link {
            font-size: 18px !important;
        }

        .input_box {
            padding: 5px 5px;
            width: 100%;
            opacity: .8;
        }

        .join_row {
            width: 100%;
            margin-bottom: 15px !important;
        }

        .email_position {
            margin-bottom: 15px !important;
        }

        .per_info {
            margin-bottom: 15px !important;
        }

        .btn-primary {
            background-color: #0d6efd;
            border-color: #0d6efd;
        }

        .btn-primary:hover {
            background-color: #2949d8;
            color: #fff;
        }

        .btn-secondary:hover {
            color: #fff;
            background-color: #565a5e;
        }

        .sign_up {
            height: 630px;
        }

        .sign_body {
            width: 310px !important;
            padding: 14px 0 !important;
        }

        h6 {
            margin-bottom: 6px !important;
        }
    </style>

</head>

<body>
	<%
		String u_id = null;
		if(session.getAttribute("u_id") != null){
			u_id = (String) session.getAttribute("u_id");
		}
// 		int pageNumber = 1;
// 		if(request.getParameter("pageNumber") != null){
// 			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
// 		}
	%>
    <div class="loading">
        <div class="spinner-loader">loading&#8230;</div>
    </div>
    <!--헤더-->
    <nav class="navbar-default show pc-size">
        <div class="container-fluid" style="padding: 0px;">
            <div class="col-xs-3" id="navbarLeft">
                <a href="index.html" class="navbar-brand">
                    <img src="https://via.placeholder.com/123x45/000000/?text=logo" alt="아이엠그라운드 로고">
                </a>
            </div>
            <div>
                <div class="col-xs-9" id="navbarRight" style="height: 70px;">
                    <div class="nav navbar-nav navbar-right search-po">

                    </div>
                    <ul class="nav navbar-nav navbar-right">
                        <li id="echo" echchk="0">
                            <a href="javascript:chat_popup()"
                                style="padding-left: 30px; border-radius: 90px 90px 90px 90px;">
                                <img src="./img/comments-solid.svg"
                                    style="width: 20px; position:absolute; left:5px; top:18px;" alt="">
                                1:1 채팅
                            </a>
                            <a href="#"
                                style="padding-left: 30px; margin-top: 10px!important; border-radius: 90px 90px 90px 90px;">
                                <img src="./img/chevron-up-solid.svg"
                                    style="width: 20px; position:absolute; left:15px; top:16px;" alt=""> TOP
                            </a>
                        </li>
                    </ul>
                    <div style="float: right;">
                        <div id="search" class="btn-group fac-btn btn btn-default btn-nav active search-UI"
                            style="cursor:default!important; padding-right: 13px;">
                            <a href="index1.html"></a>
                            <button type="submit">
                                <img src="./img/magnifying-glass-solid.svg"
                                    style="width: 15px; left: 0px; top: 0px; z-index: 10;" class="search-icon"
                                    alt="돋보기">
                            </button>
                            <input type="text" data-placement="left" id="search-input" value placeholder="게시물 검색"
                                data-toggle="tooltip" data-original-title="찾고 싶은 게시물의 제목을 입력해주세요." autocomplete="off">
                        </div>
                         <%
							if(u_id ==null){
						%>
                        <div style="float: right;">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="#" data-toggle="modal" data-target="#login">
                                        로그인
                                    </a>
                                    <div class="modal" id="login">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">로그인</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <form action="loginAction.do" class="was-validated">
                                                        <div class="form-group">
                                                            <label for="u_id">아이디 </label>
                                                            <input type="text" class="form-control" id="u_id"
                                                                placeholder="아이디 입력" name="u_id" required autofocus
                                                                style="margin: 5px 0!important;">
                                                            <div class="valid-feedback">&nbsp;</div>
                                                            <div class="invalid-feedback">아이디를 입력해주세요.
                                                            </div>
                                                        </div>
                                                        <div class="form-group" style="margin:10px 0!important;">
                                                            <label for="u_pw">비밀번호 </label>
                                                            <input type="password" class="form-control hide" id="u_pw"
                                                                placeholder="비밀번호 입력" name="u_pw" value="1234"
                                                                style="margin: 5px 0!important;">
                                                            <input type="password" class="form-control" id="u_pw"
                                                                placeholder="비밀번호 입력" name="u_pw"
                                                                style="margin: 5px 0!important;">
                                                            <div class="valid-feedback">&nbsp;</div>
                                                            <div class="invalid-feedback">비밀번호를 입력해주세요.
                                                            
                                                            </div>
                                                        </div>
                                                        <button type="submit" class="btn btn-primary"
                                                            style="margin-left:50%;">로그인</button>
                                                        <button type="button" class="btn btn-secondary"
                                                            style="margin:0 10px!important;">회원가입</button>
                                                        <button type="button" class="btn btn-light"
                                                            data-dismiss="modal" onclick="location.reload();">취소</button>
                                                    </form>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#" data-toggle="modal" data-target="#sign">회원가입</a>
                                    <div class="modal" id="sign">
                                        <div class="modal-dialog">
                                            <div class="modal-content sign_up">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">회원가입</h4>
                                                </div>
                                                <div class="modal-body sign_body">
                                                    <form action="userSignupAction.do" name="signupForm" style="">
                                                        <div class="join_row">
                                                            <h6>아이디</h6>
                                                            <input type="text" class="uid input_box" name="u_id" size=15
                                                                onchange="changeid();" placeholder="4~15자 이내로 입력해주세요"
                                                                required style="width:60%; font-size: 14px;">
                                                            <input type="hidden" name="chkid" value="0">
                                                            <button type="button" class="btn btn-small btn-primary"
                                                                name="u_id_c" size=15 onclick="checkid();"
                                                                style="float:right; font-size: 13px!important; margin-top: 2px!important;">
                                                                아이디 중복 확인</button>
                                                        </div>
                                                        <div class="join_row" style="clear: both;">
                                                            <h6>비밀번호</h6>
                                                            <input type="password" class="pwd input_box" name="u_pw"
                                                                onkeyup="chkpwd();" size=15 placeholder="영문, 숫자 조합"
                                                                required
                                                                style="width:100%; margin-bottom: 15px!important;">
                                                            <h6>비밀번호 재확인</h6>
                                                            <input type="password" class="pwd_chk input_box"
                                                                name="u_pw_c" id="pwd" onkeyup="chkpwd();" size=15
                                                                required placeholder="비밀번호 재확인"
                                                                style="width:100%; margin-top: 0px;">
                                                            <div class="valid-feedback">&nbsp;</div>
                                                            <div class="invalid-feedback">비밀번호를 확인해주세요.</div>
                                                        </div>
                                                        <input type="hidden" name="pwdchk" value="0">
                                                        <div class="divpwd"></div>
                                                        <div class=email_position>
                                                            <div class=email_position1>
                                                                <h6>이메일</h6>
                                                                <input type="text" class="email_fr input_box"
                                                                    name="u_email" size=15 required
                                                                    placeholder="javascript@java.kr">
                                                                <div class="valid-feedback">올바른 이메일 형식입니다.</div>
                                                                <div class="invalid-feedback">이메일 형식에 맞게 입력해주세요.</div>
                                                            </div>
                                                        </div>
                                                        <input type="hidden" class="email" name="email">
                                                        <div class="per_info">
                                                            <h6>이름</h6>
                                                            <input type="text" class="name input_box" name="u_name"
                                                                size=15 placeholder="홍길동" required>
                                                        </div>
                                                        <div class="per_info">
                                                            <h6>닉네임</h6>
                                                            <input type="text" class="name input_box" name="u_nickname"
                                                                size=20 placeholder="닉네임을 20자 이하로 입력해주세요" required>
                                                        </div>
                                                        <div class="per_info">
                                                            <div class="jumin1">
                                                                <h6>주민번호</h6>
                                                                <input type="text" class="jumin_num1 input_box"
                                                                    name="u_jumin1" maxlength=6 size=10
                                                                    placeholder="주민번호 앞 6자리" required pattern="[0-9]+"
                                                                    style="width: 45%; float: left;">
                                                                <span
                                                                    style="position:absolute; font-size: 25px; left: 150px;">-</span>
                                                            </div>
                                                            <div class="jumin2">
                                                            </div>
                                                            <div class="jumin3" style="margin-bottom: 10px;">
                                                                <input type="password" class="jumin_num2 input_box"
                                                                    name="u_jumin2" maxlength=7 size=10
                                                                    placeholder="주민번호 뒷 7자리" required pattern="[0-9]+"
                                                                    style="width: 45%; float: right;">
                                                            </div>
                                                            <input type="hidden" class="jumin_num" name="jumin_num">
                                                        </div>
                                                        <div class="confirm_box"
                                                            style="float: right; margin-top: 10px!important;">
                                                            <button type="button" class="btn btn-light"
                                                            data-dismiss="modal" onclick="location.reload();">취소</button>
                                                            <button type="submit" class="btn btn-small btn-primary"
                                                                onclick="checkForm()">가입하기</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <%
							}	else {
                        %>
                        <span class="center btn left-btn">
                        	<a href="#" style="cursor: pointer; color: #777; font-weight: 500; font-size: 18px; padding: 15px 0 15px 0;" onclick="location.href='./mypage.jsp';">마이페이지</a> 
						</span> 
						<span class="center btn right-btn">
							<a href="logoutAction.do" style="cursor: pointer; color: #777; font-weight: 500; font-size: 18px; padding: 15px 0 15px 0;">로그아웃</a>
						</span>
					<%
						}
                   	%>
                    </div>
                </div>
            </div>
    </nav>
    <!--fixed 헤더-->
    <nav class="navbar-default hide-header hide affix">
        <div class="container-fluid" style="padding: 0px;">
            <div class="col-xs-3" id="navbarLeft">
                <a href="index.html" class="navbar-brand">
                    <img src="https://via.placeholder.com/123x45/000000/?text=logo" alt="아이엠그라운드 로고">
                </a>
            </div>
            <div class="col-xs-9" id="navbarRight" style="border-bottom: 1px solid #dcdcdc;">
                <div class="navbar-right" style="position: absolute; right: 180px;">
                    <div class="btn-group fac-btn">
                        <div id="search" class="btn btn-default btn-nav active search-UI"
                            style="cursor:default!important;">
                            <a href="index1.html"></a>
                            <button type="submit">
                                <img src="./img/magnifying-glass-solid.svg"
                                    style="width: 15px; left: 0px; top: 0px; z-index: 10;" class="search-icon"
                                    alt="돋보기">
                            </button>
                            <input type="text" data-placement="left" id="search-input" value placeholder="게시물 검색"
                                data-toggle="tooltip" data-original-title="찾고 싶은 게시물의 제목을 입력해주세요." autocomplete="off">
                        </div>
                    </div>
                </div>
                <ul class="nav navbar-nav navbar-right" style="width: 180px; height:70px;">
                    <li id="echo" echchk="0">
                        <a href="./chatting.html" style="padding-left: 30px; border-radius: 90px 90px 90px 90px;"
                            onclick="window.open(this.href, '_blank', 'width=300, height=600'); return false;">
                            <img src="./img/comments-solid.svg"
                                style="width: 20px; position:absolute; left:5px; top:16px;" alt="">
                            1:1 채팅
                        </a>
                        <a href="#"
                            style="padding-left: 30px; margin-top: 10px!important; border-radius: 90px 90px 90px 90px;">
                            <img src="./img/chevron-up-solid.svg"
                                style="width: 20px; position:absolute; left:15px; top:16px;" alt=""> TOP
                        </a>
                    </li>
                </ul>

            </div>
        </div>
    </nav>
    <div id="pageContainer" class="container-fluid" style="padding: 0px; width:1200px;">
        <div class="col-xs-3">
            <div id="leftContainer" class="col-xs-12 affix-top hide-tab" style="height: 929px;">
                <div class="menu-container">
                    <div class="col-sm-12 title">
                        <ul class="depth1">
                            <li><a href="#" class="white">게시판1</a>
                                <ul class="depth2">
                                    <li><a href="#" class="white">ㄱ</a></li>
                                    <li><a href="#" class="white">ㄴ</a></li>
                                    <li><a href="#" class="white">ㄷ</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="white">게시판2</a>
                                <ul class="depth2">
                                    <li><a href="#" class="white">ㄹ</a></li>
                                    <li><a href="#" class="white">ㅁ</a></li>
                                    <li><a href="#" class="white">ㅂ</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="white">게시판3</a>
                                <ul class="depth2">
                                    <li><a href="#" class="white">ㅅ</a></li>
                                    <li><a href="#" class="white">ㅇ</a></li>
                                    <li><a href="#" class="white">ㅈ</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="white">게시판4</a>
                                <ul class="depth2">
                                    <li><a href="#" class="white">ㅊ</a></li>
                                    <li><a href="#" class="white">ㅋ</a></li>
                                    <li><a href="#" class="white">ㅌ</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-9">
            <div id="rightContainer" class="col-xs-12" style="min-height: 929px;">
                <div class="title main-title">
                    <h3 class="title-name">전체 글</h3>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-space"></div>
    <footer id="footer">
        <div class="row">
            <div id="footerLeft" class="col-xs-4">
                <a href="/">
                    <img src="https://via.placeholder.com/85x41/000000/?text=logo" alt="로고">
                </a>
                <div>Copyright © 2016, MEMER.D Co., Ltd.</div>
            </div>
            <div id="footerMid" class="col-xs-4">
                <div>
                    <a href="https://iamground.kr/footer/privacyPolice">개인정보 보호 정책</a>
                </div>
                <div>
                    <a href="https://iamground.kr/footer/accessTerm">이용 약관</a>
                </div>
                <div>
                    <a href="https://iamground.kr/footer/ZUCK">회사 소개 | 광고문의</a>
                </div>
            </div>
            <div id="footerRight" class="col-xs-4">
                <p>주식회사 미머디&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp대표자 : 차성욱&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp사업자 등록번호 : 801 88
                    00089(통신판매업 신고번호: 2019-대전유성-0239)</p>
                <p>주소 : 대전광역시 유성구 대덕대로 582, 4층 402호(도룡동, 옥토빌딩)</p>
                <p>고객문의 : 카카오톡 검색 - 아이엠그라운드 ( 10시-23시 )</p>
                <p>대표번호 : 070-7825-3300 ( 평일 10:00-19:30 )</p>
            </div>
        </div>
    </footer>
    <div id="template">

    </div>
    <script type="text/javascript">
        var SERVER = {};

        SERVER.time = 1661669719709.2;
        SERVER.timestamp = 1661669719709.2;
        SERVER.service = 'fut';
    </script>
    <script type='text/javascript' src='./js/lib.min.js'></script>
    <script type='text/javascript' src='./js/search.min.js'></script>
</body>

</html>