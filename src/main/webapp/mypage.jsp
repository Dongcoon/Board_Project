<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kr.co.tj.model.vo.*"%>
<%@ taglib prefix="hc" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="mypage" class="kr.co.tj.model.vo.MemberVO" scope="request"/>

<!DOCTYPE html>
<html lang="ko">

<jsp:include page='head.html'/>
<body>
<jsp:include page='mypage_header.jsp'/>
    <div id="pageContainer" class="container-fluid" style="padding: 0px; width:1200px;">
    	<jsp:include page='left.html'/>
        
        <div class="col-xs-9">
            <div id="rightContainer" class="col-xs-12" style="min-height: 929px;">
                <div class="title main-title">
                    <h3 class="title-name">마이페이지</h3>
                </div>
                <div>
                	<form action="userUpdateAction.do" method="post">
                    <table class="info_table">
                        <tr>
                            <td>아이디</td>
                            <td>
                                <input type="text" name="u_id" value="${mypage.u_id}" readonly>
                            </td>
                          
                        </tr>
                        <tr>
                            <td>비밀번호 변경하기 <br>(*수정가능)</td>
                            <td>
                                <input type="password" name="u_pw" value="${mypage.u_pw}" placeholder="변경하실 비밀번호를 입력해주세요" >
                            </td>
                        </tr>
                        <tr>
                            <td>이메일</td>
                            <td>
                                <input type="text" value="${mypage.u_email}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td>이름</td>
                            <td>
                                <input type="text" value="${mypage.u_name}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td>닉네임 <br>(*수정가능)</td>
                            <td>
                                <input type="text" name="u_nickname" value="${mypage.u_nickname}" placeholder="변경하실 닉네임을 입력해주세요" >
                            </td>
                        </tr>
                        <tr>
                            <td>가입일</td>
                            <td>
                                <input type="text" value="${mypage.u_date}" readonly>
                            </td>
                        </tr>
                    </table>
                    <div style="position: relative; float: right; margin-top: 15px!important;">
                        <button type="submit" class="btn btn-primary" style="width: 100px; ">수정완료</button>
                        <button type="button" class="btn btn-danger" style="width: 100px; margin-right: 10px!important;" 
                        	onClick='deleteConfirm("${mypage.u_id}")'>회원탈퇴</button>
                        
                    </div>
                    </form>
                    <link rel="stylesheet" href="./css/mypage.css">
                    <script>
	                    function deleteConfirm(u_id){
	                		var del = confirm("정말로 삭제하시겠습니까?");
	                		if (del){
	                			location.href = 'userDeleteAction.do?u_id='+u_id;
	                		}
	                	}
                    </script>
                </div>
                <!---->
            </div>
        </div>
    </div>
<jsp:include page='footer.html'/>
</body>
</html>