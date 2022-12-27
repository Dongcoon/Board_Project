<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${member.mid!=null}">
	<div id="reviewWrite" style="text-align: right" >
		<a class="button primary" href="reviewWrite.jsp">리뷰 작성</a>
	</div>
</c:if>