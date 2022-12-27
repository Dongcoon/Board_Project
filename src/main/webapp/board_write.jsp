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
    <!--아이콘-->
    <script src="https://kit.fontawesome.com/3d5c8b13e4.js" crossorigin="anonymous"></script>
    <title>2조 자바 팀 프로젝트</title>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
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
			$("select[id=music]").hide();
			$("select[id=game]").hide();
			$("select[id=issue]").hide();
			$("select[id=travel]").hide();
        });
        function change_category(){
			var id = $("select[id=main]").val();
			switch(id){
			case "all": 
				$("select[id=music]").hide();
				$("select[id=game]").hide();
				$("select[id=issue]").hide();
				$("select[id=travel]").hide();
				break;
			case "music": 
				$("select[id=music]").show();
				$("select[id=game]").hide();
				$("select[id=issue]").hide();
				$("select[id=travel]").hide();
				break;
			case "game": 
				$("select[id=music]").hide();
				$("select[id=game]").show();
				$("select[id=issue]").hide();
				$("select[id=travel]").hide();
				break;
			case "issue": 
				$("select[id=music]").hide();
				$("select[id=game]").hide();
				$("select[id=issue]").show();
				$("select[id=travel]").hide();
				break;
			case "travel": 
				$("select[id=music]").hide();
				$("select[id=game]").hide();
				$("select[id=issue]").hide();
				$("select[id=travel]").show();
				break; 
			};
		}
        function chat_popup() {

            var width = 350;
            var height = 700;

            var top = 0;
            var left = Math.ceil(window.screen.width);

            var windowStatus = 'width=' + width + ', height=' + height + ', top=' + top + ',left=' + left + ',location = no, scrollbars=no, status=no, resizable=no, titlebar=no';

            const url_chat = "./chat.jsp"

            window.open(url_chat, "1:1 popup", windowStatus);
        };

        function login_popup() {

            var width = 600;
            var height = 450;

            var left = Math.ceil((window.screen.width - width) / 2);
            var top = Math.ceil((window.screen.height - height) / 2);

            var windowStatus = 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top + ',location = no, scrollbars=no, status=no, resizable=no, titlebar=no';

            const url_login = "./login.jsp"

            window.open(url_login, "login popup", windowStatus);
        };

        function signup_popup() {

            var width = 600;
            var height = 550;

            var left = Math.ceil((window.screen.width - width) / 2);
            var top = Math.ceil((window.screen.height - height) / 2);

            var windowStatus = 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top + ', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';

            const url_signup = "./signup.jsp"

            window.open(url_signup, "signup popup", windowStatus);
            /*onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;"*/
        };

    </script>

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
                <a href="index.jsp" class="navbar-brand">
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
                            <a href="index.jsp"></a>
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
                        <span class="center btn left-btn">
                        	<a href="javascript:signup_popup()" style="cursor: pointer; color: #777; font-weight: 500; font-size: 18px; padding: 15px 0 15px 0;">회원가입</a>
                        </span>
                        <span class="center btn right-btn"><a href="javascript:login_popup()"
                                style="cursor: pointer; color: #777; font-weight: 500; font-size: 18px; padding: 15px 0 15px 0; ">로그인</a>
                        </span>
                    <%
						} else {
                    %>
                        <span class="center btn left-btn">
                        	<a href="#" style="cursor: pointer; color: #777; font-weight: 500; font-size: 18px; padding: 15px 0 15px 0;" onclick="location.href='./mypage.jsp';">마이페이지</a> 
						</span> 
						<span class="center btn right-btn">
							<a href="./logoutAction.do" style="cursor: pointer; color: #777; font-weight: 500; font-size: 18px; padding: 15px 0 15px 0;">로그아웃</a>
						</span>
					<%
						}
                   	%>
                    </div>
                </div>
            </div>
        </div>
    </nav>
   
    <!--fixed 헤더-->
    <nav class="navbar-default hide-header hide affix">
        <div class="container-fluid" style="padding: 0px;">
            <div class="col-xs-3" id="navbarLeft">
                <a href="index.jsp" class="navbar-brand">
                    <img src="https://via.placeholder.com/123x45/000000/?text=logo" alt="아이엠그라운드 로고">
                </a>
            </div>
            <div class="col-xs-9" id="navbarRight" style="border-bottom: 1px solid #dcdcdc;">
                <div class="navbar-right" style="position: absolute; right: 180px;">
                    <div class="btn-group fac-btn">
                        <div id="search" class="btn btn-default btn-nav active search-UI"
                            style="cursor:default!important;">
                            <a href="index.jsp"></a>
                            <button type="submit">
                                <img src="./img/magnifying-glass-solid.svg"
                                    style="width: 15px; left: 0px; top: 0px; z-index: 10;" class="search-icon"
                                    alt="돋보기">
                            </button>
                            <input type="text" data-placement="left" id="search-input" value placeholder="게시물 검색"
                                data-toggle="tooltip" data-original-title="찾고 싶은 게시물의 제목을 입력해주세요." autocomplete="off">
                            <!--<div class="placeSelect" id="placeSelect">
                                    <ul class="ui-autocomplete ui-front ui-menu ui-widget ui-widget-content" id="ui-id-1"
                                        tabindex="0" style="display:none;"></ul>
                                </div>-->
                        </div>
                    </div>
                </div>
                <ul class="nav navbar-nav navbar-right" style="width: 180px; height:70px;">
                    <li id="echo" echchk="0">
                        <a href="./chatt.jsp" style="padding-left: 30px; border-radius: 90px 90px 90px 90px;"
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
                    <%
						if(u_id ==null){
					%>
                        <span class="center btn left-btn">
                        	<a href="javascript:signup_popup()" style="cursor: pointer; color: #777; font-weight: 500; font-size: 18px; padding: 15px 0 15px 0;">회원가입</a>
                        </span>
                        <span class="center btn right-btn"><a href="javascript:login_popup()"
                                style="cursor: pointer; color: #777; font-weight: 500; font-size: 18px; padding: 15px 0 15px 0; ">로그인</a>
                        </span>
                    <%
						} else {
                    %>
                        <span class="center btn left-btn">
                        	<a href="#" style="cursor: pointer; color: #777; font-weight: 500; font-size: 18px; padding: 15px 0 15px 0;" onclick="location.href='./mypage.jsp';">마이페이지</a> 
						</span> 
						<span class="center btn right-btn">
							<a href="./logoutAction.do" style="cursor: pointer; color: #777; font-weight: 500; font-size: 18px; padding: 15px 0 15px 0;">로그아웃</a>
						</span>
					<%
						}
                   	%>
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
                            <li><a href="board_category.jsp?category=music" class="white">음악</a>
                                <ul class="depth2">
                                    <li><a href="board_subcategory.jsp?sub_category=classic" class="white">클래식</a></li>
                                    <li><a href="board_subcategory.jsp?sub_category=popsong" class="white">팝송</a></li>
                                    <li><a href="board_subcategory.jsp?sub_category=jazz" class="white">재즈</a></li>
                                </ul>
                            </li>
                            <li><a href="board_category.jsp?category=game" class="white">게임</a>
                                <ul class="depth2">
                                    <li><a href="board_subcategory.jsp?sub_category=rpg" class="white">RPG</a></li>
                                    <li><a href="board_subcategory.jsp?sub_category=aos" class="white">AOS</a></li>
                                    <li><a href="board_subcategory.jsp?sub_category=mobile" class="white">MOBILE</a></li>
                                </ul>
                            </li>
                            <li><a href="board_category.jsp?category=issue" class="white">이슈</a>
                                <ul class="depth2">
                                    <li><a href="board_subcategory.jsp?sub_category=human" class="white">사람</a></li>
                                    <li><a href="board_subcategory.jsp?sub_category=economic" class="white">경제</a></li>
                                    <li><a href="board_subcategory.jsp?sub_category=it" class="white">IT</a></li>
                                </ul>
                            </li>
                            <li><a href="board_category.jsp?category=travel" class="white">여행</a>
                                <ul class="depth2">
                                    <li><a href="board_subcategory.jsp?sub_category=domestic" class="white">국내여행</a></li>
                                    <li><a href="board_subcategory.jsp?sub_category=aboard" class="white">해외여행</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-9">
            <div class="container" style="padding:0px!important;"> 
		<div class="row">
		<form action="boardWriteAction.do" method="post">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
					</tr>
					<tr>
						<th>
						카테고리
						<select id="main" name="category" onchange="change_category()">
							<option id="" value="all">전체</option>
							<option id="category1" value="music">music</option>
							<option id="category2" value="game">game</option>
							<option id="category3" value="issue">issue</option>
							<option id="category4" value="travel">travel</option>
						</select>
						<select id="music" name="sub_category">
							<option id="sub_category1" value="classic">클래식</option>
							<option id="sub_category2" value="popsong">팝송</option>
							<option id="sub_category3" value="jazz">재즈</option>
						</select>
						<select id="game" name="sub_category">
							<option id="sub_category1" value="rpg">RPG</option>
							<option id="sub_category2" value="aos">AOS</option>
							<option id="sub_category3" value="mobile">MOBILE</option>
						</select>
						<select id="issue" name="sub_category">
							<option id="sub_category1" value="human">사람</option>
							<option id="sub_category2" value="economic">경제</option>
							<option id="sub_category3" value="it">IT</option>
						</select>
						<select id="travel" name="sub_category">
							<option id="sub_category1" value="domestic">국내여행</option>
							<option id="sub_category2" value="aboard">국외여행</option>
						</select>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td> <input type="text" class="form-control" placeholder="글 제목" name="b_title" maxlength="50"></td>
					</tr>
					<tr>	
						<td> <textarea class="form-control" placeholder="글 내용" name="b_content" maxlength="2048" style="height: 350px;"></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
			</form>
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