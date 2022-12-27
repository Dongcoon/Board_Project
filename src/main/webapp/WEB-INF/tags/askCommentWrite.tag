<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${member.mid=='admin'}">
<tr>
   <td colspan="3"><input type="text" name="accontent" required="required"></td>
   <td><input type="submit" class="btn btn-success" value="답글 쓰기"></td>
</tr>
</c:if>
<c:if test="${member.mid!='admin'}">
<tr>
   <td colspan="3"><input type="text" name="accontent" required="required" placeholder="관리자만 작성이 가능합니다." style="color: red"></td>
   <td><input type="submit" class="btn btn-success" value="답글 쓰기" disabled="disabled"></td>
</tr>
</c:if>