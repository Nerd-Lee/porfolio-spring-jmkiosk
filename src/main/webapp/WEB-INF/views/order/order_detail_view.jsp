<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 품목 확인</title>
    <style>
        body { font-family: 'Pretendard', sans-serif; background-color: #f1f3f5; margin: 0; padding: 20px; }
        .list-container { max-width: 500px; margin: 0 auto; }
        .list-header { font-size: 1.2rem; font-weight: 700; margin-bottom: 15px; color: #495057; }

        .item-card {
            background: white;
            border-radius: 15px;
            padding: 15px;
            margin-bottom: 12px;
            display: flex; /* 가로 정렬 */
            align-items: center;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        /* 이미지 영역 */
        .item-img-container {
            width: 70px;
            height: 70px;
            margin-right: 15px;
            flex-shrink: 0; /* 이미지 크기 유지 */
        }

        .item-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 10px;
            background-color: #f8f9fa;
        }

        /* 이미지가 없을 때의 박스 */
        .no-img-placeholder {
            width: 100%;
            height: 100%;
            background-color: #e9ecef;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.65rem;
            color: #adb5bd;
            text-align: center;
            border: 1px solid #dee2e6;
        }

        /* 텍스트 정보 영역 */
        .item-content {
            flex-grow: 1; /* 남은 공간 모두 차지 */
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .item-info .name { font-size: 1rem; font-weight: 600; color: #2c3e50; }
        .item-info .details { font-size: 0.85rem; color: #868e96; margin-top: 3px; display: block; }

        .item-price { text-align: right; }
        .price-val { font-size: 1rem; font-weight: 700; color: #2c3e50; }
        .quantity-badge {
            display: inline-block;
            background: #e7f5ff;
            color: #228be6;
            padding: 2px 6px;
            border-radius: 4px;
            font-size: 0.75rem;
            font-weight: 700;
            margin-top: 4px;
        }
    </style>
</head>
<body>

    <div class="list-container">
        <div class="list-header">📦 주문 상세 내역</div>

        <c:choose>
            <c:when test="${not empty items}">
                <c:forEach var="item" items="${items}">
                    <div class="item-card">
                        <div class="item-img-container">
                            <c:choose>
                                <c:when test="${not empty item.image_url}">
                                    <img src="${item.image_url}" class="item-img" alt="${item.menu_name}">
                                </c:when>
                                <c:otherwise>
                                    <div class="no-img-placeholder">IMAGE<br>READY</div>
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <div class="item-content">
                            <div class="item-info">
                                <span class="name">${item.menu_name}</span>
                                <span class="details">단가: <fmt:formatNumber value="${item.price}" />원</span>
                            </div>
                            <div class="item-price">
                                <span class="price-val">
                                    <fmt:formatNumber value="${item.price * item.quantity}" />원
                                </span><br>
                                <span class="quantity-badge">${item.quantity}개</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="no-data" style="text-align: center; padding: 50px; color: #adb5bd;">
                    <p>내역이 없습니다.</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

</body>
</html>