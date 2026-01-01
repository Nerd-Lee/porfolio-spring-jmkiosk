<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- JSP 상단에 taglib 확인 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<form action="/admin/login" method="post">
		<h2>관리자 로그인</h2>
		<input type="text" name="id" placeholder="ID" required><br>
		<input type="password" name="password" placeholder="password" required><br>
		<c:if test="${not empty error}">
			<p style="color: red;">${error}</p>
		</c:if>
		<button type="submit">로그인</button>
		<button type="button" onclick="location.href='/'">취소</button>
	</form>
</html>