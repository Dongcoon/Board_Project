<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <script type="text/javascript">
        $(function () {
            $('#btn-group > li > a:gt(0)').css('marginLeft', '30px');
        });
    </script>
	<script type="text/javascript">
		function sendLetter(){
			var doc = document.writeLetter;
			doc.action = "letterWriteAction.do";
			let data = doc.submit();
		 	window.open("about:blank", "_self").close();
		}
	</script>
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

        input:hover {
            border: none;
        }
    </style>
</head>

<body class="bg03">
	<%
		String u_id = null;
		if(session.getAttribute("u_id") != null){
			u_id = (String) session.getAttribute("u_id");
		}
		String u_nickname = null;
		if(session.getAttribute("u_nickname") != null){
			u_nickname = (String) session.getAttribute("u_nickname");
		}
	%>
    <div class="container">
        <div class="row tm-mt-big">
            <div class="col-12 mx-auto tm-login-col">
                <div class="bg-white tm-block">
                    <div class="row" style="margin-top: 15px;">
                        <div class="col-12 text-center" style="font-size: 20px; ">
                            <span
                                style="padding-bottom: 5px; border-bottom: 2px solid #999; display: inline-block; width: 120px;"> 쪽지함</span>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-12">
                            <form action="letterWriteAction.do" method="post" class="writeLetter" name="writeLetter"
                                style="padding: 30px 30px 30px 30px;">
                                <div class="input-group">
                                    <div>
                                        <span style="margin-left: 20px;">보낸 사람</span>
                                        <i class="fa-solid fa-user"
                                            style="position: absolute; top: 13px; left: 0px; opacity: .6;"></i>
                                        <span><%=u_nickname%></span>
                                        <input type="hidden" name="l_sender" value="<%=u_id%>"/>
                                    </div>
                                    <div>
                                        <span style="margin-left: 20px;">받은 사람</span>
                                        <i class="fa-solid fa-user"
                                            style="position: absolute; top: 33px; left: 0px; opacity: .6;"></i>
                                        <input name="l_receiver" type="text" class="l_receiver" id="l_receiver"
                                            style="width: 200px; border: 1px solid #dadada; margin-left: 10px; opacity: .6; cursor:default;">
                                    </div>
                                    <div>
                                    <span style="margin-left: 20px;">제목</span>
                                    <input name="l_title" type="text" class="l_title" id="l_title"
                                            style="width: 200px; border: 1px solid #dadada; margin-left: 10px; opacity: .6; cursor:default;">
                                    </div>
                                    <textarea name="l_content" id="" cols="100" rows="5" placeholder="내용"></textarea>
                                </div>
	                            <div style="">
	                                <!-- <button type="button" class="btn-primary" style="width: 100%;" onClick="sendLetter();">보내기</button> -->
	                            	<input type="submit" class="btn-primary" style="width: 100%;" value="보내기"/>
	                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>