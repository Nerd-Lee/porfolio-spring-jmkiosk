<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 관리 - JM Kiosk</title>
    <style>
        body { font-family: 'Pretendard', sans-serif; background: #f8f9fa; margin: 0; padding: 20px; }
        .container { max-width: 800px; margin: 0 auto; background: white; padding: 20px; border-radius: 15px; box-shadow: 0 5px 15px rgba(0,0,0,0.05); }
        h2 { text-align: center; color: #2c3e50; }
        
        /* 모바일 대응 테이블 디자인 */
        table { width: 100%; border-collapse: collapse; margin-top: 20px; font-size: 0.9rem; }
        th { background: #f1f3f5; padding: 12px; text-align: center; border-bottom: 2px solid #dee2e6; }
        td { padding: 12px; text-align: center; border-bottom: 1px solid #eee; }
        
        .price { font-weight: bold; color: #2c3e50; }
        .no-data { text-align: center; padding: 50px; color: #999; }
        
        /* 버튼 스타일 */
        .back-btn { display: inline-block; margin-bottom: 20px; text-decoration: none; color: #666; font-size: 0.9rem; }
    </style>
</head>
<body>

<div class="container">
    <a href="/admin/menu" class="back-btn">← 대시보드로 돌아가기</a>
    <h2>오늘의 주문 내역</h2>

    <table>
        <thead>
            <tr>
                <th>주문번호</th>
                <th>주문시간</th>
                <th>결제금액</th>
				<th>상세보기</th>
				<th>주문취소</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${not empty orders}">
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <td>${order.order_id}</td>
                            <td><fmt:formatDate value="${order.order_date}" pattern="HH:mm:ss"/></td>
                            <td class="price"><fmt:formatNumber value="${order.total_price}" type="number"/>원</td>
							<td><button>상세보기</button></td>
							<td><button>X</button></td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="4" class="no-data">오늘 들어온 주문이 없습니다.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</div>

</body>
</html>