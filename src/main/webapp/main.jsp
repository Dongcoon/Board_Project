<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="bList" class="java.util.ArrayList" scope="request"/>

<!DOCTYPE html>
<html lang="ko">
<jsp:include page='head.html'/>
<body>
<jsp:include page='header.jsp'/>
	  	<%
			String u_id = null;
			if(session.getAttribute("u_id") != null){
				u_id = (String) session.getAttribute("u_id");
			}
// 			System.out.println("u_id="+u_id);
		%>
		<%--
        String login = null;
        if(session.getAttribute("login") != null){
            login = (String) session.getAttribute("login");
        }
   		 --%>

<div id="pageContainer" class="container-fluid" style="padding: 0px; width:1200px;">
	<jsp:include page='left.html'/>
	<div class="col-xs-9">
	    <div id="rightContainer" class="col-xs-12" style="min-height: 929px;">
	        <div class="title main-title">
	            <h3 class="title-name">
					<%-- <input name="login" type="hidden" value="<%= login %>"> --%>
		            <c:if test="${category == ''}">    
					    전체글                            
					</c:if>                               
					<c:if test="${category != ''}">    
					    ${category}                    
					</c:if>                            
					<c:if test="${sub_category != ''}">
					    &nbsp;:&nbsp; ${sub_category}  
					</c:if>   
	            </h3>
	        </div>
			<div class="container"  style="padding:0px!important;">
				<div class="row">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th style="background-color: #eeeeee; text-align: center;">번호</th>
								<th style="background-color: #eeeeee; text-align: center;">제목</th>
								<th style="background-color: #eeeeee; text-align: center;">작성자</th>
								<th style="background-color: #eeeeee; text-align: center;">작성일</th>
								<th style="background-color: #eeeeee; text-align: center;">조회수</th>
							</tr>
						</thead>
						<tbody>
						
						<c:forEach var="v" items="${bList}">
							<tr>
								<td>${v.b_no}</td>
								<td style="text-align: left"><a href="boardViewOneAction.do?category=${v.category}&sub_category=${v.sub_category}&pageNum=${pageNum}&b_no=${v.b_no}" style= "color:black;">${v.b_title}</a></td>
								<td>${v.b_writer}</td>
								<td>${v.b_date}</td>
								<td>${v.b_readcount}</td>
							</tr>
						</c:forEach>
		
						</tbody>
					</table>
					
					<%-- 페이지처리 --%>			
					<div>
					<table width="100%" border="0">
                    <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
                    <tr>
                        <td>
                        
                        <%-- 페이지처리 --%>            
                        <c:if test="${printPage[0] > 10}">
                            <a href="boardViewAllAction.do?category=${category}&sub_category=${sub_category}&pageNum=${printPage[0]-10}" style="color:black"><b>이전</b></a>&nbsp;&nbsp;
                        </c:if>                
                        <c:forEach var="p" items="${printPage}">
                            <c:if test="${p > 0}">
                                <c:if test="${p == pageNum}">
                                    <b>${p}</b>&nbsp;&nbsp;
                                </c:if>
                                <c:if test="${p != pageNum}">
                                    <a style="color: gray" href="boardViewAllAction.do?category=${category}&sub_category=${sub_category}&pageNum=${p}" style="color:black">${p}</a>&nbsp;&nbsp;
                                </c:if>
                            </c:if>
                        </c:forEach>
                        <c:if test="${printPage[0]+10 < totalPage}">
                            <a href="boardViewAllAction.do?category=${category}&sub_category=${sub_category}&pageNum=${printPage[0]+10}" style="color:black"><b>다음</b></a>&nbsp;&nbsp;
                        </c:if>
                        <%-- 페이지처리 끝 --%>
                        </td>
                        <td>
                            <div style="text-align: right">
                            <button type="button" class="btn btn-primary pull-right" onClick="write_page()" style="width:100px; margin-right:0px!important;">글쓰기</button>
                            </div>
                        </td>
                    </tr>
                    </table>
					</div>	
		
					<script>
					    function write_page(){
					        var login_id = "${u_id}";
					        if(login_id == null || login_id == ""){
					            alert("로그인 후 사용하실 수 있습니다.");
					            //location.href="index.jsp";
					        }else{
					            location.href="write.jsp";
					        };
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