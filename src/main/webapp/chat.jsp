<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap"
	rel="stylesheet">
<title>AJAX 실시간 익명 채팅 사이트</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js "></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
	var lastID = 0;
	function submitFunction() {
		var chatName = $('u_id').val();
		var chatContent = $('#chatContent').val();
		$.ajax({
			type : "POST",
			url : "./chatSubmitServlet",
			data : {
				chatName : encodeURIComponent(chatName),
				chatContent : encodeURIComponent(chatContent)
			},
			success : function(result) {
				if (result == 1) {
					autoClosingAlert('#successMassage', 2000);
				} else if (result == 0) {
					autoClosingAlert('#dangerMassage', 2000);
				} else {
					autoClosingAlert('#warningMassage', 2000);
				}
			}
		});
		$('#chatContent').val('');
	}

	function autoClosingAlert(selector, delay) {
		var alert = $(selector).alert();
		alert.show();
		window.setTimeout(function() {
			alert.hide()
		}, delay);
	}

	function chatListFunction(type) {
		$.ajax({
			type : "POST",
			url : "./chatListServlet",
			data : {
				listType : type,
			},
			success : function(data) {
				if (data == "")
					return;
				var parsed = JSON.parse(data);
				var result = parsed.result;
				for (var i = 0; i < result.length; i++) {
					addChat(result[i][0].value, result[i][1].value,
							result[i][2].value);
				}
				lastID = Number(parsed.last);
			}
		});
	}

	function addChat(chatName, chatContent, chatTime) {
		$('#chatList')
				.append(
						'<div class="row">'
								+ '<div class="col-lg-12">'
								+ '<div class="media">'
								+ '<a class="pull-left" href="#">'
								+ '<img class="media-object img-circle" src="images/icon.jpg" alt="" style=width:30px height:30px>'
								+ '</a>' + '<div class="media-body">'
								+ '<h4 class="media-heading">' + chatName
								+ '<span class="small pull-right">' + chatTime
								+ '</span>' + '</h4>' + '<p>' + chatContent
								+ '</p>' + '</div>' + '</div>' + '</div>'
								+ '</div>' + '<hr>');
		$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
	}
	function getInfiniteChat() {
		setInterval(function() {
			chatListFunction(lastID);
		}, 1000);
	}
</script>
<style>
* {
	margin: 0 auto!important;
	padding: 0 !important;
	box-sizing:border-box;
}
</style>
</head>
<body>
	<%
	String u_id = null;
	if (session.getAttribute("u_id") != null) {
		u_id = (String) session.getAttribute("u_id");
	}
	// 		int pageNumber = 1;
	// 		if(request.getParameter("pageNumber") != null){
	// 			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	// 		}
	%>
	<div class="container">
		<div class="container bootstrap snippet">
			<div class="row">
				<div class="col-xs-12">
					<div class="portlet portlet-default">
						<div class="portlet-heading" style="height:27px;">
							<div class="portlet-title" style="padding:2px!important;">
								<h4>
									<i class="fa fa-circle text-green"></i>실시간 채팅방
								</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						<div id="chat" class="panel-collapse collapse in">
							<div id="chatList" class="portlet-body chat-widget"
								style="overflow-y: auto; width: 100%; height: 525px;"></div>
							<div class="portlet-footer" style="height:150px;">
								<div class="row" style="height:20px;">
									<div class="form-group col-xs-4">
										<div style="padding:10px!important;">
											아이디:
											<%=u_id%>
										</div>
									</div>
								</div>
								<div class="row" style="height: 110px">
									<div class="form-group col-xs-10">
										<textarea style="height: 80px;margin-left:5px!important; padding: 5px !important;"
											id="chatContent" class="form-control"
											placeholder="메세지를 입력하세요" maxlength="100"></textarea>
									</div>
									<div class="form-group col-xs-2">
										<button class="btn btn-default" type="submit" 
											onclick="submitFunction(); chatListFunction('ten');"
											style="position:relative; left:8px; bottom:-54px; width:48px; height:26px;">전송</button>
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="position:absolute!important; left:6px; bottom:7px; width:96%!important;">
			<div class="alert alert-success" id="successMassage"
				style="display: none; padding:0 0 0px 6px!important;">
				<strong>메세지 전송에 성공하였습니다.</strong>
			</div>
			<div class="alert alert-danger" id="dangerMassage" style="display: none; padding-left:6px!important;">
				<strong>내용을 입력해 주세요</strong>
			</div>
			<div class="alert alert-warning" id="warningMassage"
				style="display: none; padding-left:6px!important;">
				<strong>데이터베이스 내 오류가 발생했습니다.</strong>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			chatListFuntion('ten');
			getInfiniteChat();
		});
	</script>
</body>
</html>