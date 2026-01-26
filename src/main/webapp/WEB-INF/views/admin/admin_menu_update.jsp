<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메뉴 관리 리스트</title>
    <style>
        body { font-family: 'Pretendard', sans-serif; background-color: #f8f9fa; margin: 0; padding: 20px; color: #333; }
        .container { max-width: 1000px; margin: 0 auto; }
        h2 { text-align: center; color: #2c3e50; margin-bottom: 25px; }

        /* 테이블 기본 디자인 */
        .admin-table { width: 100%; border-collapse: collapse; background: white; border-radius: 15px; overflow: hidden; box-shadow: 0 4px 15px rgba(0,0,0,0.05); }
        .admin-table thead { background-color: #2c3e50; color: white; }
        .admin-table th, .admin-table td { padding: 15px; text-align: center; border-bottom: 1px solid #eee; }
		/* 이미지가 있을 때와 없을 때 공통 크기 유지 */
		.menu-img, .no-img-box {
		    width: 60px;
		    height: 60px;
		    border-radius: 8px;
		    display: inline-flex;
		    align-items: center;
		    justify-content: center;
		}

		/* 이미지 없을 때 상자 디자인 */
		.no-img-box {
		    background-color: #e9ecef;
		    color: #adb5bd;
		    font-size: 0.7rem;
		    line-height: 1.2;
		    text-align: center;
		    border: 1px solid #dee2e6;
		}

        /* 버튼 스타일 */
        .btn { padding: 8px 15px; border: none; border-radius: 8px; cursor: pointer; font-size: 0.9rem; font-weight: 600; transition: 0.2s; }
        .edit-btn { background-color: #3498db; color: white; margin-right: 5px; }
        .delete-btn { background-color: #e74c3c; color: white; }
        .back-btn { background-color: #95a5a6; color: white; width: 100%; margin-top: 20px; padding: 15px; }
        .btn:active { transform: scale(0.95); }

        /* 모바일 반응형 (테이블을 카드로 변환) */
        @media (max-width: 768px) {
            .admin-table thead { display: none; } /* 헤더 숨김 */
            .admin-table, .admin-table tbody, .admin-table tr, .admin-table td { display: block; width: 100%; }
            .admin-table tr { margin-bottom: 15px; padding: 15px; box-sizing: border-box; border: 1px solid #eee; border-radius: 15px; position: relative; }
            .admin-table td { text-align: left; padding: 5px 0 5px 100px; border: none; position: relative; min-height: 30px; }
            
            /* 이미지 위치 고정 */
            .admin-table td:nth-child(2) { padding: 0; margin-bottom: 10px; text-align: center; }
			.menu-img, .no-img-box {
			        width: 80px;
			        height: 80px;
			    }

            /* 라벨 붙이기 */
            .admin-table td:not(:nth-child(2)):before {
                content: attr(data-label);
                position: absolute; left: 0; width: 90px; font-weight: bold; color: #7f8c8d;
            }
            .admin-table td:last-child { text-align: right; padding-left: 0; margin-top: 10px; border-top: 1px solid #f1f3f5; padding-top: 15px; }
        }
    </style>
</head>
<body>

<div class="container">
    <h2>메뉴 관리 리스트</h2>

    <table class="admin-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>이미지</th>
                <th>카테고리</th>
                <th>메뉴명</th>
                <th>가격</th>
                <th>관리</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="menu" items="${menuList}">
                <tr>
                    <td data-label="ID">${menu.id}</td>
					<td>
					    <c:choose>
					        <c:when test="${not empty menu.image_url}">
					            <img src="${menu.image_url}" class="menu-img" alt="메뉴 이미지">
					        </c:when>
					        
					        <c:otherwise>
					            <div class="no-img-box">이미지가<br>없습니다</div>
					        </c:otherwise>
					    </c:choose>
					</td>
                    <td data-label="카테고리">${menu.category}</td>
                    <td data-label="메뉴명"><strong>${menu.name}</strong></td>
                    <td data-label="가격">${menu.price}원</td>
                    <td>
                        <button class="btn edit-btn" onclick="location.href='/admin/menu/edit/${menu.id}'">수정</button>
                        <button class="btn delete-btn" onclick="deleteMenu(${menu.id})">삭제</button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <button class="btn back-btn" onclick="location.href='/admin/menu'">홈으로 돌아가기</button>
</div>

<script>
function deleteMenu(id) {
    if(confirm("정말 이 메뉴를 삭제하시겠습니까?\n삭제된 메뉴는 복구할 수 없습니다.")) {
        location.href = "/admin/menu/delete/" + id;
    }
}
</script>

</body>
</html>