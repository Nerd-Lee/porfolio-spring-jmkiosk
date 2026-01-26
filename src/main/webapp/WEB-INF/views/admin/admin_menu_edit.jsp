<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메뉴 정보 수정 - 관리자</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Pretendard', sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .edit-container {
            background: white;
            width: 95%;
            max-width: 450px;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.05);
            box-sizing: border-box;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
            font-size: 1.4rem;
        }

        .input-label {
            display: block;
            font-size: 0.9rem;
            font-weight: 600;
            color: #666;
            margin-bottom: 8px;
            margin-left: 4px;
        }

        .input-field {
            width: 100%;
            padding: 14px;
            margin-bottom: 20px;
            border: 1px solid #e1e4e8;
            border-radius: 12px;
            font-size: 1rem;
            box-sizing: border-box;
            background-color: #fdfdfd;
            transition: all 0.2s ease;
        }

        .input-field:focus {
            border-color: #3498db;
            background-color: #fff;
            outline: none;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.1);
        }

        .btn-group {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }

        button {
            flex: 1;
            padding: 15px;
            border: none;
            border-radius: 12px;
            font-size: 1rem;
            font-weight: 700;
            cursor: pointer;
            transition: 0.2s;
        }

        .update-btn {
            background: #2c3e50;
            color: white;
        }

        .update-btn:active {
            transform: scale(0.97);
        }

        .cancel-btn {
            background: #e9ecef;
            color: #495057;
        }

        /* 배지 스타일 (현재 수정중인 ID 표시) */
        .id-badge {
            display: inline-block;
            padding: 4px 10px;
            background: #f1f3f5;
            color: #868e96;
            border-radius: 6px;
            font-size: 0.8rem;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

    <div class="edit-container">
        <span class="id-badge">메뉴 번호 #${menu.id}</span>
        <h2>메뉴 정보 수정</h2>
        
        <form action="/admin/menu/update" method="post">
            <input type="hidden" name="id" value="${menu.id}">
            
            <label class="input-label">메뉴명</label>
            <input type="text" name="name" class="input-field" value="${menu.name}" placeholder="메뉴 이름을 입력하세요" required>
            
            <label class="input-label">가격 (원)</label>
            <input type="number" name="price" class="input-field" value="${menu.price}" placeholder="가격을 입력하세요" required>
            
            <label class="input-label">카테고리 설정</label>
            <select name="category" class="input-field">
                <option value="커피" ${menu.category == '커피' ? 'selected' : ''}>☕ 커피</option>
                <option value="에이드" ${menu.category == '에이드' ? 'selected' : ''}>🍹 에이드</option>
                <option value="디저트" ${menu.category == '디저트' ? 'selected' : ''}>🍰 디저트</option>
                <option value="티" ${menu.category == '티' ? 'selected' : ''}>🍵 티</option>
            </select>
            
            <div class="btn-group">
                <button type="submit" class="update-btn">수정 완료</button>
                <button type="button" class="cancel-btn" onclick="history.back()">취소</button>
            </div>
        </form>
    </div>

</body>
</html>