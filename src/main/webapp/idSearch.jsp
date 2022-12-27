<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--아이콘-->
    <script src="https://kit.fontawesome.com/3d5c8b13e4.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <link rel="shortcut icon" href="./img/2team.png" type="image/x-icon">
    <!-- 구글 웹폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap"
        rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <script type="text/javascript" href="./js/popup.js"></script>

    <title>아이디 찾기</title>
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
            background-image: url(https://ssl.pstatic.net/static/nid/login/m_sp_01_login_008d5216.png);
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
                        <div class="col-12 text-center">
                            <img alt="logo" src="./img/logo1.png" onclick="location.replace('./login.jsp')"
                                class="logo">
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-12">
                            <form action="idSearchAction.do" method="post" class="loginForm" name="idSearchForm"
                                style="padding: 30px 30px 30px 30px;">
                                <div class="input-group">
                                    <i class="fa-solid fa-user"
                                        style="position: absolute; top: 17px; left: 12px; opacity: .6;"></i>
                                    <input name="u_name" type="text" class="admin_id" id="admin_id" placeholder="이름"
                                        style="width: 100%; padding: 10px 10px 10px 35px; border-radius: 10px 10px 10px 10px; border: 1px solid #dadada; border-bottom: none; opacity: .6;">
                                </div>
                                <div class="input-group">
                                    <i class="fa-solid fa-user"
                                        style="position: absolute; top: 17px; left: 12px; opacity: .6;"></i>
                                    <input name="u_jumin1" maxlength=6 type="text" class="admin_id" id="admin_id" placeholder="주민등록번호 앞"
                                        style="width: 50%; padding: 10px 10px 10px 35px; border-radius: 10px 10px 10px 10px; border: 1px solid #dadada; border-bottom: none; opacity: .6;">
                                    <input name="u_jumin2" maxlength=7 type="password" class="admin_id" id="admin_id" placeholder="주민등록번호 뒤"
                                        style="width: 50%; padding: 10px 10px 10px 35px; border-radius: 10px 10px 10px 10px; border: 1px solid #dadada; border-bottom: none; opacity: .6;">
                                </div>
                                <div class="input-group mt-3" style="width: 100%;">
                                    <button type="submit" class="btn btn-primary d-inline-block mx-auto" name="login"
                                        style="font-size: 20px; width: 100%; padding: 10px;">찾기</button>
                                </div>
                            </form>
                            <div class="input-group mt-3" style="width:100%;">
                                <ul id="btn-group" style="width: 100%; text-align: center; padding:0!important;">
                                    <li>
                                        <a href="login.jsp">로그인</a>
                                    </li>
                                    <li>
                                        <a href="signup.jsp" style="">회원가입</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="row tm-mt-big">
            <div class="col-12 font-weight-light text-center">
                <p class="d-inline-block tm-bg-black text-white py-2 px-4" style="color: #000!important;">
                </p>
            </div>
        </footer>
    </div>
</body>
</html>