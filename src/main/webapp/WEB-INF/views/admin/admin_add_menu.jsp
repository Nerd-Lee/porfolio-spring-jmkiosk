<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- JSP 상단에 taglib 확인 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<script src="<c:url value='/static/js/kiosk_menu_form.js'/>"></script>
	<title>메뉴 등록</title>
</head>
<body>
    <form action="/admin/menu/add" method="post" enctype="multipart/form-data">
		<input type="text" name="name" placeholder="메뉴명" required><br>
		<input type="number" name="price" placeholder="가격" required><br>
		
		<label>카테고리 선택:</label>
		<select name="category" required>
		    <option value="">-- 카테고리를 선택하세요 --</option>
		    <option value="커피">커피</option>
		    <option value="에이드">에이드</option>
		    <option value="디저트">디저트</option>
		    <option value="티">티</option>
		</select>
		<br>
		
		<label>메뉴 이미지</label>
		<input type="file" name="image" accept="image/*"><br>
		
		<button type="submit">등록하기</button>
		<button onclick="location.href='/admin/menu'">관리자 메뉴로 돌아가기</button>
	</form>
</body>
</html>