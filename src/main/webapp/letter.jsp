<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>쪽지 보내기</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js "></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
	function selfCloseSubmit(){
		document.writeLetter.action = "letterWriteAction.do";
    	document.writeLetter.submit();
	 	window.open("about:blank", "_self").close();
	}
</script>
<style>
	*{
	margin:0!important;
	padding:0!important;
	}
</style>
</head>
<body>
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
		<div class="container bootstrap snippet">
			<div class="row">
				<div class="col-xs-12">
					<div class="portlet portlet-default">
						<div class="portlet-heading">
							<div class="portlet-title">
								<h4>
									<i class="fa fa-circle text-green"></i>쪽지 작성
								</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						<form id="writeLetter" name="writeLetter" action="letterWriteAction.do" method="post">
							<div class="portlet-footer">
								<div class="row">
									<div class="form-group col-xs-4">
										보내는 사람 : <%=u_nickname%>
										받는 사람 : <input type="text" name="l_receiver" maxlength="20">
										<input type="text" name="l_sender" value="<%=u_id%>"/>
									</div>
								</div>
								<div class="row" style="height: 90px">
									<div class="form-group col-xs-10">
										제목 : <input type="text" name="l_title" maxlength="20">
										<br>
										내용 : <textarea style="height: 80px" name="l_content"
											class="form-control" placeholder="메세지를 입력하세요" maxlength="100"></textarea>
									</div>
								</div>
							</div>
						<input id="goSubmit" type="button" value="전송" onClick="selfCloseSubmit();"/>
						</form>
					</div>
				</div>
			</div>
		</div>
	<div class="alert alert-success" id="successMassage"
		style="display: none;">
		<strong>메세지 전송에 성공하였습니다.</strong>
	</div>
	<div class="alert alert-danger" id="dangerMassage"
		style="display: none;">
		<strong>내용을 모두 입력해 주세요</strong>
	</div>
	<div class="alert alert-warning" id="warningMassage"
		style="display: none;">
		<strong>데이터베이스 내 오류가 발생했습니다.</strong>
		</div>
	</div>
</body>
</html>