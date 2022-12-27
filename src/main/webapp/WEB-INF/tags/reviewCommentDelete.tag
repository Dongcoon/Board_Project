<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="mid" %>
<%@ attribute name="cnum" %>
<%@ attribute name="rnum" %>


<c:if test="${member.mid==mid}">
	<td style="color: red"><a href="r_comment_delete.do?cnum=${cnum}&rnum=${rnum}">❌</a><td>
</c:if>