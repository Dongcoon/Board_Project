<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="mid" %>
<%@ attribute name="rnum" %>


<c:if test="${member.mid==mid}">
	<li><a href="r_delete.do?rnum=${rnum}" style="color: red">삭제</a></li>
	<li><a href="r_delete.do?rnum=${rnum}" style="color: red">수정</a></li>
	
</c:if>