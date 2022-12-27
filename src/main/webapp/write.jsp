<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	            <h3 class="title-name">게시글 작성</h3>
	        </div>
	  	<%
			String u_id = null;
			if(session.getAttribute("u_id") != null){
				u_id = (String) session.getAttribute("u_id");
			}
// 			System.out.println("u_id="+u_id);
		%>
		<%--
			if(u_id == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('로그인을 하세요.')");
				script.println("history.back()");
				script.println("</script>");
// 				System.out.println("write.jsp : u_id is null!");
			} 
		--%>
		
		
		
			<div class="container">
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
									<option id="category1" value="music">음악</option>
									<option id="category2" value="game">게임</option>
									<option id="category3" value="issue">이슈</option>
									<option id="category4" value="travel">여행</option>
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
								<td> <input type="text" class="form-control" placeholder="글 제목" name="b_title" maxlength="50"></td>
							</tr>
							<tr>	
								<td> <textarea class="form-control" placeholder="글 내용" name="b_content" maxlength="2048" style="height: 350px;"></textarea></td>
							</tr>
						</tbody>
					</table>
					<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
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
