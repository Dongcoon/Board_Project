<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kr.co.tj.model.vo.*"%>
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
	            <h3 class="title-name">게시판 글 보기</h3>
	        </div>
			<%
				String u_id = null;
				if(session.getAttribute("u_id") != null){
					u_id = (String) session.getAttribute("u_id");
				}
				//System.out.println("u_id="+u_id);
			%>
			<div class="container"  style="padding:0px!important;">
				<div class="row">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<thead>
						</thead>
						<tbody>
							<tr>
								<td colspan="6">글제목</td>
							</tr>
							<tr>
								<td colspan="6">${bData.b_title}</td>
							</tr>
							<tr>
								<td>작성자</td>
								<td style="--bs-table-accent-bg:#fff!important;">${bData.b_writer}</td>
								<td>작성일자</td>
								<td style="--bs-table-accent-bg:#fff!important;">${bData.b_date}</td>
								<%-- <%=bbs.getBbsDate().substring(0,11) + bbs.getBbsDate().substring(11,13)+"시"+bbs.getBbsDate().substring(14,16)+"분" %> --%>						
								<td>조회수</td>
								<td style="--bs-table-accent-bg:#fff!important;">${bData.b_readcount}</td>
							</tr>
							<tr>
								<td colspan="6" style="--bs-table-accent-bg:#ECECEC!important; min-hight: 200px; text-align: center;">내용</td>
							</tr>
							<tr>
								<td colspan="6" style="--bs-table-accent-bg:#fff!important; min-hight: 200px; text-align: left;">${bData.b_content}</td>
							</tr>
						</tbody>
					</table>
					<%-- <a href="boardViewAllAction.do?category=${bData.category}&sub_category=${bData.sub_category}&pageNum=${pageNum}" class="btn btn-primary">목록</a> --%>
					<div style="text-align: right;"><br>
                    <%
                        System.out.println(bData.getU_id());
                        if((u_id != null && u_id.equals(bData.getU_id())) || (u_id != null && u_id.equals("admin"))){
                    %>        
                   		 	<button onClick="location.href='boardUpdateViewAction.do?b_no=${bData.b_no}'" style="width:50px" class="btn btn-primary">수정</button>
                            <button onclick="delConfirm();" style="width:50px" class="btn btn-primary">삭제</button>
                            <%--<a href="boardUpdateViewAction.do?b_no=${bData.b_no}" class="btn btn-primary">수정</a>
                            <a onclick="return confirm('정말로 삭제하시겠습니까?')" href="boardDeleteAction.do?b_no=${bData.b_no}" class="btn btn-primary">삭제</a> --%>
                    <%        
                        }
                    %>
                            <button type="button" class="btn btn-primary d-inline-block mx-auto" 
                                style="font-size: 20px; width: 50px; padding: 10px;" onClick="history.back()">목록</button>
                        </div>
                        <script>
                            function delConfirm(){
                                var del = confirm('정말로 삭제하시겠습니까?');
                                
                                if (del){
                                    location.href="boardDeleteAction.do?b_no=${bData.b_no}"
                                }
                            }
                        </script>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page='footer.html'/>
</body>
</html>