<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>키오스크 포트폴리오</title>
	<link href="/static/css/kiosk_menu_main.css" rel="stylesheet" type="text/css">
	<script src="/static/js/kiosk_menu_main.js"></script>
</head>
<body>
	<nav class="category-tabs">
	    <button class="tab-btn active" onclick="filterCategory('all')">전체</button>
	    <button class="tab-btn" onclick="filterCategory('커피')">커피</button>
	    <button class="tab-btn" onclick="filterCategory('음료')">음료</button>
	    <button class="tab-btn" onclick="filterCategory('디저트')">디저트</button>
		<button class="tab-btn" onclick="filterCategory('티')">티</button>
	</nav>
	<main>
		<section class="menu-grid">
			<c:forEach var="menu" items="${menuList}">
		    	<div class="menu-card" data-category="${menu.category}">
					<div class="menu-img-container">
						<c:choose>
							<c:when test="${not empty menu.image_url}">
								<img src="${menu.image_url}" alt="${menu.name}" class="menu-image">
							</c:when>
							<c:otherwise>
								<div class="no-image">No Image</div>
							</c:otherwise>
						</c:choose>
					</div>
					
			        <div class="category">${menu.category}</div>
			        <div class="name">${menu.name}</div>
			        <div class="price">${menu.price}원</div>
			        <button class="add-btn" onclick="addToCart('${menu.name}', ${menu.price})">담기</button>
		        </div>
		    </c:forEach>
		</section>
		<section class="cart-bar">
			<div class="cart-content">
				<div class="cart-header">
					<span class="cart-title">선택한 메뉴</span>
					<button class="clear-btn" onclick="clearCart()">전체취소</button>
				</div>
				
				<div id="cart-items" class="cart-items-list">
					<p id="empty-msg">메뉴를 선택하세요.</p>
				</div>
				
				<div class="cart-footer">
					<div class="total-section">
						총 금액: <span id="total-amount">0</span>원
					</div>
					<div class="action-buttons">
						<button class="cancel-btn" onclick="orderCancel()">취소</button>
						<button class="pay-btn" onclick="processOrder()">결제하기</button>
					</div>
				</div>
			</div>
		</section>
	</main>
</body>
</html>
