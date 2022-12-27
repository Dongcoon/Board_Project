<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<jsp:include page='head.html' />
<body>
	<jsp:include page='header.jsp' />
	<%
		String u_id = null;
		if(session.getAttribute("u_id") != null){
			u_id = (String) session.getAttribute("u_id");
		}
	%>

	<div id="pageContainer" class="container-fluid"
		style="padding: 0px; width: 1200px;">
		<jsp:include page='left.html' />

		<div class="col-xs-9">
			<form name="letterForm" action="letterDeleteAction.do" method="post">
				<div id="rightContainer" class="col-xs-12"
					style="min-height: 929px;">
					<div class="title main-title"
						style="padding-left: 15px !important;">
						<select name="whether" onChange="letterkind();" id="whether"
							style="font-size: 18px !important; font-weight: 500;">
							<option value="received" id="received1">받은</option>
							<option value="sent" id="sent1">보낸</option>
						</select>
						<h3 class="title-name">쪽지함</h3>

					</div>
					<table class="table table-striped"
						style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th style="background-color: #eeeeee; text-align: center;"></th>
								<th style="background-color: #eeeeee; text-align: center;">제목</th>
								<th style="background-color: #eeeeee; text-align: center;">내용</th>
								<th style="background-color: #eeeeee; text-align: center;">보낸
									사람</th>
								<th style="background-color: #eeeeee; text-align: center;">받는사람</th>
								<th style="background-color: #eeeeee; text-align: center;">전송일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<c:forEach var="ll" items="${LList}">
									<tr>
										<td><input type="checkbox" name="letter_no_arr"
											value="${ll.l_no}"></td>
										<td onclick="openLetter('${ll.l_no}');">${ll.l_title }</td>
										<td onclick="openLetter('${ll.l_no}');">${ll.l_content }</td>
										<td onclick="openLetter('${ll.l_no}');">${ll.l_sender }</td>
										<td onclick="openLetter('${ll.l_no}');">${ll.l_receiver}</td>
										<td onclick="openLetter('${ll.l_no}');">${ll.l_date }</td>
									</tr>
								</c:forEach>
							</tr>
						</tbody>
					</table>
					<div style="float:right; margin-top:10px!important;">
						<button class="btn-danger" type="button" value="삭제" style="width:100px; padding:5px;" onclick="deleteLetter();">삭제</button>
						<button class="btn-primary" name="wirteLetter" type="button" onClick="writeLetter();" style="width:100px; margin-left:10px!important;padding:5px;">쪽지쓰기</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
	    $(function () {
	    	var searchData = $(location).attr('search').split('=')[1];
	    	$("[name=whether]").val(searchData);
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
    </script>

	<jsp:include page='footer.html' />
</body>
</html>