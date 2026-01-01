<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form action="/admin/menu/update" method="post">
    <input type="hidden" name="id" value="${menu.id}">
    
    <label>메뉴명:</label>
    <input type="text" name="name" value="${menu.name}"><br>
    
    <label>가격:</label>
    <input type="number" name="price" value="${menu.price}"><br>
    
	<label>카테고리:</label>
	<select name="category">
	    <option value="커피" ${menu.category == '커피' ? 'selected' : ''}>커피</option>
	    <option value="에이드" ${menu.category == '에이드' ? 'selected' : ''}>에이드</option>
	    <option value="디저트" ${menu.category == '디저트' ? 'selected' : ''}>디저트</option>
	    <option value="티" ${menu.category == '티' ? 'selected' : ''}>티</option>
	</select>
    
    <button type="submit">수정완료</button>
    <button type="button" onclick="history.back()">취소</button>
</form>