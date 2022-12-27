<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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
			<a href="index.jsp" class="navbar-brand"
				style="width: 220px; display: block; margin: 5px 0 5px 40px !important; padding: 0px !important; height: 60px !important;">
				<img src="./img/logo1.png" alt="로고"
				style="width: 90%; height:100%; margin-left:8px!important;">
			</a>
		</div>
		<div>
			<div class="col-xs-9" id="navbarRight" style="height: 70px;">
				<div class="nav navbar-nav navbar-right search-po"></div>
				<ul class="nav navbar-nav navbar-right">
					<li id="echo" echchk="0"><a href="javascript:chat_popup()"
						style="padding-left: 30px; border-radius: 90px 90px 90px 90px;">
							<img src="./img/comments-solid.svg"
							style="width: 20px; position: absolute; left: 5px; top: 18px;"
							alt=""> 1:1 채팅
					</a> <a href="#"
						style="padding-left: 30px; margin-top: 10px !important; border-radius: 90px 90px 90px 90px;">
							<img src="./img/chevron-up-solid.svg"
							style="width: 20px; position: absolute; left: 15px; top: 16px;"
							alt=""> TOP
					</a></li>
				</ul>
				<div style="float: right;">
					<div id="search"
						class="btn-group fac-btn btn btn-default btn-nav active search-UI"
						style="cursor: default !important; padding-right: 13px;">
						<form action="boardSearchAction.do" method="get">
							<button type="submit">
								<img src="./img/magnifying-glass-solid.svg"
									style="width: 15px; left: 0px; top: 0px; z-index: 10;"
									class="search-icon" alt="돋보기">
							</button>
							<input type="text" name="search" data-placement="left"
								id="search-input" value placeholder="게시물 검색"
								data-toggle="tooltip"
								data-original-title="찾고 싶은 게시물의 제목을 입력해주세요." autocomplete="off">
						</form>
					</div>
					<%
						if(u_id ==null){
					%>
					<span class="center btn left-btn"> <a
						href="javascript:signup_popup()"
						style="cursor: pointer; color: #777; font-weight: 500; font-size: 18px; padding: 15px 0 15px 0;">회원가입</a>
					</span> <span class="center btn right-btn" onclick="login_popup();"><a
						href="#in_pop"
						style="cursor: pointer; color: #777; font-weight: 500; font-size: 18px; padding: 15px 0 15px 0;">로그인</a>
					</span>
					<%
						} else {
                    %>
					<span class="center btn left-btn"> <a
						href="letterViewAllAction.do?whether=received"
						style="cursor: pointer; color: #777; font-weight: 500; font-size: 18px; padding: 15px 0 15px 0;">쪽지함</a>
					</span> <span class="center btn left-btn"> <a
						href="mypageAction.do"
						style="cursor: pointer; color: #777; font-weight: 500; font-size: 18px; padding: 15px 0 15px 0;">마이페이지</a>
					</span> <span class="center btn right-btn"> <a
						href="logoutAction.do"
						style="cursor: pointer; color: #777; font-weight: 500; font-size: 18px; padding: 15px 0 15px 0;">로그아웃</a>
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
            <a href="index.jsp" class="navbar-brand"
                style="width: 220px; display:block; margin: 5px 0 5px 40px!important; padding: 0px!important; height: 60px!important;">
                <img src="./img/logo1.png" alt="로고" style="width: 90%; height:100%; margin-left:8px!important;">
            </a>
        </div>
        <div class="col-xs-9" id="navbarRight" style="border-bottom: 1px solid #dcdcdc;">
            <ul class="nav navbar-nav navbar-right" style="height:70px;margin-right: 0!important;">
                <li id="echo" echchk="0">
                    <a href="./chat.jsp" style="padding-left: 30px; border-radius: 90px 90px 90px 90px;"
                        onclick="window.open(this.href, '_blank', 'width=300, height=600'); return false;">
                        <img src="./img/comments-solid.svg" style="width: 20px; position:absolute; left:5px; top:18px;"
                            alt="">
                        1:1 채팅
                    </a>
                    <a href="#"
                        style="padding-left: 30px; margin-top: 10px!important; border-radius: 90px 90px 90px 90px;">
                        <img src="./img/chevron-up-solid.svg"
                            style="width: 20px; position:absolute; left:15px; top:16px;" alt=""> TOP
                    </a>
                    <% if(u_id==null){ %>
                </li>
            </ul>
            <div style="float: right;">
                <div id="search" class="btn-group fac-btn btn btn-default btn-nav active search-UI"
                    style="cursor:default!important; padding-right: 13px;">
                    <a href="index.jsp"></a>
                    <button type="submit">
                        <img src="./img/magnifying-glass-solid.svg"
                            style="width: 15px; left: 0px; top: 0px; z-index: 10;" class="search-icon" alt="돋보기">
                    </button>
                    <input type="text" data-placement="left" id="search-input" value placeholder="게시물 검색"
                        data-toggle="tooltip" data-original-title="찾고 싶은 게시물의 제목을 입력해주세요." autocomplete="off">
                </div>
                <span class="center btn left-btn"><a href="javascript:signup_popup()"
                        style="cursor: pointer; color: #777; font-weight: 500; font-size: 18px; padding: 15px 0 15px 0;">회원가입</a>
                </span>
                <span class="center btn right-btn"><a href="javascript:login_popup()"
                        style="cursor: pointer; color: #777; font-weight: 500; font-size: 18px; padding: 15px 0 15px 0; ">로그인</a>
                </span>
                <% } else { %>
                </li>
            </ul>
                <div style="float: right;">
                <div id="search" class="btn-group fac-btn btn btn-default btn-nav active search-UI"
                    style="cursor:default!important; padding-right: 13px;">
                    <a href="index.jsp"></a>
                    <button type="submit">
                        <img src="./img/magnifying-glass-solid.svg"
                            style="width: 15px; left: 0px; top: 0px; z-index: 10;" class="search-icon" alt="돋보기">
                    </button>
                    <input type="text" data-placement="left" id="search-input" value placeholder="게시물 검색"
                        data-toggle="tooltip" data-original-title="찾고 싶은 게시물의 제목을 입력해주세요." autocomplete="off">
                </div>
                <span class="center btn left-btn"> <a href="letterViewAllAction.do?whether=received"
                            style="cursor: pointer; color: #777; font-weight: 500; font-size: 18px; padding: 15px 0 15px 0;">쪽지함</a>
                    </span> <span class="center btn left-btn"> <a href="mypageAction.do"
                            style="cursor: pointer; color: #777; font-weight: 500; font-size: 18px; padding: 15px 0 15px 0;">마이페이지</a>
                    </span> <span class="center btn right-btn"> <a href="logoutAction.do"
                            style="cursor: pointer; color: #777; font-weight: 500; font-size: 18px; padding: 15px 0 15px 0;">로그아웃</a>
                    </span>
                    <% } %>
            </div>
        </div>
    </div>
</nav>
