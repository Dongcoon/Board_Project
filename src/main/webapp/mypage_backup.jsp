<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kr.co.tj.model.vo.*"%>
<%@ taglib prefix="hc" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="mypage" class="kr.co.tj.model.vo.MemberVO" scope="request"/>

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

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
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
            //1.입력한 이메일 값을 읽어옴
            let email = document.querySelector("#email")/*=this*/.value;
            //2.이메일 형식에 맞는지 확인
            let index = email.indexOf("@") //@문자열이 몇 번째 인덱스에 있는지

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
        function signin_popup() {

            var width = 600;
            var height = 500;

            var left = Math.ceil((window.screen.width - width) / 2);
            var top = Math.ceil((window.screen.height - height) / 2);

            var windowStatus = 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top + ',location = no, scrollbars=no, status=no, resizable=no, titlebar=no';

            const url2 = "./sign_in.html"

            window.open(url2, "sign_in popup", windowStatus);
        };

        function signup_popup() {

            var width = 600;
            var height = 680;

            var left = Math.ceil((window.screen.width - width) / 2);
            var top = Math.ceil((window.screen.height - height) / 2);

            var windowStatus = 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top + ', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';

            const url3 = "./sign_up.html"

            window.open(url3, "sign_up popup", windowStatus);
        };

    </script>
    <style>
        body {
            overflow-y: hidden !important;
        }

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

        #btn-group>li+li::before {
            content: "";
            position: absolute;
            width: 1px;
            height: 12px;
            top: 6px;
            margin-left: -9px;
            border-radius: 0.5px;
            background: #bebbbb;
        }

        tr td {
            padding: 20px 0 20px 20px !important;
        }

        tr td:first-child {
            background: rgb(233, 233, 233);
            width: 20%;
        }

        tr td:last-child {
            width: 80%;
        }

        tr td input {
            width: 100%;
            border: none;
        }

        tr td input:first-child {
            border: none;
        }

        .info_table {
            width: 100%;
        }

        .info_table tr {
            border-top: 1px solid #999;
        }

        .info_table tr:last-child {
            border-bottom: 1px solid #999;
        }
    </style>

</head>

<body>
	<%
		String u_id = null;
		if(session.getAttribute("u_id") != null){
			u_id = (String) session.getAttribute("u_id");
		}
	%>
    <div class="loading">
        <div class="spinner-loader">loading&#8230;</div>
    </div>
    <!--헤더-->
    <nav class="navbar-default show pc-size">
        <div class="container-fluid" style="padding: 0px;">
            <div class="col-xs-3" id="navbarLeft">
                <a href="index.html" class="navbar-brand">
                    <img src="./img/logo1.png" alt="로고">
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
                                style="padding-left: 30px; margin-top: 10px!important; border-radius: 90px 90px 90px 90px; display: none;">
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
                        <span class="center btn left-btn"><a href="javascript:signup_popup()"
                                style="cursor: pointer; color: #777; font-weight: 500; font-size: 18px; padding: 15px 0 15px 0;">회원
                                가입</a>
                        </span>
                        <span class="center btn right-btn"><a href="javascript:signin_popup()"
                                style="cursor: pointer; color: #777; font-weight: 500; font-size: 18px; padding: 15px 0 15px 0; ">로그인</a>
                        </span>
                    </div>
                </div>
            </div>
    </nav>
    <!--fixed 헤더-->
    <nav class="navbar-default hide-header hide affix">
        <div class="container-fluid" style="padding: 0px;">
            <div class="col-xs-3" id="navbarLeft">
                <a href="index.html" class="navbar-brand">
                    <img src="./img/logo1.png" alt="로고">
                </a>
            </div>
            <div class="col-xs-9" id="navbarRight" style="border-bottom: 1px solid #dcdcdc;">

                <ul class="nav navbar-nav navbar-right" style="height:70px;margin-right: 0!important;">
                    <li id="echo" echchk="0">
                        <a href="./chatting.html" style="padding-left: 30px; border-radius: 90px 90px 90px 90px;"
                            onclick="window.open(this.href, '_blank', 'width=300, height=600'); return false;">
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
                                style="width: 15px; left: 0px; top: 0px; z-index: 10;" class="search-icon" alt="돋보기">
                        </button>
                        <input type="text" data-placement="left" id="search-input" value placeholder="게시물 검색"
                            data-toggle="tooltip" data-original-title="찾고 싶은 게시물의 제목을 입력해주세요." autocomplete="off">
                    </div>
                    <span class="center btn left-btn"><a href="javascript:signup_popup()"
                            style="cursor: pointer; color: #777; font-weight: 500; font-size: 18px; padding: 15px 0 15px 0;">회원
                            가입</a>
                    </span>
                    <span class="center btn right-btn"><a href="javascript:signin_popup()"
                            style="cursor: pointer; color: #777; font-weight: 500; font-size: 18px; padding: 15px 0 15px 0; ">로그인</a>
                    </span>
                </div>
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
                    <h3 class="title-name">마이페이지</h3>
                </div>
                <div>
                    <table class="info_table">
                        <tr>
                            <td>아이디</td>
                            <td>
                                <input type="text" value="${mypage.u_id}" readonly>
                            </td>
                          
                        </tr>
                        <tr>
                            <td>비밀번호 변경하기</td>
                            <td>
                                <input type="password" name="u_pw" value="${mypage.u_pw}" placeholder="변경하실 비밀번호를 입력해주세요" >
                            </td>
                        </tr>
                        <tr>
                            <td>이메일</td>
                            <td>
                                <input type="text" value="${mypage.u_email}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td>이름</td>
                            <td>
                                <input type="text" value="${mypage.u_name}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td>닉네임</td>
                            <td>
                                <input type="text" name="u_nickname" value="${mypage.u_nickname}" placeholder="변경하실 닉네임을 입력해주세요" >
                            </td>
                        </tr>
                        <tr>
                            <td>가입일</td>
                            <td>
                                <input type="text" value="${mypage.u_date}" readonly>
                            </td>
                        </tr>
                    </table>
                    <div style="position: relative; float: right; margin-top: 15px!important;">
                        <button type="submit" class="btn btn-primary" style="width: 100px; ">수정완료</button>
                        <button type="submit" class="btn btn-danger"
                            style="width: 100px; margin-right: 10px!important;">회원탈퇴</button>
                    </div>
                </div>
                <!---->
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