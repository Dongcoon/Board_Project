<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${member.mid=='admin'}">
   <li><a href="newsWrite.jsp" class="button" style="float: right;">공지쓰기</a></li>
</c:if>