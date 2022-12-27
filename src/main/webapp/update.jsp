<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				System.out.println("접속자 : "+u_id+", 작성자 : "+bData.getU_id());
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
								<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글수정 양식</th>
							</tr>
							<tr>
								<th>
								카테고리
								<select id="main" name="category" onchange="change_category()">
									<option id="" value="all">전체</option>
									<option id="music" value="music">음악</option>
									<option id="game" value="game">게임</option>
									<option id="issue" value="issue">이슈</option>
									<option id="travel" value="travel">여행</option>
								</select>
								<select id="music" name="sub_category">
									<option id="classic" value="classic">클래식</option>
									<option id="popsong" value="popsong">팝송</option>
									<option id="jazz" value="jazz">재즈</option>
								</select>
								<select id="game" name="sub_category">
									<option id="rpg" value="rpg">RPG</option>
									<option id="aos" value="aos">AOS</option>
									<option id="mobile" value="mobile">MOBILE</option>
								</select>
								<select id="issue" name="sub_category">
									<option id="human" value="human">사람</option>
									<option id="economic" value="economic">경제</option>
									<option id="it" value="it">IT</option>
								</select>
								<select id="travel" name="sub_category">
									<option id="domestic" value="domestic">국내여행</option>
									<option id="abroad" value="abroad">국외여행</option>
								</select>
								</th>
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
					<input type="button" class="btn btn-primary pull-right" value="취소" onClick="history.back()">
					</form>
				</div>
			</div>			
		</div>
	</div>
</div>
<jsp:include page='footer.html'/>
</body>
</html>
