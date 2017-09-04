<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 보기</title>
</head>
<body>
<c:set var="member" value="${sessionScope.member}"/>
<h1 align="center">${member.name}님 정보 보기</h1>
<br>
<center>
<form action="mupdate.do" method="post">
<table width="600" cellspacing="5" bgcolor="#99ccff">
<tr><td width="150">아이디</td>
<td width="450">
<input type="text" name="userid" value="${member.id}" readonly> </td></tr>
<tr><td>이 름</td><td>
<input type="text" name="name" readonly value="${member.name}"></td></tr>
<tr><td>암 호</td>
<td><input type="password" name="userpwd" id="userpwd" value="${member.passwd}"></td></tr>
<tr><td>암호확인</td><td>
<input type="password" name="userpwd2" id="userpwd2" value="${member.passwd}"></td></tr>
<tr><td>성 별</td>

<c:if test="${member.gender eq 'M'}">
<td><input type="radio" name="gender" value="M" checked> 남
<input type="radio" name="gender" value="F"> 여</td>
</c:if><c:if test="${member.gender ne 'M'}">
<td><input type="radio" name="gender" value="M"> 남
<input type="radio" name="gender" value="F" checked> 여</td>
</c:if>

</tr>
<tr><td>나 이</td>
<td><input type="number" min="20" max="100" name="age" id="age" value="${member.age }"></td></tr>
<tr><td>이메일</td><td>
<input type="email" name="email" value="${member.email }"></td></tr>
<tr><td>전화번호</td><td>
<input type="tel" name="phone" value="${member.phone }"></td></tr>
<c:forTokens var="addr" items="member.address" delims="," varStatus="status">
<c:if test="${status.count eq 0}">
<tr><td>우편번호</td><td>
<input type="text" name="post" size="10" value="${addr}"></td></tr>
</c:if><c:if test="${status.count eq 1}">
<tr><td>기본주소</td><td>
<input type="text" name="address1" value="${addr}"></td></tr>
</c:if><c:if test="${status.count eq 2}">
<tr><td>상세주소</td><td>
<input type="text" name="address2" value="${addr}"></td></tr>
</c:if>
</c:forTokens>
<tr><td colspan="2" align="center">
	<input type="submit" value="수정하기"> &nbsp;
	<a href="<c:url value='mdelete.do'/>">탈퇴하기</a>
</td></tr>
</table>
</form>

<br><br>

<a href="<c:url value='home.do'/>">시작페이지로 이동</a>
</center>

</body>
</html>






