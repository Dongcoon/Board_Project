<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kr.co.tj.model.vo.*"%>
<%@page import="java.io.PrintWriter"%>
<jsp:useBean id="bData" class="kr.co.tj.model.vo.BoardVO" scope="request"/>

<!DOCTYPE html>
<html>
<jsp:include page='head.html'/>
<body>
<jsp:include page='header.jsp'/>
<div id="pageContainer" class="container-fluid" style="padding: 0px; width:1200px;">
	<jsp:include page='left.html'/>
	<div class="col-xs-9">
	    <div id="rightContainer" class="col-xs-12" style="min-height: 929px;">
	        <div class="title main-title">
	            <h3 class="title-name">게시글 수정</h3>
	        </div>
	
		<%
			String u_id = null;
			if (session.getAttribute("u_id") != null) {
				u_id = (String) session.getAttribute("u_id");
			}
			if (u_id ==null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('로그인을 하세요.')");
				script.println("location.href='login.jsp'");
				script.println("</script>");
			}
	// 		int b_no = 0;
	// 		if (bData.getB_no() != null ) {
				int b_no = bData.getB_no();
				System.out.println("update.jsp 로그 : b_no="+b_no);
			//}
			if (b_no == 0) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 글입니다.')");
				script.println("location.href='index.jsp'");
				script.println("</script>");
			}
			if (u_id.equals(bData.getU_id())){
				System.out.println("update.jsp 로그 : 사용자가 작성자와 일치함");
			} else {
				System.out.println("update.jsp 로그 : 사용자가 작성자와 일치하지 않음");
				System.out.println("접속자 : "+u_id+", 작성자 : "+bData.getB_writer());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('권한이 없습니다.')");
				script.println("location.href='boardViewAllAction.do'");
				script.println("</script>");
			}
		%>

			<div class="container">
				<div class="row">
				<form action="boardUpdateAction.do?b_no=${bData.b_no}" method="post">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 수정 양식</th>
							</tr>
							<tr>
								<th>category</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td> <input type="text" class="form-control" placeholder="글 제목" name="b_title" maxlength="50" value="${bData.b_title}"></td>
							</tr>
							<tr>	
								<td> <textarea class="form-control" placeholder="글 내용" name="b_content" maxlength="2048" style="height: 350px;" value="${bData.b_content}">${bData.b_content}</textarea></td>
							</tr>
						</tbody>
					</table>
					<input type="hidden" name="b_readcount" value="${bData.b_readcount}">
					<input type="submit" class="btn btn-primary pull-right" value="글수정">
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page='footer.html'/>
</body>
</html>